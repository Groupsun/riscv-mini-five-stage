/*
* Filename : InstCache.scala
* Date     : 02-01-2019
* Author   : SunnyChen
*
* Instruction cache for my processor, I treat it as a combinational logic
* 02-01-2019 - test cache, 128B, 32 Words, implemented use Mem
* */

package riscv_mini_five_stage

import chisel3._
import chisel3.util.Cat
import chisel3.util.experimental.loadMemoryFromFile

class InstCacheio extends Bundle with Config {
  val addr = Input(UInt(WLEN.W))
  val inst = Output(UInt(WLEN.W))
}

/*
* Instruction cache is a ROM
* This is just a test cache which has a very small size ROM
* */
class InstCache extends Module with Config {
  val io = IO(new InstCacheio)

  // INST_CACHE_LEN Byte and INST_CACHE_LEN / 4 Words
  val cache = Mem(INST_CACHE_LEN, UInt(BLEN.W))

  /*
  *
  0x04: SW	x2, 0x06(x1)	r1 = x1, r2 = x2  , rd = NULL, imm = 0x06, addr = 0x10

  00000000 00100000 10100011 00100011

  0x08: SW	x3, 0x0A(x1)	r1 = x1, r2 = x3  , rd = NULL, imm = 0x0A, addr = 0x14

  00000000 00110000 10100101 00100011

  0x0C: ADD	x3, x1, x2	r1 = x1, r2 = x2  , rd = x3  , imm = NULL, addr = NULL

  00000000 00100000 10000001 10110011

  0x10: LW	x6, 0x06(x1)	r1 = x1, r2 = NULL, rd = x6  , imm = 0x06, addr = 0x10

  00000000 01100000 10100011 00000011

  0x14: BEQ	x4, x5, 0x12	r1 = x4, r2 = x5  , rd = NULL, imm = 0x12, addr = 0x38

  00000010 01010010 00000010 01100011
  * */
  loadMemoryFromFile(cache, "initmem/instcache.txt")

  io.inst := Cat(cache(io.addr), cache(io.addr + 1.U), cache(io.addr + 2.U), cache(io.addr + 3.U))
}

object InstCache extends App {
  chisel3.Driver.execute(args, () => new InstCache)
}
