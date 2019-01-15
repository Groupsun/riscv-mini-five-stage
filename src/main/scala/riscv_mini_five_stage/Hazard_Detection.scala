/*
* Filename : Hazard_Detection.scala
* Date     : 15-01-2019
* Author   : SunnyChen
*
* Detect the data hazards that could not resolve by forward
* */

package riscv_mini_five_stage

import chisel3._
import Control._
import chisel3.util.MuxLookup
import Hazard_Signal._

object Hazard_Signal {
  // Bubble
  val Bubble_False  = 0.U(1.W)
  val Bubble_Ture   = 1.U(1.W)

  // IF/ID register write
  val IF_ID_Write_True  = 1.U(1.W)
  val IF_ID_Write_False = 0.U(1.W)

  // PC write
  val PC_Write_True  = 1.U(1.W)
  val PC_Write_False = 0.U(1.W)
}

class Hazard_Detectionio extends Bundle with Config {
  val rs1         = Input(UInt(REG_LEN.W))
  val rs2         = Input(UInt(REG_LEN.W))
  val ex_rd       = Input(UInt(REG_LEN.W))
  val Imm_Sel     = Input(UInt(IMM_SEL_SIG_LEN.W))
  val ex_Mem_Read = Input(UInt(MEM_READ_SIG_LEN.W))

  val Bubble      = Output(UInt(BUBBLE_SIG_LEN.W))
  val IF_ID_Write = Output(UInt(IF_ID_WRITE_SIG_LEN.W))
  val PC_Write    = Output(UInt(PC_WRITE_SIG_LEN.W))
}

class Hazard_Detection extends Module with Config {
  val io = IO(new Hazard_Detectionio)

  // Condition of stalling a cycle
  /* only U and UJ type instructions that would not use rs1 */
  val rs1_con = io.ex_Mem_Read.toBool() &&
                io.Imm_Sel =/= IMM_U    &&
                io.Imm_Sel =/= IMM_UJ   &&
                io.rs1 === io.ex_rd

  /*
  *  R-type, S-type and SB-type instruction will use rs2
  *  But the store instructions resolve in memory hazard
  *  for example:
  *  LW x1, x0, 0x04
  *  SW x1, x0, 0x08
  *  seems like this program would cause a RAW hazard meets the stall condition,
  *  but actually we can forward the data read from the memory back to
  *  the MEM stage of SW instructions(Load destination register is the same
  *  as the store source register 2)
  * */
  val rs2_con = io.ex_Mem_Read.toBool() &&
                io.Imm_Sel === IMM_R    &&
                io.Imm_Sel === IMM_SB   &&
                io.rs2 === io.ex_rd

  val stall_con = rs1_con || rs2_con

  io.Bubble       := Mux(stall_con, Bubble_Ture, Bubble_False)
  io.IF_ID_Write  := Mux(stall_con, IF_ID_Write_False, IF_ID_Write_True)
  io.PC_Write     := Mux(stall_con, PC_Write_False, PC_Write_True)
}
