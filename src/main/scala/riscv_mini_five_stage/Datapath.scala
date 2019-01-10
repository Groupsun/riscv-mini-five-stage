/*
* Filename : Datapath.scala
* Date     : 05-01-2019
* Author   : SunnyChen
*
* Datapath of the processor, include multiplxers and control components
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util.MuxLookup
import Control._

class IF_datapathio extends Bundle with Config {
  val if_pc             = Input(UInt(WLEN.W))
  val if_new_pc         = Output(UInt(WLEN.W))
  val if_pc_4           = Output(UInt(WLEN.W))
}

class EX_datapathio extends Bundle with Config {
  val ex_rs1_out      = Input(UInt(WLEN.W))
  val ex_rs2_out      = Input(UInt(WLEN.W))
  val ex_imm          = Input(UInt(WLEN.W))
  val ex_pc           = Input(UInt(WLEN.W))
  val ex_ALU_Src      = Input(UInt(ALU_SRC_SIG_LEN.W))
  val ex_Branch       = Input(UInt(BRANCH_SIG_LEN.W))
  val ex_alu_conflag  = Input(UInt(CONFLAG_SIGLEN.W))
  val ex_Branch_Src   = Input(UInt(BRANCH_SRC_SIG_LEN.W))
  val ex_Jump_Type    = Input(UInt(JUMP_TYPE_SIG_LEN.W))

  val alu_b_src         = Output(UInt(WLEN.W))
  val ex_aui_pc         = Output(UInt(WLEN.W))
}

class WB_datapathio extends Bundle with Config {
  val wb_alu_sum        = Input(UInt(WLEN.W))
  val wb_dataout        = Input(UInt(WLEN.W))
  val wb_pc_4           = Input(UInt(WLEN.W))
  val wb_imm            = Input(UInt(WLEN.W))
  val wb_aui_pc         = Input(UInt(WLEN.W))
  val wb_Mem_to_Reg     = Input(UInt(REG_SRC_SIG_LEN.W))
  val wb_reg_writedata  = Output(UInt(WLEN.W))
}

class Datapathio extends Bundle with Config {
  val if_datapathio = new IF_datapathio
  val ex_datapathio = new EX_datapathio
  val wb_datapathio = new WB_datapathio
}

class Datapath extends Module with Config {
  val io = IO(new Datapathio)

  /* IF stage */
  // generate increment PC
  val PC_4 = io.if_datapathio.if_pc + 4.U
  io.if_datapathio.if_pc_4 := PC_4

  // calculate branch address
  val ex_branch_addr = Mux(io.ex_datapathio.ex_Branch_Src.toBool(), io.ex_datapathio.ex_rs1_out, io.ex_datapathio.ex_pc) +
    io.ex_datapathio.ex_imm.asUInt()
  io.ex_datapathio.ex_aui_pc := ex_branch_addr

  // generate next PC
  val PC_Src = Mux(io.ex_datapathio.ex_Jump_Type.toBool(), 1.U, io.ex_datapathio.ex_alu_conflag) &
    io.ex_datapathio.ex_Branch
  io.if_datapathio.if_new_pc := Mux(PC_Src.toBool(), ex_branch_addr, PC_4)

  /* EX stage */

  // select ALU oprand B source
  io.ex_datapathio.alu_b_src := Mux(io.ex_datapathio.ex_ALU_Src.toBool(),
    io.ex_datapathio.ex_imm, io.ex_datapathio.ex_rs2_out)

  /* MEM stage */
  // generate the PC_Src signal and pass to IF stage, inside the datapath module

  /* WB stage */
  // generate the data write back to the register file
  io.wb_datapathio.wb_reg_writedata := MuxLookup(
    io.wb_datapathio.wb_Mem_to_Reg, io.wb_datapathio.wb_alu_sum, Seq(
      RegWrite_ALU    -> io.wb_datapathio.wb_alu_sum,
      RegWrite_Mem    -> io.wb_datapathio.wb_dataout,
      RegWrite_PC_4   -> io.wb_datapathio.wb_pc_4,
      RegWrite_imm    -> io.wb_datapathio.wb_imm,
      RegWrite_ipc    -> io.wb_datapathio.wb_aui_pc
    ))
}

object Datapath extends App {
  chisel3.Driver.execute(args, () => new Datapath)
}
