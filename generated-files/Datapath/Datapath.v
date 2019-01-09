module Datapath( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_if_datapathio_if_pc_branch_addr, // @[:@6.4]
  input  [31:0] io_if_datapathio_if_pc, // @[:@6.4]
  output [31:0] io_if_datapathio_if_new_pc, // @[:@6.4]
  input  [31:0] io_ex_datapathio_ex_rs2_out, // @[:@6.4]
  input  [31:0] io_ex_datapathio_ex_imm, // @[:@6.4]
  input  [31:0] io_ex_datapathio_ex_pc, // @[:@6.4]
  input         io_ex_datapathio_ex_ALU_Src, // @[:@6.4]
  output [31:0] io_ex_datapathio_ex_branch_addr, // @[:@6.4]
  output [31:0] io_ex_datapathio_alu_b_src, // @[:@6.4]
  input         io_mem_datapathio_mem_Branch, // @[:@6.4]
  input         io_mem_datapathio_mem_Zero, // @[:@6.4]
  input  [31:0] io_wb_datapathio_wb_alu_sum, // @[:@6.4]
  input  [31:0] io_wb_datapathio_wb_dataout, // @[:@6.4]
  input         io_wb_datapathio_wb_Mem_to_Reg, // @[:@6.4]
  output [31:0] io_wb_datapathio_wb_reg_writedata // @[:@6.4]
);
  wire [32:0] _T_36; // @[Datapath.scala 54:37:@8.4]
  wire [31:0] PC_4; // @[Datapath.scala 54:37:@9.4]
  wire  PC_Src; // @[Datapath.scala 57:43:@10.4]
  wire [32:0] _GEN_0; // @[Datapath.scala 62:43:@14.4]
  wire [32:0] shift_imm; // @[Datapath.scala 62:43:@14.4]
  wire [32:0] _GEN_1; // @[Datapath.scala 63:61:@15.4]
  wire [33:0] _T_40; // @[Datapath.scala 63:61:@15.4]
  wire [32:0] _T_41; // @[Datapath.scala 63:61:@16.4]
  assign _T_36 = io_if_datapathio_if_pc + 32'h4; // @[Datapath.scala 54:37:@8.4]
  assign PC_4 = io_if_datapathio_if_pc + 32'h4; // @[Datapath.scala 54:37:@9.4]
  assign PC_Src = io_mem_datapathio_mem_Zero & io_mem_datapathio_mem_Branch; // @[Datapath.scala 57:43:@10.4]
  assign _GEN_0 = {{1'd0}, io_ex_datapathio_ex_imm}; // @[Datapath.scala 62:43:@14.4]
  assign shift_imm = _GEN_0 << 1'h1; // @[Datapath.scala 62:43:@14.4]
  assign _GEN_1 = {{1'd0}, io_ex_datapathio_ex_pc}; // @[Datapath.scala 63:61:@15.4]
  assign _T_40 = _GEN_1 + shift_imm; // @[Datapath.scala 63:61:@15.4]
  assign _T_41 = _GEN_1 + shift_imm; // @[Datapath.scala 63:61:@16.4]
  assign io_if_datapathio_if_new_pc = PC_Src ? io_if_datapathio_if_pc_branch_addr : PC_4; // @[Datapath.scala 58:30:@13.4]
  assign io_ex_datapathio_ex_branch_addr = _T_41[31:0]; // @[Datapath.scala 63:35:@17.4]
  assign io_ex_datapathio_alu_b_src = io_ex_datapathio_ex_ALU_Src ? io_ex_datapathio_ex_imm : io_ex_datapathio_ex_rs2_out; // @[Datapath.scala 66:30:@20.4]
  assign io_wb_datapathio_wb_reg_writedata = io_wb_datapathio_wb_Mem_to_Reg ? io_wb_datapathio_wb_dataout : io_wb_datapathio_wb_alu_sum; // @[Datapath.scala 74:37:@23.4]
endmodule