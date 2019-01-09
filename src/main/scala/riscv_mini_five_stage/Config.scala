/*
* Filename : Config.scala
* Date     : 02-01-2019
* Author   : SunnyChen
*
* Global config file of our riscv-mini-5-stage processor, include global config parameters,
* control signal's width, etc.
* */

package riscv_mini_five_stage

import chisel3._

trait Config {
  // global config parameters
  val BLEN           = 8
  val WLEN           = 32
  val INST_CACHE_LEN = 128
  val REG_LEN        = 5
  val REGFILE_LEN    = 32
  val OPCODE_LEN     = 7
  val DATA_CAHCE_LEN = 32

  // control signal's width
  val PC_SIG_LEN          = 1
  val IF_ID_WRITE_SIG_LEN = 1
  val IF_FLUSH_SIG_LEN    = 1
  val REGWRITE_SIG_LEN    = 1
  val IMM_SEL_SIG_LEN     = 3
  val ALU_SRC_SIG_LEN     = 1
  val ALUOP_SIG_LEN       = 4
  val BRANCH_SIG_LEN      = 1
  val MEM_WRITE_SIG_LEN   = 1
  val MEM_READ_SIG_LEN    = 1
  val REG_SRC_SIG_LEN     = 1
  val ZERO_SIG_LEN        = 1
  val PC_SRC_SIG_LEN      = 1
  val FORWARD_A_SIG_LEN   = 2
  val FORWARD_B_SIG_LEN   = 2
}
