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
  val HLEN           = 16
  val WLEN           = 32
  val INST_CACHE_LEN = 256
  val REG_LEN        = 5
  val REGFILE_LEN    = 32
  val OPCODE_LEN     = 7
  val DATA_CAHCE_LEN = 32

  // control signal's width
  val PC_WRITE_SIG_LEN      = 1
  val IF_ID_WRITE_SIG_LEN   = 1
  val REGWRITE_SIG_LEN      = 1
  val IMM_SEL_SIG_LEN       = 3
  val ALU_SRC_SIG_LEN       = 1
  val ALUOP_SIG_LEN         = 5
  val BRANCH_SIG_LEN        = 1
  val MEM_WRITE_SIG_LEN     = 1
  val MEM_READ_SIG_LEN      = 1
  val REG_SRC_SIG_LEN       = 3
  val CONFLAG_SIGLEN        = 1
  val PC_SRC_SIG_LEN        = 1
  val FORWARD_A_SIG_LEN     = 2
  val FORWARD_B_SIG_LEN     = 2
  val DATA_SIZE_SIG_LEN     = 2
  val LOAD_TYPE_SIG_LEN     = 1
  val BRANCH_SRC_SIG_LEN    = 1
  val JUMP_TYPE_SIG_LEN     = 1
  val MEMWRITE_SRC_SIG_LEN  = 1
  val BUBBLE_SIG_LEN        = 1
  val PC_SEL_SIG_LEN        = 2
  val IF_ID_FLUSH_SIG_LEN   = 1
  val ID_EX_FLUSH_SIG_LEN   = 1
  val ADDR_BUFFER_FLUSH_LEN = 1
}
