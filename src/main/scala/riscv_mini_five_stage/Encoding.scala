/*
* Filename : Encoding.scala
* Date     : 14-01-2019
* Author   : SunnyChen
*
* Generate the Hexadecimal code of the assembly language code.
* This is not the component of the processor, just for generating the code.
*
* Input file is in initmem/asm_input.txt
* Input format:
* - Op must be upper case
* - Register name must start with 'x'
* - Immediate must start with "0x", Hex format
*
* R-type :   Op    rd , rs1, rs2
* I-type :   Op    rd , rs1, imm
* S-type :   Op    rs2, rs1, imm
* U-type :   Op    rd , imm
* SB-type:   Op    rs1, rs2, imm
* UJ-type:   Op    rd , imm
* No operation just type "NOP"
*
* The output file is initmem/instcache.txt, Hex format. Each line represents a Byte in instruction cache
* */

package riscv_mini_five_stage

import scala.io.Source
import java.io._

object Instruction_Type {
  val R_type    = 0
  val I_type    = 1
  val S_type    = 2
  val SB_type   = 3
  val U_type    = 4
  val UJ_type   = 5
  val Is_type   = 6
  val NOP_type  = 7
  val MRET_type = 8
  val CSR_type  = 9
  val CSRI_type = 10
  val input_count = Map(
    R_type    -> 3,
    I_type    -> 3,
    Is_type   -> 3,
    S_type    -> 3,
    SB_type   -> 3,
    U_type    -> 2,
    UJ_type   -> 2,
    NOP_type  -> 0,
    CSR_type  -> 3,
    CSRI_type -> 3
  )
  val inst_type_map = Map(
    "LUI"   -> U_type,
    "AUIPC" -> U_type,
    "JAL"   -> UJ_type,
    "JALR"  -> I_type,
    "BEQ"   -> SB_type,
    "BNE"   -> SB_type,
    "BLT"   -> SB_type,
    "BGE"   -> SB_type,
    "BLTU"  -> SB_type,
    "BGEU"  -> SB_type,
    "LB"    -> I_type,
    "LH"    -> I_type,
    "LW"    -> I_type,
    "LBU"   -> I_type,
    "LHU"   -> I_type,
    "SB"    -> S_type,
    "SH"    -> S_type,
    "SW"    -> S_type,
    "ADDI"  -> I_type,
    "SLTI"  -> I_type,
    "SLTIU" -> I_type,
    "XORI"  -> I_type,
    "ORI"   -> I_type,
    "ANDI"  -> I_type,
    "SLLI"  -> Is_type,
    "SRLI"  -> Is_type,
    "SRAI"  -> Is_type,
    "ADD"   -> R_type,
    "SUB"   -> R_type,
    "SLL"   -> R_type,
    "SLT"   -> R_type,
    "SLTU"  -> R_type,
    "XOR"   -> R_type,
    "SRL"   -> R_type,
    "SRA"   -> R_type,
    "OR"    -> R_type,
    "AND"   -> R_type,
    "NOP"   -> NOP_type,
    "MRET"  -> MRET_type,
    "CSRRW" -> CSR_type,
    "CSRRS" -> CSR_type,
    "CSRRC" -> CSR_type,
    "CSRRWI" -> CSRI_type,
    "CSRRSI" -> CSRI_type,
    "CSRRCI" -> CSRI_type
  )
  val inst_bit_map  = Map(
    "LUI"   -> "?????????????????????????0110111",
    "AUIPC" -> "?????????????????????????0010111",
    "JAL"   -> "?????????????????????????1101111",
    "JALR"  -> "?????????????????000?????1100111",
    "BEQ"   -> "?????????????????000?????1100011",
    "BNE"   -> "?????????????????001?????1100011",
    "BLT"   -> "?????????????????100?????1100011",
    "BGE"   -> "?????????????????101?????1100011",
    "BLTU"  -> "?????????????????110?????1100011",
    "BGEU"  -> "?????????????????111?????1100011",
    "LB"    -> "?????????????????000?????0000011",
    "LH"    -> "?????????????????001?????0000011",
    "LW"    -> "?????????????????010?????0000011",
    "LBU"   -> "?????????????????100?????0000011",
    "LHU"   -> "?????????????????101?????0000011",
    "SB"    -> "?????????????????000?????0100011",
    "SH"    -> "?????????????????001?????0100011",
    "SW"    -> "?????????????????010?????0100011",
    "ADDI"  -> "?????????????????000?????0010011",
    "SLTI"  -> "?????????????????010?????0010011",
    "SLTIU" -> "?????????????????011?????0010011",
    "XORI"  -> "?????????????????100?????0010011",
    "ORI"   -> "?????????????????110?????0010011",
    "ANDI"  -> "?????????????????111?????0010011",
    "SLLI"  -> "0000000??????????001?????0010011",
    "SRLI"  -> "0000000??????????101?????0010011",
    "SRAI"  -> "0100000??????????101?????0010011",
    "ADD"   -> "0000000??????????000?????0110011",
    "SUB"   -> "0100000??????????000?????0110011",
    "SLL"   -> "0000000??????????001?????0110011",
    "SLT"   -> "0000000??????????010?????0110011",
    "SLTU"  -> "0000000??????????011?????0110011",
    "XOR"   -> "0000000??????????100?????0110011",
    "SRL"   -> "0000000??????????101?????0110011",
    "SRA"   -> "0100000??????????101?????0110011",
    "OR"    -> "0000000??????????110?????0110011",
    "AND"   -> "0000000??????????111?????0110011",
    "NOP"   -> "00000000000000000000000000010011",
    "MRET"  -> "00110000001000000000000001110011",
    "CSRRW" -> "?????????????????001?????1110011",
    "CSRRS" -> "?????????????????010?????1110011",
    "CSRRC" -> "?????????????????011?????1110011",
    "CSRRWI" -> "?????????????????101?????1110011",
    "CSRRSI" -> "?????????????????110?????1110011",
    "CSRRCI" -> "?????????????????111?????1110011"
  )
  val csr_map = Map(
    "mie"       -> "001100000100",
    "mtvec"     -> "001100000101",
    "mepc"      -> "001101000001",
    "mcause"    -> "001101000010",
    "mtval"     -> "001101000011",
    "mip"       -> "001101000100",
    "mtime"     -> "011100000000",
    "mtimeh"    -> "011100000001",
    "mtimecmp"  -> "011100000010",
    "mtimecmph" -> "011100000011",
    "mcycle"    -> "101100000000",
    "mcycleh"   -> "101110000000",
    "minstret"  -> "101100000010",
    "minstreth" -> "101110000010"
  )

}

object Encoding {
  def main(args: Array[String]): Unit = {
    generate_hexcode()
  }

  def generate_hexcode() = {
    val source = Source.fromFile("initmem/asm_input.txt")
    val lineiterator = source.getLines()
    val writer = new PrintWriter(new File("initmem/instcache.txt"))
    for(l <- lineiterator) {
      val split = l.split("\\s*,\\s*|\\s+")
      val inst_type = Instruction_Type.inst_type_map(split(0))
      val bitstring = Instruction_Type.inst_bit_map(split(0))
      val result = encoding(split, inst_type, bitstring)
      val B0 = Integer.toHexString(Integer.parseInt(result.substring(0, 8), 2))
      //println(B0)
      val B1 = Integer.toHexString(Integer.parseInt(result.substring(8, 16), 2))
      val B2 = Integer.toHexString(Integer.parseInt(result.substring(16, 24), 2))
      val B3 = Integer.toHexString(Integer.parseInt(result.substring(24, 32), 2))
      writer.println(B0)
      writer.println(B1)
      writer.println(B2)
      writer.println(B3)
    }
    writer.close()
  }

  def encoding_imm(input: String, inst_type: Int): String = {
    val imm = Integer.parseInt(input.substring(2, input.length()), 16)
    var temp = Integer.toBinaryString(imm)
    if(inst_type == Instruction_Type.I_type || inst_type == Instruction_Type.S_type || inst_type == Instruction_Type.SB_type) {
      if (temp.length() < 12) {
        for (i <- 0 until 12 - temp.length()) {
          temp = "0" + temp
        }
      }else if(temp.length() > 12) {
        temp = temp.substring(20, 32)
      }
    }else if(inst_type == Instruction_Type.UJ_type || inst_type == Instruction_Type.U_type) {
      if (temp.length() < 20) {
        for (i <- 0 until 20 - temp.length()) {
          temp = "0" + temp
        }
      } else if(temp.length() > 20) {
        temp = temp.substring(12, 32)
      }
    } else if(inst_type == Instruction_Type.Is_type || inst_type == Instruction_Type.CSRI_type) {
      if(temp.length() < 5) {
        for (i <- 0 until 5 - temp.length()) {
          temp = "0" + temp
        }
      } else if(temp.length() > 5) {
        temp = temp.substring(27, 32)
      }
    }
    temp
  }

  def encoding_register(input: String): String = {
    //println(input)
    //println(input.substring(1, input.length()))
    val number = Integer.parseInt(input.substring(1, input.length()))
    var temp = Integer.toBinaryString(number)
    if(temp.length() < 5) {
      for(i <- 0 until 5-temp.length()) {
        temp = "0" + temp
      }
    }
    temp
  }

  def encoding_csr(input: String):String = {
    Instruction_Type.csr_map(input)
  }

  def encoding(split: Array[String], inst_type: Int, bitstring: String): String = {
    var result = ""
    val funct7 = bitstring.substring(0, 7)
    val funct3 = bitstring.substring(17, 20)
    val opcode = bitstring.substring(25, 32)
    if(inst_type == Instruction_Type.R_type) {
      // R-type: Op rd, rs1, rs2
      for (s <- split) {
        //println(s)
      }
      val rd = encoding_register(split(1))
      val rs1 = encoding_register(split(2))
      val rs2 = encoding_register(split(3))

      result = funct7 + rs2 + rs1 + funct3 + rd + opcode
    } else if(inst_type == Instruction_Type.I_type) {
      // I-type: Op rd, rs1, imm
      val rd = encoding_register(split(1))
      val rs1 = encoding_register(split(2))
      val imm = encoding_imm(split(3), inst_type)

      result = imm + rs1 + funct3 + rd + opcode
    } else if(inst_type == Instruction_Type.Is_type) {
      // Is-type: Op rd, rs1, imm
      val rd = encoding_register(split(1))
      val rs1 = encoding_register(split(2))
      val shift = encoding_imm(split(3), inst_type)

      result = funct7 + shift + rs1 + funct3 + rd + opcode
    } else if(inst_type == Instruction_Type.S_type) {
      // S-type: Op rs2, rs1, imm
      val rs2 = encoding_register(split(1))
      val rs1 = encoding_register(split(2))
      val imm = encoding_imm(split(3), inst_type)

      result = imm.substring(0, 7) + rs2 + rs1 + funct3 + imm.substring(7, 12) + opcode
    } else if(inst_type == Instruction_Type.SB_type) {
      // SB-type: Op rs1, rs2, imm
      val rs1 = encoding_register(split(1))
      val rs2 = encoding_register(split(2))
      val imm = encoding_imm(split(3), inst_type)

      //println(imm)
      result = imm.substring(0, 1) + imm.substring(2, 8) + rs2 + rs1 + funct3 + imm.substring(8, 12) + imm.substring(1, 2) + opcode
    } else if(inst_type == Instruction_Type.U_type) {
      val rd = encoding_register(split(1))
      val imm = encoding_imm(split(2), inst_type)

      result = imm + rd + opcode
    } else if(inst_type == Instruction_Type.UJ_type) {
      val rd = encoding_register(split(1))
      val imm = encoding_imm(split(2), inst_type)
      //println(imm)

      result = imm.substring(0, 1) + imm.substring(10, 20) + imm.substring(9, 10) + imm.substring(1, 9) + rd + opcode
    } else if(inst_type == Instruction_Type.NOP_type) {
      result = Instruction_Type.inst_bit_map("NOP")
    } else if(inst_type == Instruction_Type.MRET_type) {
      result = Instruction_Type.inst_bit_map("MRET")
    } else if(inst_type == Instruction_Type.CSR_type) {
      val rd = encoding_register(split(1))
      val csr = encoding_csr(split(2))
      val rs1 = encoding_register(split(3))

      result = csr + rs1 + funct3 + rd + opcode
      println(result)
    } else if(inst_type == Instruction_Type.CSRI_type) {
      val rd = encoding_register(split(1))
      val csr = encoding_csr(split(2))
      val imm = encoding_imm(split(3), inst_type)

      result = csr + imm + funct3 + rd + opcode
    }

    return result
  }
}
