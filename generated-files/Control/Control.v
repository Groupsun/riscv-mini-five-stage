module Control( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_inst, // @[:@6.4]
  output        io_Reg_Write, // @[:@6.4]
  output [2:0]  io_Imm_Sel, // @[:@6.4]
  output        io_ALU_Src, // @[:@6.4]
  output [3:0]  io_ALUOp, // @[:@6.4]
  output        io_Branch, // @[:@6.4]
  output        io_Mem_Read, // @[:@6.4]
  output        io_Mem_Write, // @[:@6.4]
  output        io_Mem_to_Reg // @[:@6.4]
);
  wire [31:0] _T_49; // @[Lookup.scala 9:38:@8.4]
  wire  _T_50; // @[Lookup.scala 9:38:@9.4]
  wire  _T_54; // @[Lookup.scala 9:38:@11.4]
  wire  _T_58; // @[Lookup.scala 9:38:@13.4]
  wire  _T_62; // @[Lookup.scala 9:38:@15.4]
  wire [31:0] _T_65; // @[Lookup.scala 9:38:@16.4]
  wire  _T_66; // @[Lookup.scala 9:38:@17.4]
  wire  _T_70; // @[Lookup.scala 9:38:@19.4]
  wire  _T_74; // @[Lookup.scala 9:38:@21.4]
  wire  _T_83; // @[Lookup.scala 11:37:@28.4]
  wire  _T_84; // @[Lookup.scala 11:37:@29.4]
  wire  _T_85; // @[Lookup.scala 11:37:@30.4]
  wire [2:0] _T_87; // @[Lookup.scala 11:37:@33.4]
  wire [2:0] _T_88; // @[Lookup.scala 11:37:@34.4]
  wire [2:0] _T_89; // @[Lookup.scala 11:37:@35.4]
  wire [2:0] _T_90; // @[Lookup.scala 11:37:@36.4]
  wire [2:0] _T_91; // @[Lookup.scala 11:37:@37.4]
  wire [2:0] _T_92; // @[Lookup.scala 11:37:@38.4]
  wire  _T_96; // @[Lookup.scala 11:37:@43.4]
  wire  _T_97; // @[Lookup.scala 11:37:@44.4]
  wire  _T_98; // @[Lookup.scala 11:37:@45.4]
  wire  _T_99; // @[Lookup.scala 11:37:@46.4]
  wire [3:0] _T_101; // @[Lookup.scala 11:37:@49.4]
  wire [3:0] _T_102; // @[Lookup.scala 11:37:@50.4]
  wire [3:0] _T_103; // @[Lookup.scala 11:37:@51.4]
  wire [3:0] _T_104; // @[Lookup.scala 11:37:@52.4]
  wire [3:0] _T_105; // @[Lookup.scala 11:37:@53.4]
  wire [3:0] _T_106; // @[Lookup.scala 11:37:@54.4]
  wire  _T_109; // @[Lookup.scala 11:37:@58.4]
  wire  _T_110; // @[Lookup.scala 11:37:@59.4]
  wire  _T_111; // @[Lookup.scala 11:37:@60.4]
  wire  _T_112; // @[Lookup.scala 11:37:@61.4]
  wire  _T_113; // @[Lookup.scala 11:37:@62.4]
  wire  _T_118; // @[Lookup.scala 11:37:@68.4]
  wire  _T_119; // @[Lookup.scala 11:37:@69.4]
  wire  _T_120; // @[Lookup.scala 11:37:@70.4]
  wire  _T_124; // @[Lookup.scala 11:37:@75.4]
  wire  _T_125; // @[Lookup.scala 11:37:@76.4]
  wire  _T_126; // @[Lookup.scala 11:37:@77.4]
  wire  _T_127; // @[Lookup.scala 11:37:@78.4]
  assign _T_49 = io_inst & 32'hfe00707f; // @[Lookup.scala 9:38:@8.4]
  assign _T_50 = 32'h33 == _T_49; // @[Lookup.scala 9:38:@9.4]
  assign _T_54 = 32'h40000033 == _T_49; // @[Lookup.scala 9:38:@11.4]
  assign _T_58 = 32'h7033 == _T_49; // @[Lookup.scala 9:38:@13.4]
  assign _T_62 = 32'h6033 == _T_49; // @[Lookup.scala 9:38:@15.4]
  assign _T_65 = io_inst & 32'h707f; // @[Lookup.scala 9:38:@16.4]
  assign _T_66 = 32'h2003 == _T_65; // @[Lookup.scala 9:38:@17.4]
  assign _T_70 = 32'h2023 == _T_65; // @[Lookup.scala 9:38:@19.4]
  assign _T_74 = 32'h63 == _T_65; // @[Lookup.scala 9:38:@21.4]
  assign _T_83 = _T_62 ? 1'h1 : _T_66; // @[Lookup.scala 11:37:@28.4]
  assign _T_84 = _T_58 ? 1'h1 : _T_83; // @[Lookup.scala 11:37:@29.4]
  assign _T_85 = _T_54 ? 1'h1 : _T_84; // @[Lookup.scala 11:37:@30.4]
  assign _T_87 = _T_74 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37:@33.4]
  assign _T_88 = _T_70 ? 3'h3 : _T_87; // @[Lookup.scala 11:37:@34.4]
  assign _T_89 = _T_66 ? 3'h2 : _T_88; // @[Lookup.scala 11:37:@35.4]
  assign _T_90 = _T_62 ? 3'h1 : _T_89; // @[Lookup.scala 11:37:@36.4]
  assign _T_91 = _T_58 ? 3'h1 : _T_90; // @[Lookup.scala 11:37:@37.4]
  assign _T_92 = _T_54 ? 3'h1 : _T_91; // @[Lookup.scala 11:37:@38.4]
  assign _T_96 = _T_66 ? 1'h1 : _T_70; // @[Lookup.scala 11:37:@43.4]
  assign _T_97 = _T_62 ? 1'h0 : _T_96; // @[Lookup.scala 11:37:@44.4]
  assign _T_98 = _T_58 ? 1'h0 : _T_97; // @[Lookup.scala 11:37:@45.4]
  assign _T_99 = _T_54 ? 1'h0 : _T_98; // @[Lookup.scala 11:37:@46.4]
  assign _T_101 = _T_74 ? 4'h1 : 4'hf; // @[Lookup.scala 11:37:@49.4]
  assign _T_102 = _T_70 ? 4'h0 : _T_101; // @[Lookup.scala 11:37:@50.4]
  assign _T_103 = _T_66 ? 4'h0 : _T_102; // @[Lookup.scala 11:37:@51.4]
  assign _T_104 = _T_62 ? 4'h3 : _T_103; // @[Lookup.scala 11:37:@52.4]
  assign _T_105 = _T_58 ? 4'h2 : _T_104; // @[Lookup.scala 11:37:@53.4]
  assign _T_106 = _T_54 ? 4'h1 : _T_105; // @[Lookup.scala 11:37:@54.4]
  assign _T_109 = _T_70 ? 1'h0 : _T_74; // @[Lookup.scala 11:37:@58.4]
  assign _T_110 = _T_66 ? 1'h0 : _T_109; // @[Lookup.scala 11:37:@59.4]
  assign _T_111 = _T_62 ? 1'h0 : _T_110; // @[Lookup.scala 11:37:@60.4]
  assign _T_112 = _T_58 ? 1'h0 : _T_111; // @[Lookup.scala 11:37:@61.4]
  assign _T_113 = _T_54 ? 1'h0 : _T_112; // @[Lookup.scala 11:37:@62.4]
  assign _T_118 = _T_62 ? 1'h0 : _T_66; // @[Lookup.scala 11:37:@68.4]
  assign _T_119 = _T_58 ? 1'h0 : _T_118; // @[Lookup.scala 11:37:@69.4]
  assign _T_120 = _T_54 ? 1'h0 : _T_119; // @[Lookup.scala 11:37:@70.4]
  assign _T_124 = _T_66 ? 1'h0 : _T_70; // @[Lookup.scala 11:37:@75.4]
  assign _T_125 = _T_62 ? 1'h0 : _T_124; // @[Lookup.scala 11:37:@76.4]
  assign _T_126 = _T_58 ? 1'h0 : _T_125; // @[Lookup.scala 11:37:@77.4]
  assign _T_127 = _T_54 ? 1'h0 : _T_126; // @[Lookup.scala 11:37:@78.4]
  assign io_Reg_Write = _T_50 ? 1'h1 : _T_85; // @[Control.scala 98:17:@94.4]
  assign io_Imm_Sel = _T_50 ? 3'h1 : _T_92; // @[Control.scala 86:17:@88.4]
  assign io_ALU_Src = _T_50 ? 1'h0 : _T_99; // @[Control.scala 89:17:@89.4]
  assign io_ALUOp = _T_50 ? 4'h0 : _T_106; // @[Control.scala 90:17:@90.4]
  assign io_Branch = _T_50 ? 1'h0 : _T_113; // @[Control.scala 93:17:@91.4]
  assign io_Mem_Read = _T_50 ? 1'h0 : _T_120; // @[Control.scala 94:17:@92.4]
  assign io_Mem_Write = _T_50 ? 1'h0 : _T_127; // @[Control.scala 95:17:@93.4]
  assign io_Mem_to_Reg = _T_50 ? 1'h0 : _T_120; // @[Control.scala 99:17:@95.4]
endmodule