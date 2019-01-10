/*
* Filename : Forward.scala
* Date     : 08-01-2019
* Author   : SunnyChen
*
* Forward control unit, resovle the EX-MEM hazard and EX-WB hazard
* */

package riscv_mini_five_stage

import Forward._
import chisel3._
import chisel3.util.Cat

object Forward {
  // Forward A signal
  val Forward_A_rs1       = 0.U(2.W)
  val Forward_A_mem_wb_rd = 1.U(2.W)
  val Forward_A_ex_mem_rd = 2.U(2.W)

  // Forward B signal
  val Forward_B_rs1       = 0.U(2.W)
  val Forward_B_mem_wb_rd = 1.U(2.W)
  val Forward_B_ex_mem_rd = 2.U(2.W)
}

class Forwardio extends Bundle with Config {
  val ex_mem_Reg_Write = Input(UInt(REGWRITE_SIG_LEN.W))
  val ex_mem_rd        = Input(UInt(REG_LEN.W))
  val mem_wb_Reg_Write = Input(UInt(REGWRITE_SIG_LEN.W))
  val mem_wb_rd        = Input(UInt(REG_LEN.W))
  val id_ex_rs1        = Input(UInt(REG_LEN.W))
  val id_ex_rs2        = Input(UInt(REG_LEN.W))

  val Forward_A        = Output(UInt(FORWARD_A_SIG_LEN.W))
  val Forward_B        = Output(UInt(FORWARD_B_SIG_LEN.W))
}

class Forward extends Module with Config {
  val io = IO(new Forwardio)

  val ex_mem_a_con = io.ex_mem_Reg_Write.toBool() &&
                     io.ex_mem_rd =/= 0.U         &&
                     (io.ex_mem_rd === io.id_ex_rs1)
  val ex_wb_a_con  = io.mem_wb_Reg_Write.toBool() &&
                     io.mem_wb_rd =/= 0.U         &&
                     !ex_mem_a_con                &&
                     (io.mem_wb_rd === io.id_ex_rs1)
  val ex_mem_b_con = io.ex_mem_Reg_Write.toBool() &&
                     io.ex_mem_rd =/= 0.U         &&
                     (io.ex_mem_rd === io.id_ex_rs2)
  val ex_wb_b_con  = io.mem_wb_Reg_Write.toBool() &&
                     io.mem_wb_rd =/= 0.U         &&
                     !ex_mem_b_con                &&
                     (io.mem_wb_rd === io.id_ex_rs2)

  io.Forward_A := Cat(ex_mem_a_con, ex_wb_b_con)
  io.Forward_B := Cat(ex_mem_b_con, ex_wb_b_con)
}
