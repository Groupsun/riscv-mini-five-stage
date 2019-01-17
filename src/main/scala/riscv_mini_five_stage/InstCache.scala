/*
* Filename : InstCache.scala
* Date     : 02-01-2019
* Author   : SunnyChen
*
* Instruction cache for my processor, I treat it as a combinational logic
* 02-01-2019 - test cache, 128B, 32 Words, implemented use Mem
* 17-01-2019 - test cache, 256B, 64 Words, implemented use Mem
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

  // Instructions details in "instructions_test.exe"
  loadMemoryFromFile(cache, "initmem/instcache.txt")

  io.inst := Cat(cache(io.addr), cache(io.addr + 1.U), cache(io.addr + 2.U), cache(io.addr + 3.U))
}

object InstCache extends App {
  chisel3.Driver.execute(args, () => new InstCache)
}
