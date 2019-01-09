module ImmGen( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_inst_in, // @[:@6.4]
  input  [2:0]  io_imm_sel, // @[:@6.4]
  output [31:0] io_imm // @[:@6.4]
);
  wire [11:0] Iimm; // @[ImmGen.scala 26:24:@8.4]
  wire [6:0] _T_11; // @[ImmGen.scala 27:28:@9.4]
  wire [4:0] _T_12; // @[ImmGen.scala 27:48:@10.4]
  wire [11:0] Simm; // @[Cat.scala 30:58:@11.4]
  wire  _T_13; // @[ImmGen.scala 28:28:@12.4]
  wire  _T_14; // @[ImmGen.scala 28:44:@13.4]
  wire [5:0] _T_15; // @[ImmGen.scala 28:59:@14.4]
  wire [3:0] _T_16; // @[ImmGen.scala 28:79:@15.4]
  wire [11:0] Bimm; // @[Cat.scala 30:58:@18.4]
  wire  _T_43; // @[Mux.scala 46:19:@19.4]
  wire [11:0] _T_44; // @[Mux.scala 46:16:@20.4]
  wire  _T_45; // @[Mux.scala 46:19:@21.4]
  wire [11:0] _T_46; // @[Mux.scala 46:16:@22.4]
  wire  _T_47; // @[Mux.scala 46:19:@23.4]
  wire [11:0] _T_48; // @[Mux.scala 46:16:@24.4]
  wire  _T_49; // @[Mux.scala 46:19:@25.4]
  wire [11:0] _T_50; // @[Mux.scala 46:16:@26.4]
  assign Iimm = io_inst_in[31:20]; // @[ImmGen.scala 26:24:@8.4]
  assign _T_11 = io_inst_in[31:25]; // @[ImmGen.scala 27:28:@9.4]
  assign _T_12 = io_inst_in[11:7]; // @[ImmGen.scala 27:48:@10.4]
  assign Simm = {_T_11,_T_12}; // @[Cat.scala 30:58:@11.4]
  assign _T_13 = io_inst_in[31]; // @[ImmGen.scala 28:28:@12.4]
  assign _T_14 = io_inst_in[7]; // @[ImmGen.scala 28:44:@13.4]
  assign _T_15 = io_inst_in[30:25]; // @[ImmGen.scala 28:59:@14.4]
  assign _T_16 = io_inst_in[11:8]; // @[ImmGen.scala 28:79:@15.4]
  assign Bimm = {_T_13,_T_14,_T_15,_T_16}; // @[Cat.scala 30:58:@18.4]
  assign _T_43 = 3'h4 == io_imm_sel; // @[Mux.scala 46:19:@19.4]
  assign _T_44 = _T_43 ? Bimm : 12'h0; // @[Mux.scala 46:16:@20.4]
  assign _T_45 = 3'h3 == io_imm_sel; // @[Mux.scala 46:19:@21.4]
  assign _T_46 = _T_45 ? Simm : _T_44; // @[Mux.scala 46:16:@22.4]
  assign _T_47 = 3'h2 == io_imm_sel; // @[Mux.scala 46:19:@23.4]
  assign _T_48 = _T_47 ? Iimm : _T_46; // @[Mux.scala 46:16:@24.4]
  assign _T_49 = 3'h1 == io_imm_sel; // @[Mux.scala 46:19:@25.4]
  assign _T_50 = _T_49 ? Iimm : _T_48; // @[Mux.scala 46:16:@26.4]
  assign io_imm = {{20'd0}, _T_50}; // @[ImmGen.scala 30:10:@27.4]
endmodule