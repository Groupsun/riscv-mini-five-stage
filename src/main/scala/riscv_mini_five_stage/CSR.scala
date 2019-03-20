/*
* Filename : CSR.scala
* Date     : 14-03-2019
* Author   : SunnyChen
*
* Control and status registers of the processor, only in M-mode
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util._
import Instructions._
import Control._
import Branch_Predict_Signal._

object CSR {
  // is_Exception Signal
  val is_Exception_False = 0.U(2.W)
  val is_Exception_MEPC  = 1.U(2.W)
  val is_Exception_MTVEC = 2.U(2.W)

  // CSR addrs
  val mstatus_addr    = 0x300.U(12.W)
  val mie_addr        = 0x304.U(12.W)
  val mtvec_addr      = 0x305.U(12.W)
  val mepc_addr       = 0x341.U(12.W)
  val mcause_addr     = 0x342.U(12.W)
  val mtval_addr      = 0x343.U(12.W)
  val mip_addr        = 0x344.U(12.W)
  val mtime_addr      = 0x700.U(12.W)
  val mtimeh_addr     = 0x701.U(12.W)
  val mtimecmp_addr   = 0x702.U(12.W)
  val mtimecmph_addr  = 0x703.U(12.W)
  val mcycle_addr     = 0xB00.U(12.W)
  val mcycleh_addr    = 0xB80.U(12.W)
  val minstret_addr   = 0xB02.U(12.W)
  val minstreth_addr  = 0xB82.U(12.W)

  // mstatus bits index

}

// Exceptions
object Cause {
  // Exceptions
  val InstructionAddrMisaligned = 0x0.U
  val IllegalInstruction        = 0x2.U
  val LoadAddressMisaligned     = 0x4.U
  val StoreAddressMisaligned    = 0x6.U

  // Interrupts
  val MachineTimerInterrupt     = 0x7.U
}

class CSRio extends Bundle with Config {
  val ex_Mem_Read    = Input(UInt(MEM_READ_SIG_LEN.W))
  val ex_Mem_Write   = Input(UInt(MEM_WRITE_SIG_LEN.W))
  val ex_branch_addr = Input(UInt(WLEN.W))
  val ex_addr        = Input(UInt(WLEN.W))
  val ex_inst        = Input(UInt(WLEN.W))
  val csr_data_in    = Input(UInt(WLEN.W))
  val ex_pc_4        = Input(UInt(WLEN.W))
  val ex_Write_CSR   = Input(UInt(WRITE_CSR_SIG_LEN.W))
  val ex_is_Illegal  = Input(UInt(IS_ILLEGAL_SIG_LEN.W))
  val ex_Branch      = Input(UInt(BRANCH_SIG_LEN.W))
  val PC_Sel         = Input(UInt(PC_SEL_SIG_LEN.W))
  val new_addr       = Input(UInt(WLEN.W))
  val pc_recover     = Input(UInt(WLEN.W))
  val Bubble         = Input(UInt(BUBBLE_SIG_LEN.W))
  val if_inst        = Input(UInt(WLEN.W))
  val is_Waiting_Resolved = Input(UInt(1.W))
  //val Predict_Failed = Input(UInt(PREDICT_FAILED_SIG_LEN.W))

  val mepc_out        = Output(UInt(WLEN.W))
  val mtvec_out       = Output(UInt(WLEN.W))
  val csr_data_out    = Output(UInt(WLEN.W))
  val IF_ID_Flush     = Output(UInt(IF_ID_FLUSH_SIG_LEN.W))
  val ID_EX_Flush     = Output(UInt(ID_EX_FLUSH_SIG_LEN.W))
  val is_Exception    = Output(UInt(IS_EXCEPTION_SIG_LEN.W))
  val Exception_Flush = Output(UInt(EXCEPTION_FLUSH_SIG_LEN.W))
  // Monitor output
}

class CSR extends Module with Config {
  val io = IO(new CSRio)

  val csr_addr = io.ex_inst(31, 20)
  val imm_data = Cat(0.U(27.W), io.ex_inst(19, 15)).asUInt()

  val if_inst_ctrl = ListLookup(io.if_inst, Control.default, Control.map)
  val if_is_Branch         = if_inst_ctrl(4).toBool()

  val pipeline_not_stable = io.is_Waiting_Resolved === 1.U

  /* CSR registers */

  /* initial mstatus */
  val MPP   = RegInit(3.U(2.W))
  val MPIE  = RegInit(1.U(1.W))
  val MIE   = RegInit(1.U(1.W))

  val mstatus = Cat(0.U(19.W), MPP, 0.U(3.W), MPIE, 0.U(3.W), MIE, 0.U(3.W))

  /* initial mip and mie */
  val MEIP  = RegInit(0.U(1.W))
  val MTIP  = RegInit(0.U(1.W))
  val MSIP  = RegInit(0.U(1.W))

  val mip   = Cat(0.U(20.W), MEIP, 0.U(3.W), MTIP, 0.U(3.W), MSIP, 0.U(3.W))

  val MEIE  = RegInit(1.U(1.W))
  val MTIE  = RegInit(1.U(1.W))
  val MSIE  = RegInit(1.U(1.W))

  val mie   = Cat(0.U(20.W), MEIE, 0.U(3.W), MTIE, 0.U(3.W), MSIE, 0.U(3.W))

  val mtvec  = RegInit(164.U(WLEN.W))
  val mepc   = RegInit(0.U(WLEN.W))
  val mcause = RegInit(0.U(WLEN.W))
  val mtval  = RegInit(0.U(WLEN.W))

  val mtime         = RegInit(0.U(WLEN.W))
  val mtimeh        = RegInit(0.U(WLEN.W))
  val mtimecmp      = RegInit(0.U(WLEN.W))
  val mtimecmph     = RegInit(0.U(WLEN.W))
  val mcycle        = RegInit(0.U(WLEN.W))
  val mcycleh       = RegInit(0.U(WLEN.W))
  val minstret      = RegInit(0.U(WLEN.W))
  val minstreth     = RegInit(0.U(WLEN.W))

  val time = Cat(mtimeh, mtime).asUInt()
  val timecmp = Cat(mtimecmph, mtimecmp).asUInt()

  val csr_list = Seq(
    BitPat(CSR.mstatus_addr)    -> mstatus,
    BitPat(CSR.mepc_addr)       -> mepc,
    BitPat(CSR.mtvec_addr)      -> mtvec,
    BitPat(CSR.mtval_addr)      -> mtval,
    BitPat(CSR.mie_addr)        -> mie,
    BitPat(CSR.mip_addr)        -> mip,
    BitPat(CSR.mcause_addr)     -> mcause,
    BitPat(CSR.mcycle_addr)     -> mcycle,
    BitPat(CSR.mcycleh_addr)    -> mcycleh,
    BitPat(CSR.mtime_addr)      -> mtime,
    BitPat(CSR.mtimeh_addr)     -> mtimeh,
    BitPat(CSR.minstret_addr)   -> minstret,
    BitPat(CSR.minstreth_addr)  -> minstreth,
    BitPat(CSR.mtimecmp_addr)   -> mtimecmp,
    BitPat(CSR.mtimecmph_addr)  -> mtimecmph
  )


  val is_CSR_Instruction = io.ex_Write_CSR === Write_CSR_True_W  || io.ex_Write_CSR === Write_CSR_True_S  || io.ex_Write_CSR === Write_CSR_True_C
  io.ex_Write_CSR === Write_CSR_True_WI || io.ex_Write_CSR === Write_CSR_True_SI || io.ex_Write_CSR === Write_CSR_True_CI
  io.csr_data_out := Mux(is_CSR_Instruction, Lookup(csr_addr, 0.U, csr_list), 0.U).asUInt()
  val s_val = io.csr_data_out | io.csr_data_in
  val si_val = io.csr_data_out | imm_data
  val c_val = io.csr_data_out & (~io.csr_data_in).asUInt()
  val ci_val = io.csr_data_out & (~imm_data).asUInt()
  val csr_write_data = MuxLookup(io.ex_Write_CSR, 0.U, Seq(
    Write_CSR_True_W  -> io.csr_data_in,
    Write_CSR_True_WI -> imm_data,
    Write_CSR_True_S  -> s_val,
    Write_CSR_True_SI -> si_val,
    Write_CSR_True_C  -> c_val,
    Write_CSR_True_CI -> ci_val
  ))

  /* exceptions condition */
  val InstructionAddressMisaligned_con = (io.ex_branch_addr & 3.U(WLEN.W)) =/= 0.U(WLEN.W) && io.ex_Branch === Branch_True
  val IllegalInstruction_con           = io.ex_is_Illegal.toBool()
  val LoadAddressMisaligned_con        = (io.ex_addr & 3.U(WLEN.W)) =/= 0.U(WLEN.W) && io.ex_Mem_Read === Mem_Read_True
  val StoreAddressMisaligned_con       = (io.ex_addr & 3.U(WLEN.W)) =/= 0.U(WLEN.W) && io.ex_Mem_Write === Mem_Write_True
  val MachineTimerInterrupt_con        = timecmp =/= 0.U && time > timecmp
  val exception_raise                  = InstructionAddressMisaligned_con || IllegalInstruction_con || LoadAddressMisaligned_con ||
    StoreAddressMisaligned_con || MachineTimerInterrupt_con
  val is_a_exception                   = InstructionAddressMisaligned_con || IllegalInstruction_con || LoadAddressMisaligned_con ||
    StoreAddressMisaligned_con
  val is_a_interrupt                   = MachineTimerInterrupt_con
  val enable_machinetimerinterrupt     = MTIE === 1.U
  val enable_interrupt                 = enable_machinetimerinterrupt
  val enable_exception                 = MIE === 1.U && (is_a_exception || (is_a_interrupt && enable_interrupt)) && !pipeline_not_stable

  // update mcycle, mtime and mintret
  val mcycle_overflow     = mcycle.asSInt() === 0xffffffff.S(32.W)
  val mcycleh_overflow    = mcycleh.asSInt() === 0xffffffff.S(32.W)
  val mtime_overflow      = mtime.asSInt() === 0xffffffff.S(32.W)
  val mtimeh_overflow     = mtimeh.asSInt() === 0xffffffff.S(32.W)
  val minstret_overflow   = minstret.asSInt() === 0xffffffff.S(32.W)
  val minstreth_overflow  = minstreth.asSInt() === 0xffffffff.S(32.W)

  when(mcycle_overflow && mcycleh_overflow) {
    mcycle := 0.U(32.W)
    mcycleh := 0.U(32.W)
  } .elsewhen(mcycle_overflow) {
    mcycle := 0.U(32.W)
    mcycleh := mcycleh + 1.U
  } .otherwise {
    mcycle := mcycle + 1.U
  }

  when((mtime_overflow && mtimeh_overflow) || (time > timecmp && enable_exception)) {
    mtime := 0.U(32.W)
    mtimeh := 0.U(32.W)
  } .elsewhen(mtime_overflow) {
    mtime := 0.U(32.W)
    mtimeh := mtimeh + 1.U
  } .otherwise {
    mtime := mtime + 1.U
  }

  when(io.ex_inst =/= NOP && io.ex_inst =/= MRET) {
    when(minstret_overflow && minstreth_overflow) {
      minstret := 0.U(32.W)
      minstreth := 0.U(32.W)
    } .elsewhen(minstret_overflow) {
      minstret := 0.U(32.W)
      minstreth := minstreth + 1.U
    } .otherwise {
      minstret := minstret + 1.U
    }
  }

  /* Handling exceptions */

  // mepc_out and mtvec_out
  io.mepc_out     := mepc
  io.mtvec_out    := mtvec

  // flush signal
  when((exception_raise && enable_exception) || io.ex_Write_CSR === Write_CSR_Return) {
    io.IF_ID_Flush  := 1.U
    io.ID_EX_Flush  := 1.U
  } .otherwise {
    io.IF_ID_Flush  := 0.U
    io.ID_EX_Flush  := 0.U
  }

  // is_Exception signal
  when(exception_raise && enable_exception) {
    io.is_Exception := CSR.is_Exception_MTVEC
  } .elsewhen(io.ex_Write_CSR === Write_CSR_Return) {
    io.is_Exception := CSR.is_Exception_MEPC
  } .otherwise {
    io.is_Exception := CSR.is_Exception_False
  }

  when(exception_raise && enable_exception && is_a_exception) {
    io.Exception_Flush := 1.U
  } .otherwise {
    io.Exception_Flush := 0.U
  }

  // csr_data_out update
  io.csr_data_out := Lookup(csr_addr, 0.U, csr_list)

  // Deal with predict unit
  val is_predict_recover      = RegInit(0.U(2.W))
  val true_addr               = RegInit(0.U(WLEN.W))
  val predict_recover_period  = RegInit(0.U(2.W))
  val backup_recover_addr     = RegInit(0.U(WLEN.W))
  val normal_pc               = Mux(is_a_exception, io.ex_pc_4 - 4.U, io.ex_pc_4)
  val _mepc                   = MuxLookup(io.PC_Sel, normal_pc, Seq(
    PC_Sel_PC_4     -> normal_pc,
    PC_Sel_new_addr -> io.new_addr,
    PC_Sel_recover  -> io.pc_recover
  ))

  backup_recover_addr := Mux(io.PC_Sel =/= 0.U, _mepc, backup_recover_addr)

  // update predict_recover_period
  when(io.PC_Sel =/= 0.U){
    is_predict_recover := 1.U
  } .elsewhen(is_predict_recover =/= 0.U) {
    when(is_predict_recover === 2.U){
      is_predict_recover := 0.U
    } .elsewhen(io.Bubble.toBool()) {
      is_predict_recover := is_predict_recover
    } .otherwise {
      is_predict_recover := is_predict_recover + 1.U
    }
  } .otherwise {
    is_predict_recover := 0.U
  }


  when(exception_raise && enable_exception) {
    /* If exception raise, handling exception */
    /* 1. update mepc */

    // If branch predicit unit is going to recover or jump, need to store the differect address
    /*
    mepc := _mepc
    when(io.PC_Sel =/= 0.U) {

      when(if_is_Branch) {
        mepc := normal_pc
      } .otherwise {
        mepc := _mepc
      }

      mepc := _mepc
    } .elsewhen(is_predict_recover =/= 0.U) {
      mepc := backup_recover_addr
    } .otherwise {
      mepc := normal_pc
    }
    */
    mepc := normal_pc


    /* 2. update mcause
    *
    * exception priority level
    * exceptions > interrupts
    * The smaller the encoding, the higher the priority
    *
    * */

    mcause := Mux(InstructionAddressMisaligned_con, Cause.InstructionAddrMisaligned,
              Mux(IllegalInstruction_con,           Cause.IllegalInstruction,
              Mux(LoadAddressMisaligned_con,        Cause.LoadAddressMisaligned,
              Mux(StoreAddressMisaligned_con,       Cause.StoreAddressMisaligned,
              Mux(MachineTimerInterrupt_con,        Cause.MachineTimerInterrupt, mcause)))))

    /* 3. update mtval
    *
    * mtval stores the misaligned address or illegal instructions
    *
    * */
    mtval := Mux(InstructionAddressMisaligned_con, io.ex_branch_addr,
             Mux(IllegalInstruction_con, io.ex_inst,
             Mux(LoadAddressMisaligned_con || StoreAddressMisaligned_con, io.ex_addr, mtval)))

    /* 4. update mstatus */
    MPIE := MIE
    MPP := M_Mode.asUInt()
    MIE := 0.U

    /* 5. Trap to mtvec */

  } .elsewhen(io.ex_Write_CSR === Write_CSR_Return) {
    /* Return form trap */

    /* 1. update mstatus */
    MIE   := MPIE
    MPIE  := 1.U
    MPP   := M_Mode.asUInt()

    /* 2. Recover PC from mepc */
  } .elsewhen(is_CSR_Instruction) {
    when(csr_addr === CSR.mstatus_addr) {
      MIE   := csr_write_data(3)
      MPIE  := csr_write_data(7)
      MPP   := csr_write_data(12,11)
    } .elsewhen(csr_addr === CSR.mepc_addr) {
      mepc := csr_write_data
    } .elsewhen(csr_addr === CSR.mcause_addr) {
      mcause := csr_write_data
    } .elsewhen(csr_addr === CSR.mip_addr) {
      MSIP  := csr_write_data(3)
      MTIP  := csr_write_data(7)
      MEIP  := csr_write_data(11)
    } .elsewhen(csr_addr === CSR.mie_addr) {
      MSIE  := csr_write_data(3)
      MTIE  := csr_write_data(7)
      MEIE  := csr_write_data(11)
    } .elsewhen(csr_addr === CSR.mcycle_addr) {
      mcycle := csr_write_data
    } .elsewhen(csr_addr === CSR.mcycleh_addr) {
      mcycleh := csr_write_data
    } .elsewhen(csr_addr === CSR.minstret_addr) {
      minstret := csr_write_data
    } .elsewhen(csr_addr === CSR.minstreth_addr) {
      minstreth := csr_write_data
    } .elsewhen(csr_addr === CSR.mtimecmp_addr) {
      mtimecmp := csr_write_data
    } .elsewhen(csr_addr === CSR.mtimecmph_addr) {
      mtimecmph := csr_write_data
    }
  }
}

