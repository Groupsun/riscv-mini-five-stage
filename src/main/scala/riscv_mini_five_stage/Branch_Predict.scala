/*
* Filename : Branch_Predict.scala
* Date     : 15-01-2019
* Author   : SunnyChen
*
* Branch predict unit for speeding up the processor
* */

package riscv_mini_five_stage

import chisel3._
import Instructions._
import Control._
import chisel3.util.{Cat, ListLookup, MuxLookup}
import Branch_Predict_Signal._

object Branch_Predict_Signal {
  // PC_Sel
  val PC_Sel_PC_4     = 0.U(2.W)
  val PC_Sel_new_addr = 1.U(2.W)
  val PC_Sel_recover  = 2.U(2.W)

  // IF/ID_Flush
  val IF_ID_Flush_False = 0.U(1.W)
  val IF_ID_Flush_True  = 1.U(1.W)

  // ID/EX_Flush
  val ID_EX_Flush_False = 0.U(1.W)
  val ID_EX_Flush_True  = 1.U(1.W)

  // 2-bit dynamic saturating counter status
  val Strong_Nottaken = 0.U(2.W)
  val Weak_Nottaken   = 1.U(2.W)
  val Strong_Taken    = 2.U(2.W)
  val Weak_Taken      = 3.U(2.W)
}

class Branch_Predictio extends Bundle with Config {
  val inst          = Input(UInt(WLEN.W))
  val branch_addr   = Input(UInt(WLEN.W))
  val PC_Src        = Input(UInt(PC_SRC_SIG_LEN.W))
  val pc            = Input(UInt(WLEN.W))
  val ex_Branch     = Input(UInt(BRANCH_SIG_LEN.W))
  val ex_Jump_Type  = Input(UInt(JUMP_TYPE_SIG_LEN.W))

  val PC_Sel      = Output(UInt(PC_SEL_SIG_LEN.W))
  val new_addr    = Output(UInt(WLEN.W))
  val pc_recover  = Output(UInt(WLEN.W))
  val IF_ID_Flush = Output(UInt(IF_ID_FLUSH_SIG_LEN.W))
  val ID_EX_Flush = Output(UInt(ID_EX_FLUSH_SIG_LEN.W))
}

class Branch_Predict extends Module with Config {
  val io = IO(new Branch_Predictio)
  val addr_buffer = Module(new Addr_Buffer)

  val current_inst_ctrl = ListLookup(io.inst, Control.default, Control.map)

  val dynamic_counter_status = RegInit(0.U(2.W))
  val pc_4 = io.pc + 4.U


  /* Conditions */
  val is_nonconditional_jump  = current_inst_ctrl(4).toBool() && (current_inst_ctrl(11) === NonConditional)
  val is_conditional_jump     = current_inst_ctrl(4).toBool() && (current_inst_ctrl(11) === Conditional)
  val noncon_addr_is_resolved = io.ex_Branch.toBool() && (io.ex_Jump_Type === NonConditional)
  val con_addr_is_resolved    = io.ex_Branch.toBool() && (io.ex_Jump_Type === Conditional)
  val noncon_flush            = noncon_addr_is_resolved
  val need_record_pc_4        = is_conditional_jump && ((dynamic_counter_status === Strong_Taken) || dynamic_counter_status === Weak_Taken)
  addr_buffer.io.record := need_record_pc_4
  addr_buffer.io.addr_input := pc_4

  /* Nonconditional jump */
  val noncon_address = Mux(noncon_addr_is_resolved, io.branch_addr, 0.U)
  val noncon_PC_Sel  = Mux(noncon_addr_is_resolved, PC_Sel_new_addr, PC_Sel_PC_4)

  /* Conditional jump */
  val update_status = Mux(con_addr_is_resolved,
    Mux(io.PC_Src.toBool(), MuxLookup(dynamic_counter_status, dynamic_counter_status, Seq(
      Strong_Nottaken -> Weak_Nottaken,
      Weak_Nottaken   -> Weak_Taken,
      Weak_Taken      -> Strong_Taken,
      Strong_Taken    -> Strong_Taken
    )), MuxLookup(dynamic_counter_status, dynamic_counter_status, Seq(
      Strong_Nottaken -> Strong_Nottaken,
      Weak_Nottaken   -> Strong_Nottaken,
      Weak_Taken      -> Weak_Nottaken,
      Strong_Taken    -> Weak_Taken
    ))), dynamic_counter_status
  )
  dynamic_counter_status := update_status

  val predict_fail            = con_addr_is_resolved && (update_status === Weak_Taken || update_status === Weak_Nottaken)
  val predict_success         = con_addr_is_resolved && (update_status === Strong_Taken || update_status === Strong_Nottaken)
  val need_recover_pc         = predict_fail && ((update_status === Weak_Taken && dynamic_counter_status === Strong_Taken) ||
                                                 (update_status === Weak_Nottaken && dynamic_counter_status === Weak_Taken))

  val flush                   = noncon_flush || predict_fail

  addr_buffer.io.flush := flush

  val predict_PC_Sel = MuxLookup(dynamic_counter_status, PC_Sel_PC_4, Seq(
    Strong_Nottaken -> PC_Sel_PC_4,
    Weak_Nottaken   -> PC_Sel_PC_4,
    Weak_Taken      -> PC_Sel_new_addr,
    Strong_Taken    -> PC_Sel_new_addr
  ))

  val predict_addr = (io.pc.asSInt() + Cat(io.inst(31), io.inst(7), io.inst(30, 25), io.inst(11, 8), 0.U(2.W)).asSInt()).asUInt()

  val con_PC_Sel = Mux(predict_fail,
    Mux(need_recover_pc, PC_Sel_recover, PC_Sel_new_addr),
    PC_Sel_PC_4)

  /* Output */
  io.PC_Sel := Mux(noncon_addr_is_resolved, noncon_PC_Sel,
    Mux(con_addr_is_resolved && predict_fail, con_PC_Sel,
      Mux(is_conditional_jump, predict_PC_Sel, PC_Sel_PC_4)))

  io.new_addr   := Mux(noncon_addr_is_resolved, io.branch_addr, Mux(con_addr_is_resolved, io.branch_addr,
    Mux(is_conditional_jump, predict_addr, 0.U)))
  io.pc_recover := addr_buffer.io.front

  /* Flush IF/ID register and ID/EX register */
  io.IF_ID_Flush := Mux(flush, IF_ID_Flush_True, IF_ID_Flush_False)
  io.ID_EX_Flush := Mux(flush, ID_EX_Flush_True, ID_EX_Flush_False)

  /*
  val branch = ListLookup(io.inst, Control.default, Control.map)(4)
  val dynamic_counter_status = RegInit(0.U(2.W))
  val formal_pc_4 = RegInit(0.U(WLEN.W))
  var branch_flag = RegInit(0.U(1.W))
  val ex_is_branch = io.ex_Branch.toBool() && (io.ex_Jump_Type === Conditional)

  // Set flag
  branch_flag := Mux(branch.toBool(), 1.U, 0.U)

  // update counter_status
  val update_status = Mux(ex_is_branch,
      Mux(io.PC_Src.toBool(), MuxLookup(dynamic_counter_status, dynamic_counter_status, Seq(
      Strong_Nottaken -> Weak_Nottaken,
      Weak_Nottaken   -> Weak_Taken,
      Weak_Taken      -> Strong_Taken,
      Strong_Taken    -> Strong_Taken
    )), MuxLookup(dynamic_counter_status, dynamic_counter_status, Seq(
      Strong_Nottaken -> Strong_Nottaken,
      Weak_Nottaken   -> Strong_Nottaken,
      Weak_Taken      -> Weak_Nottaken,
      Strong_Taken    -> Weak_Taken
    ))), dynamic_counter_status
  )
  dynamic_counter_status := update_status

  val predict_fail = ex_is_branch && (update_status === Weak_Taken || update_status === Weak_Nottaken)
  val predict_success = ex_is_branch && (update_status === Strong_Taken || update_status === Strong_Nottaken)

  // calculate branch addr
  val predict_branch_addr = (io.pc.asSInt() + Cat(io.inst(31), io.inst(7), io.inst(30, 25), io.inst(11, 8), 0.U(1.W)).asSInt()).asUInt()
  val pc_4 = io.pc + 4.U

  // record formal pc_4
  val record_con = (dynamic_counter_status === Weak_Taken || dynamic_counter_status === Strong_Taken) &&
                   branch.toBool()
  formal_pc_4 := Mux(record_con, pc_4, formal_pc_4)
  io.pc_recover := formal_pc_4

  /* assume that branch never taken */
  /*
  io.PC_Sel := Mux(io.PC_Src.toBool(), PC_Sel_new_addr, PC_Sel_PC_4)
  io.new_addr := io.branch_addr

  io.IF_ID_Flush := Mux(io.PC_Src.toBool(), IF_ID_Flush_True, IF_ID_Flush_False)
  io.ID_EX_Flush := Mux(io.PC_Src.toBool(), ID_EX_Flush_True, ID_EX_Flush_False)
  */

  /* dynamic branch predict use 2-bit saturating counter (global) */
  /*
  val temp_sel = Mux(io.PC_Src.toBool(), PC_Sel_new_addr,
    Mux(branch.toBool(), MuxLookup(dynamic_counter_status, PC_Sel_PC_4,
        Seq(
          Strong_Nottaken -> PC_Sel_PC_4,
          Weak_Nottaken   -> PC_Sel_PC_4,
          Weak_Taken      -> PC_Sel_new_addr,
          Strong_Taken    -> PC_Sel_new_addr
        )
      ), PC_Sel_PC_4
    )
  )
  val temp_new_addr = Mux(io.PC_Src.toBool(), io.branch_addr,
    Mux(branch.toBool(), MuxLookup(dynamic_counter_status, pc_4,
        Seq(
          Strong_Nottaken -> pc_4,
          Weak_Nottaken   -> pc_4,
          Weak_Taken      -> predict_branch_addr,
          Strong_Taken    -> predict_branch_addr
        )
      ), pc_4
    )
  )

  val need_to_recover = predict_fail && ((dynamic_counter_status === Strong_Taken) || (dynamic_counter_status === Weak_Taken))

  val temp_sel_2 = Mux(need_to_recover, PC_Sel_recover, temp_sel)

  // Nonconditional branch
  val nonconditional_branch = io.ex_Jump_Type === NonConditional && io.ex_Branch.toBool()
  val temp_sel_3 = Mux(predict_success, PC_Sel_PC_4, temp_sel_2)
  io.PC_Sel := Mux(nonconditional_branch, PC_Sel_new_addr, temp_sel_3)
  io.new_addr := Mux(nonconditional_branch, io.branch_addr, temp_new_addr)

  io.IF_ID_Flush := Mux(predict_fail || nonconditional_branch, IF_ID_Flush_True, IF_ID_Flush_False)
  io.ID_EX_Flush := Mux(predict_fail || nonconditional_branch, ID_EX_Flush_True, ID_EX_Flush_False)
  */
  */
}
