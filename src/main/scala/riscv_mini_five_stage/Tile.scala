/*
* Filename : Tile.scala
* Date     : 02-01-2019
* Author   : SunnyChen
*
* Connect all the necessary modules to form my processor
* 02-01-2019 - connect PC, InstCache and IF/ID pipeline register
* 03-01-2019 - connect RegFile, ImmGen and ID/EX pipeline register, implemented simple control unit
* 05-01-2019 - connect EX stage datapath, ALU and EX/MEM pipeline register
* 07-01-2019 - finish design of the basic datapath, which implemented 7 basic RV32I instructions, but without hazard detection
*              and forward unit
* 10-01-2019 - Implemented all basic instructions of RV32I, except the OS instructions, up to 38 instructions, without hazard detection
*              and forward unit
* 15-01-2019 - Resolve data hazards that using forward unit and hazard detection unit for stalling. But haven't resolved control hazards yet
* */

package riscv_mini_five_stage

import chisel3._

class Tile extends Module with Config {
  val io = IO(new Bundle {
    val if_flush    = Input(UInt(IF_FLUSH_SIG_LEN.W))

    /* Monitor Output */
    val if_pc_out         = Output(UInt(WLEN.W))
    val if_next_pc        = Output(UInt(WLEN.W))
    val id_rs1            = Output(UInt(REG_LEN.W))
    val id_rs2            = Output(UInt(REG_LEN.W))
    val id_rs1_out        = Output(UInt(WLEN.W))
    val id_rs2_out        = Output(UInt(WLEN.W))
    val ex_rs1_out        = Output(UInt(WLEN.W))
    val ex_rs2_out        = Output(UInt(WLEN.W))
    val ex_alu_sum        = Output(UInt(WLEN.W))
    val ex_alu_conflag    = Output(UInt(CONFLAG_SIGLEN.W))
    val ex_rd             = Output(UInt(REG_LEN.W))
    val mem_rd            = Output(UInt(REG_LEN.W))
    val mem_alu_sum       = Output(UInt(WLEN.W))
    val mem_writedata     = Output(UInt(WLEN.W))
    val mem_dataout       = Output(UInt(WLEN.W))
    val wb_rd             = Output(UInt(REG_LEN.W))
    val wb_registerwrite  = Output(UInt(WLEN.W))

    // forward
    val Forward_A         = Output(UInt(FORWARD_A_SIG_LEN.W))
    val Forward_B         = Output(UInt(FORWARD_B_SIG_LEN.W))
    val MemWrite_Src      = Output(UInt(MEMWRITE_SRC_SIG_LEN.W))
  })

  val pc                = Module(new PC)
  val instcache         = Module(new InstCache)
  val if_id_register    = Module(new IF_ID_Register)
  val regfile           = Module(new RegFile)
  val immgen            = Module(new ImmGen)
  val control           = Module(new Control)
  val id_ex_register    = Module(new ID_EX_Register)
  val alu               = Module(new ALU)
  val datapath          = Module(new Datapath)
  val ex_mem_register   = Module(new EX_MEM_Register)
  val datacache         = Module(new DataCache)
  val mem_wb_register   = Module(new MEM_WB_Register)
  val forward           = Module(new Forward)
  val hazard_detection  = Module(new Hazard_Detection)

  /* IF stage */
  // generate next PC address
  datapath.io.if_datapathio.if_pc             := pc.io.pc_out

  // PC
  pc.io.addr_input := datapath.io.if_datapathio.if_new_pc
  pc.io.pc_write   := hazard_detection.io.PC_Write

  // Instruction cache
  instcache.io.addr := pc.io.pc_out

  //monitor -------------------------
  io.if_pc_out  := pc.io.pc_out
  io.if_next_pc := datapath.io.if_datapathio.if_new_pc
  //monitor -------------------------

  /* IF/ID pipeline register */
  if_id_register.io.if_id_write := hazard_detection.io.IF_ID_Write
  if_id_register.io.if_flush    := io.if_flush
  if_id_register.io.if_inst     := instcache.io.inst
  if_id_register.io.if_pc       := pc.io.pc_out
  if_id_register.io.if_pc_4     := datapath.io.if_datapathio.if_pc_4

  /* ID stage */
  // Main control unit
  control.io.inst     := if_id_register.io.id_inst

  // Hazard detect unit
  hazard_detection.io.rs1         := if_id_register.io.id_rs1
  hazard_detection.io.rs2         := if_id_register.io.id_rs2
  hazard_detection.io.ex_rd       := id_ex_register.io.ex_rd
  hazard_detection.io.ex_Mem_Read := id_ex_register.io.ex_Mem_Read
  hazard_detection.io.Imm_Sel     := control.io.Imm_Sel

  // Bubble unit
  datapath.io.id_datapathio.Bubble        := hazard_detection.io.Bubble
  datapath.io.id_datapathio.Reg_Write     := control.io.Reg_Write
  datapath.io.id_datapathio.ALU_Src       := control.io.ALU_Src
  datapath.io.id_datapathio.ALUOp         := control.io.ALUOp
  datapath.io.id_datapathio.Branch        := control.io.Branch
  datapath.io.id_datapathio.Branch_Src    := control.io.Branch_Src
  datapath.io.id_datapathio.Mem_Read      := control.io.Mem_Read
  datapath.io.id_datapathio.Mem_Write     := control.io.Mem_Write
  datapath.io.id_datapathio.Data_Size     := control.io.Data_Size
  datapath.io.id_datapathio.Load_Type     := control.io.Load_Type
  datapath.io.id_datapathio.Mem_to_Reg    := control.io.Mem_to_Reg
  datapath.io.id_datapathio.Jump_Type     := control.io.Jump_Type

  // Register file
  regfile.io.rs1      := if_id_register.io.id_rs1
  regfile.io.rs2      := if_id_register.io.id_rs2
  regfile.io.rd       := mem_wb_register.io.wb_rd
  regfile.io.wdata    := datapath.io.wb_datapathio.wb_reg_writedata
  regfile.io.regwrite := mem_wb_register.io.wb_Reg_Write

  // Immediate Generator
  immgen.io.inst_in   := if_id_register.io.id_inst
  immgen.io.imm_sel   := control.io.Imm_Sel

  //monitor -------------------------
  io.id_rs1     := if_id_register.io.id_rs1
  io.id_rs2     := if_id_register.io.id_rs2
  io.id_rs1_out := regfile.io.rs1_out
  io.id_rs2_out := regfile.io.rs2_out
  //monitor -------------------------

  /* ID/EX pipeline register */
  // control signals
  id_ex_register.io.ALU_Src     := datapath.io.id_datapathio.id_ALU_Src
  id_ex_register.io.ALUOp       := datapath.io.id_datapathio.id_ALUOp
  id_ex_register.io.Branch      := datapath.io.id_datapathio.id_Branch
  id_ex_register.io.Branch_Src  := datapath.io.id_datapathio.id_Branch_Src
  id_ex_register.io.Jump_Type   := datapath.io.id_datapathio.id_Jump_Type
  id_ex_register.io.Mem_Read    := datapath.io.id_datapathio.id_Mem_Read
  id_ex_register.io.Mem_Write   := datapath.io.id_datapathio.id_Mem_Write
  id_ex_register.io.Data_Size   := datapath.io.id_datapathio.id_Data_Size
  id_ex_register.io.Load_Type   := datapath.io.id_datapathio.id_Load_Type
  id_ex_register.io.Reg_Write   := datapath.io.id_datapathio.id_Reg_Write
  id_ex_register.io.Mem_to_Reg  := datapath.io.id_datapathio.id_Mem_to_Reg

  // data
  id_ex_register.io.id_rs1_out := regfile.io.rs1_out
  id_ex_register.io.id_rs2_out := regfile.io.rs2_out
  id_ex_register.io.id_rs1     := if_id_register.io.id_rs1
  id_ex_register.io.id_rs2     := if_id_register.io.id_rs2
  id_ex_register.io.id_pc      := if_id_register.io.id_pc
  id_ex_register.io.id_pc_4    := if_id_register.io.id_pc_4
  id_ex_register.io.id_inst    := if_id_register.io.id_inst
  id_ex_register.io.id_imm     := immgen.io.imm

  /* EX stage */
  // Adder of branch address
  datapath.io.ex_datapathio.ex_pc         := id_ex_register.io.ex_pc
  datapath.io.ex_datapathio.ex_imm        := id_ex_register.io.ex_imm
  datapath.io.ex_datapathio.ex_rs1_out    := id_ex_register.io.ex_rs1_out
  datapath.io.ex_datapathio.ex_Branch_Src := id_ex_register.io.ex_Branch_Src

  // branch units
  datapath.io.ex_datapathio.ex_Branch       := id_ex_register.io.ex_Branch
  datapath.io.ex_datapathio.ex_alu_conflag  := alu.io.Conflag
  datapath.io.ex_datapathio.ex_Jump_Type    := id_ex_register.io.ex_Jump_Type

  // Forward
  datapath.io.mem_datapathio.mem_alu_sum    := ex_mem_register.io.mem_alu_sum
  datapath.io.mem_datapathio.mem_pc_4       := ex_mem_register.io.mem_pc_4
  datapath.io.mem_datapathio.mem_imm        := ex_mem_register.io.mem_imm
  datapath.io.mem_datapathio.mem_aui_pc     := ex_mem_register.io.mem_aui_pc
  datapath.io.mem_datapathio.mem_Mem_to_Reg := ex_mem_register.io.mem_Mem_to_Reg

  datapath.io.ex_datapathio.Forward_A       := forward.io.Forward_A
  datapath.io.ex_datapathio.Forward_B       := forward.io.Forward_B

  // ALU oprand B select
  datapath.io.ex_datapathio.ex_rs2_out := id_ex_register.io.ex_rs2_out
  datapath.io.ex_datapathio.ex_ALU_Src := id_ex_register.io.ex_ALU_Src

  // ALU
  alu.io.Src_A := datapath.io.ex_datapathio.alu_a_src
  alu.io.Src_B := datapath.io.ex_datapathio.alu_b_src
  alu.io.ALUOp := id_ex_register.io.ex_ALUOp

  //monitor -------------------------
  io.ex_rs1_out     := id_ex_register.io.ex_rs1_out
  io.ex_rs2_out     := id_ex_register.io.ex_rs2_out
  io.ex_alu_sum     := alu.io.Sum
  io.ex_alu_conflag := alu.io.Conflag
  io.ex_rd          := id_ex_register.io.ex_rd
  //monitor -------------------------

  /* EX/MEM pipeline register */
  ex_mem_register.io.ex_alu_sum     := alu.io.Sum
  ex_mem_register.io.ex_rs2_out     := datapath.io.ex_datapathio.forward_rs2_out
  ex_mem_register.io.ex_rd          := id_ex_register.io.ex_rd
  ex_mem_register.io.ex_pc_4        := id_ex_register.io.ex_pc_4
  ex_mem_register.io.ex_imm         := id_ex_register.io.ex_imm
  ex_mem_register.io.ex_aui_pc      := datapath.io.ex_datapathio.ex_aui_pc
  ex_mem_register.io.ex_rs2         := id_ex_register.io.ex_rs2
  ex_mem_register.io.ex_Mem_Read    := id_ex_register.io.ex_Mem_Read
  ex_mem_register.io.ex_Mem_Write   := id_ex_register.io.ex_Mem_Write
  ex_mem_register.io.ex_Data_Size   := id_ex_register.io.ex_Data_Size
  ex_mem_register.io.ex_Load_Type   := id_ex_register.io.ex_Load_Type
  ex_mem_register.io.ex_Reg_Write   := id_ex_register.io.ex_Reg_Write
  ex_mem_register.io.ex_Mem_to_Reg  := id_ex_register.io.ex_Mem_to_Reg

  /* MEM stage */
  // Memory forward
  datapath.io.mem_datapathio.mem_rs2_out  := ex_mem_register.io.mem_rs2_out
  datapath.io.mem_datapathio.MemWrite_Src := forward.io.MemWrite_Src

  // Datacache
  datacache.io.addr       := ex_mem_register.io.mem_alu_sum
  datacache.io.write_data := datapath.io.mem_datapathio.mem_writedata
  datacache.io.Mem_Read   := ex_mem_register.io.mem_Mem_Read
  datacache.io.Mem_Write  := ex_mem_register.io.mem_Mem_Write
  datacache.io.Data_Size  := ex_mem_register.io.mem_Data_Size
  datacache.io.Load_Type  := ex_mem_register.io.mem_Load_Type

  //monitor -------------------------
  io.mem_rd           := ex_mem_register.io.mem_rd
  io.mem_alu_sum      := ex_mem_register.io.mem_alu_sum
  io.mem_writedata    := ex_mem_register.io.mem_rs2_out
  io.mem_dataout      := datacache.io.data_out
  //monitor -------------------------

  /* MEM/WB pipeline register */
  mem_wb_register.io.mem_Reg_Write    := ex_mem_register.io.mem_Reg_Write
  mem_wb_register.io.mem_Mem_to_Reg   := ex_mem_register.io.mem_Mem_to_Reg
  mem_wb_register.io.mem_dataout      := datacache.io.data_out
  mem_wb_register.io.mem_alu_sum      := ex_mem_register.io.mem_alu_sum
  mem_wb_register.io.mem_rd           := ex_mem_register.io.mem_rd
  mem_wb_register.io.mem_pc_4         := ex_mem_register.io.mem_pc_4
  mem_wb_register.io.mem_imm          := ex_mem_register.io.mem_imm
  mem_wb_register.io.mem_aui_pc       := ex_mem_register.io.mem_aui_pc

  /* WB stage */
  datapath.io.wb_datapathio.wb_alu_sum      := mem_wb_register.io.wb_alu_sum
  datapath.io.wb_datapathio.wb_dataout      := mem_wb_register.io.wb_dataout
  datapath.io.wb_datapathio.wb_pc_4         := mem_wb_register.io.wb_pc_4
  datapath.io.wb_datapathio.wb_imm          := mem_wb_register.io.wb_imm
  datapath.io.wb_datapathio.wb_aui_pc       := mem_wb_register.io.wb_aui_pc
  datapath.io.wb_datapathio.wb_Mem_to_Reg   := mem_wb_register.io.wb_Mem_to_Reg

  //monitor -------------------------
  io.wb_rd            := mem_wb_register.io.wb_rd
  io.wb_registerwrite := datapath.io.wb_datapathio.wb_reg_writedata
  //monitor -------------------------

  /* Forward Unit */
  forward.io.ex_mem_Reg_Write := ex_mem_register.io.mem_Reg_Write
  forward.io.ex_mem_rd        := ex_mem_register.io.mem_rd
  forward.io.mem_wb_Reg_Write := mem_wb_register.io.wb_Reg_Write
  forward.io.mem_wb_rd        := mem_wb_register.io.wb_rd
  forward.io.id_ex_rs1        := id_ex_register.io.ex_rs1
  forward.io.id_ex_rs2        := id_ex_register.io.ex_rs2
  forward.io.ex_mem_rs2       := ex_mem_register.io.mem_rs2
  forward.io.ex_mem_Mem_Write := ex_mem_register.io.mem_Mem_Write

  /* output test */
  io.Forward_A    := forward.io.Forward_A
  io.Forward_B    := forward.io.Forward_B
  io.MemWrite_Src := forward.io.MemWrite_Src
}

object Tile extends App {
  chisel3.Driver.execute(args, () => new Tile)
}