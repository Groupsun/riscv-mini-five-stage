/*
* Filename : Datapath.scala
* Date     : 05-01-2019
* Author   : SunnyChen
*
* Datapath of the processor, include multiplxers and control components
* 05-01-2019 - IF, ID, EX stage datapath
* */

package riscv_mini_five_stage

import chisel3._

class IF_datapathio extends Bundle with Config {
  val if_pc_branch_addr = Input(UInt(WLEN.W))
  val if_pc             = Input(UInt(WLEN.W))
  val if_new_pc         = Output(UInt(WLEN.W))
}

class EX_datapathio extends Bundle with Config {
  val ex_rs2_out = Input(UInt(WLEN.W))
  val ex_imm     = Input(UInt(WLEN.W))
  val ex_pc      = Input(UInt(WLEN.W))
  val ex_ALU_Src = Input(UInt(ALU_SRC_SIG_LEN.W))

  val ex_branch_addr = Output(UInt(WLEN.W))
  val alu_b_src      = Output(UInt(WLEN.W))
}

class MEM_datapathio extends Bundle with Config {
  val mem_Branch = Input(UInt(BRANCH_SIG_LEN.W))
  val mem_Zero = Input(UInt(ZERO_SIG_LEN.W))
}

class WB_datapathio extends Bundle with Config {
  val wb_alu_sum        = Input(UInt(WLEN.W))
  val wb_dataout        = Input(UInt(WLEN.W))
  val wb_Mem_to_Reg     = Input(UInt(REG_SRC_SIG_LEN.W))
  val wb_reg_writedata  = Output(UInt(WLEN.W))
}

class Datapathio extends Bundle with Config {
  val if_datapathio = new IF_datapathio
  val ex_datapathio = new EX_datapathio
  val mem_datapathio = new MEM_datapathio
  val wb_datapathio = new WB_datapathio
}

class Datapath extends Module with Config {
  val io = IO(new Datapathio)

  /* IF stage */
  // generate increment PC
  val PC_4 = io.if_datapathio.if_pc + 4.U

  // generate next PC
  val PC_Src = io.mem_datapathio.mem_Zero & io.mem_datapathio.mem_Branch
  io.if_datapathio.if_new_pc := Mux(PC_Src.toBool(), io.if_datapathio.if_pc_branch_addr, PC_4)

  /* EX stage */
  // calculate branch address
  val shift_imm = io.ex_datapathio.ex_imm << 1.U
  io.ex_datapathio.ex_branch_addr := io.ex_datapathio.ex_pc + shift_imm.asUInt()

  // select ALU oprand B source
  io.ex_datapathio.alu_b_src := Mux(io.ex_datapathio.ex_ALU_Src.toBool(),
    io.ex_datapathio.ex_imm, io.ex_datapathio.ex_rs2_out)

  /* MEM stage */
  // generate the PC_Src signal and pass to IF stage, inside the datapath module

  /* WB stage */
  // generate the data write back to the register file
  io.wb_datapathio.wb_reg_writedata := Mux(io.wb_datapathio.wb_Mem_to_Reg.toBool(),
    io.wb_datapathio.wb_dataout, io.wb_datapathio.wb_alu_sum)
}

object Datapath extends App {
  chisel3.Driver.execute(args, () => new Datapath)
}
