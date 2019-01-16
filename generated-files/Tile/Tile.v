module PC( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_addr_input, // @[:@6.4]
  input         io_pc_write, // @[:@6.4]
  output [31:0] io_pc_out // @[:@6.4]
);
  reg [31:0] PC_reg; // @[PC.scala 24:23:@8.4]
  reg [31:0] _RAND_0;
  wire [31:0] _T_14; // @[PC.scala 26:16:@10.4]
  assign _T_14 = io_pc_write ? io_addr_input : PC_reg; // @[PC.scala 26:16:@10.4]
  assign io_pc_out = PC_reg; // @[PC.scala 27:13:@12.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  PC_reg = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      PC_reg <= 32'h0;
    end else begin
      if (io_pc_write) begin
        PC_reg <= io_addr_input;
      end
    end
  end
endmodule
module InstCache( // @[:@14.2]
  input         clock, // @[:@15.4]
  input  [31:0] io_addr, // @[:@17.4]
  output [31:0] io_inst // @[:@17.4]
);
  reg [7:0] cache [0:127]; // @[InstCache.scala 29:18:@19.4]
  reg [31:0] _RAND_0;
  wire [7:0] cache__T_12_data; // @[InstCache.scala 29:18:@19.4]
  wire [6:0] cache__T_12_addr; // @[InstCache.scala 29:18:@19.4]
  wire [7:0] cache__T_17_data; // @[InstCache.scala 29:18:@19.4]
  wire [6:0] cache__T_17_addr; // @[InstCache.scala 29:18:@19.4]
  wire [7:0] cache__T_22_data; // @[InstCache.scala 29:18:@19.4]
  wire [6:0] cache__T_22_addr; // @[InstCache.scala 29:18:@19.4]
  wire [7:0] cache__T_27_data; // @[InstCache.scala 29:18:@19.4]
  wire [6:0] cache__T_27_addr; // @[InstCache.scala 29:18:@19.4]
  wire [32:0] _T_14; // @[InstCache.scala 34:48:@22.4]
  wire [31:0] _T_15; // @[InstCache.scala 34:48:@23.4]
  wire [32:0] _T_19; // @[InstCache.scala 34:70:@26.4]
  wire [31:0] _T_20; // @[InstCache.scala 34:70:@27.4]
  wire [32:0] _T_24; // @[InstCache.scala 34:92:@30.4]
  wire [31:0] _T_25; // @[InstCache.scala 34:92:@31.4]
  wire [15:0] _T_28; // @[Cat.scala 30:58:@34.4]
  wire [15:0] _T_29; // @[Cat.scala 30:58:@35.4]
  assign cache__T_12_addr = io_addr[6:0];
  assign cache__T_12_data = cache[cache__T_12_addr]; // @[InstCache.scala 29:18:@19.4]
  assign cache__T_17_addr = _T_15[6:0];
  assign cache__T_17_data = cache[cache__T_17_addr]; // @[InstCache.scala 29:18:@19.4]
  assign cache__T_22_addr = _T_20[6:0];
  assign cache__T_22_data = cache[cache__T_22_addr]; // @[InstCache.scala 29:18:@19.4]
  assign cache__T_27_addr = _T_25[6:0];
  assign cache__T_27_data = cache[cache__T_27_addr]; // @[InstCache.scala 29:18:@19.4]
  assign _T_14 = io_addr + 32'h1; // @[InstCache.scala 34:48:@22.4]
  assign _T_15 = io_addr + 32'h1; // @[InstCache.scala 34:48:@23.4]
  assign _T_19 = io_addr + 32'h2; // @[InstCache.scala 34:70:@26.4]
  assign _T_20 = io_addr + 32'h2; // @[InstCache.scala 34:70:@27.4]
  assign _T_24 = io_addr + 32'h3; // @[InstCache.scala 34:92:@30.4]
  assign _T_25 = io_addr + 32'h3; // @[InstCache.scala 34:92:@31.4]
  assign _T_28 = {cache__T_22_data,cache__T_27_data}; // @[Cat.scala 30:58:@34.4]
  assign _T_29 = {cache__T_12_data,cache__T_17_data}; // @[Cat.scala 30:58:@35.4]
  assign io_inst = {_T_29,_T_28}; // @[InstCache.scala 34:11:@37.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 128; initvar = initvar+1)
    cache[initvar] = _RAND_0[7:0];
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE
endmodule
module IF_ID_Register( // @[:@39.2]
  input         clock, // @[:@40.4]
  input         reset, // @[:@41.4]
  input  [31:0] io_if_pc, // @[:@42.4]
  input  [31:0] io_if_inst, // @[:@42.4]
  input         io_if_id_write, // @[:@42.4]
  input         io_if_flush, // @[:@42.4]
  input  [31:0] io_if_pc_4, // @[:@42.4]
  output [4:0]  io_id_rs1, // @[:@42.4]
  output [4:0]  io_id_rs2, // @[:@42.4]
  output [31:0] io_id_pc, // @[:@42.4]
  output [31:0] io_id_pc_4, // @[:@42.4]
  output [31:0] io_id_inst // @[:@42.4]
);
  reg [31:0] pc_reg; // @[IF_ID_Register.scala 29:26:@44.4]
  reg [31:0] _RAND_0;
  reg [31:0] inst_reg; // @[IF_ID_Register.scala 30:26:@45.4]
  reg [31:0] _RAND_1;
  reg [31:0] pc_4_reg; // @[IF_ID_Register.scala 31:26:@46.4]
  reg [31:0] _RAND_2;
  wire [31:0] _T_34; // @[IF_ID_Register.scala 34:8:@49.4]
  wire [31:0] _T_35; // @[IF_ID_Register.scala 33:16:@50.4]
  wire [31:0] _T_39; // @[IF_ID_Register.scala 37:8:@54.4]
  wire [31:0] _T_40; // @[IF_ID_Register.scala 36:18:@55.4]
  wire [31:0] _T_44; // @[IF_ID_Register.scala 40:8:@59.4]
  wire [31:0] _T_45; // @[IF_ID_Register.scala 39:18:@60.4]
  assign _T_34 = io_if_id_write ? io_if_pc : pc_reg; // @[IF_ID_Register.scala 34:8:@49.4]
  assign _T_35 = io_if_flush ? 32'h0 : _T_34; // @[IF_ID_Register.scala 33:16:@50.4]
  assign _T_39 = io_if_id_write ? io_if_inst : inst_reg; // @[IF_ID_Register.scala 37:8:@54.4]
  assign _T_40 = io_if_flush ? 32'h0 : _T_39; // @[IF_ID_Register.scala 36:18:@55.4]
  assign _T_44 = io_if_id_write ? io_if_pc_4 : pc_4_reg; // @[IF_ID_Register.scala 40:8:@59.4]
  assign _T_45 = io_if_flush ? 32'h0 : _T_44; // @[IF_ID_Register.scala 39:18:@60.4]
  assign io_id_rs1 = inst_reg[19:15]; // @[IF_ID_Register.scala 45:15:@66.4]
  assign io_id_rs2 = inst_reg[24:20]; // @[IF_ID_Register.scala 46:15:@68.4]
  assign io_id_pc = pc_reg; // @[IF_ID_Register.scala 42:15:@62.4]
  assign io_id_pc_4 = pc_4_reg; // @[IF_ID_Register.scala 43:15:@63.4]
  assign io_id_inst = inst_reg; // @[IF_ID_Register.scala 44:15:@64.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc_reg = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  inst_reg = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  pc_4_reg = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      pc_reg <= 32'h0;
    end else begin
      if (io_if_flush) begin
        pc_reg <= 32'h0;
      end else begin
        if (io_if_id_write) begin
          pc_reg <= io_if_pc;
        end
      end
    end
    if (reset) begin
      inst_reg <= 32'h0;
    end else begin
      if (io_if_flush) begin
        inst_reg <= 32'h0;
      end else begin
        if (io_if_id_write) begin
          inst_reg <= io_if_inst;
        end
      end
    end
    if (reset) begin
      pc_4_reg <= 32'h0;
    end else begin
      if (io_if_flush) begin
        pc_4_reg <= 32'h0;
      end else begin
        if (io_if_id_write) begin
          pc_4_reg <= io_if_pc_4;
        end
      end
    end
  end
endmodule
module RegFile( // @[:@70.2]
  input         clock, // @[:@71.4]
  input  [4:0]  io_rs1, // @[:@73.4]
  input  [4:0]  io_rs2, // @[:@73.4]
  input  [4:0]  io_rd, // @[:@73.4]
  input  [31:0] io_wdata, // @[:@73.4]
  input         io_regwrite, // @[:@73.4]
  output [31:0] io_rs1_out, // @[:@73.4]
  output [31:0] io_rs2_out // @[:@73.4]
);
  reg [31:0] regfile [0:31]; // @[RegFile.scala 27:20:@75.4]
  reg [31:0] _RAND_0;
  wire [31:0] regfile__T_25_data; // @[RegFile.scala 27:20:@75.4]
  wire [4:0] regfile__T_25_addr; // @[RegFile.scala 27:20:@75.4]
  wire [31:0] regfile__T_27_data; // @[RegFile.scala 27:20:@75.4]
  wire [4:0] regfile__T_27_addr; // @[RegFile.scala 27:20:@75.4]
  wire [31:0] regfile__T_34_data; // @[RegFile.scala 27:20:@75.4]
  wire [4:0] regfile__T_34_addr; // @[RegFile.scala 27:20:@75.4]
  wire [31:0] regfile__T_36_data; // @[RegFile.scala 27:20:@75.4]
  wire [4:0] regfile__T_36_addr; // @[RegFile.scala 27:20:@75.4]
  wire  regfile__T_36_mask; // @[RegFile.scala 27:20:@75.4]
  wire  regfile__T_36_en; // @[RegFile.scala 27:20:@75.4]
  wire  _T_22; // @[RegFile.scala 31:58:@77.4]
  wire  inside_forward_1; // @[RegFile.scala 31:47:@78.4]
  wire  _T_24; // @[RegFile.scala 32:58:@80.4]
  wire  inside_forward_2; // @[RegFile.scala 32:47:@81.4]
  wire  _T_31; // @[RegFile.scala 37:60:@89.4]
  wire [31:0] _T_33; // @[RegFile.scala 37:53:@90.4]
  assign regfile__T_25_addr = io_rs1;
  assign regfile__T_25_data = regfile[regfile__T_25_addr]; // @[RegFile.scala 27:20:@75.4]
  assign regfile__T_27_addr = io_rs2;
  assign regfile__T_27_data = regfile[regfile__T_27_addr]; // @[RegFile.scala 27:20:@75.4]
  assign regfile__T_34_addr = io_rd;
  assign regfile__T_34_data = regfile[regfile__T_34_addr]; // @[RegFile.scala 27:20:@75.4]
  assign regfile__T_36_data = io_regwrite ? _T_33 : regfile__T_34_data;
  assign regfile__T_36_addr = io_rd;
  assign regfile__T_36_mask = 1'h1;
  assign regfile__T_36_en = 1'h1;
  assign _T_22 = io_rs1 == io_rd; // @[RegFile.scala 31:58:@77.4]
  assign inside_forward_1 = io_regwrite & _T_22; // @[RegFile.scala 31:47:@78.4]
  assign _T_24 = io_rs2 == io_rd; // @[RegFile.scala 32:58:@80.4]
  assign inside_forward_2 = io_regwrite & _T_24; // @[RegFile.scala 32:47:@81.4]
  assign _T_31 = io_rd == 5'h0; // @[RegFile.scala 37:60:@89.4]
  assign _T_33 = _T_31 ? 32'h0 : io_wdata; // @[RegFile.scala 37:53:@90.4]
  assign io_rs1_out = inside_forward_1 ? io_wdata : regfile__T_25_data; // @[RegFile.scala 34:14:@84.4]
  assign io_rs2_out = inside_forward_2 ? io_wdata : regfile__T_27_data; // @[RegFile.scala 35:14:@87.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    regfile[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(regfile__T_36_en & regfile__T_36_mask) begin
      regfile[regfile__T_36_addr] <= regfile__T_36_data; // @[RegFile.scala 27:20:@75.4]
    end
  end
endmodule
module ImmGen( // @[:@96.2]
  input  [31:0] io_inst_in, // @[:@99.4]
  input  [2:0]  io_imm_sel, // @[:@99.4]
  output [31:0] io_imm // @[:@99.4]
);
  wire [11:0] _T_12; // @[ImmGen.scala 26:25:@102.4]
  wire [11:0] Iimm; // @[ImmGen.scala 26:40:@103.4]
  wire [6:0] _T_13; // @[ImmGen.scala 27:29:@104.4]
  wire [4:0] _T_14; // @[ImmGen.scala 27:49:@105.4]
  wire [11:0] _T_15; // @[Cat.scala 30:58:@106.4]
  wire [11:0] Simm; // @[ImmGen.scala 27:64:@107.4]
  wire  _T_16; // @[ImmGen.scala 28:29:@108.4]
  wire  _T_17; // @[ImmGen.scala 28:45:@109.4]
  wire [5:0] _T_18; // @[ImmGen.scala 28:60:@110.4]
  wire [3:0] _T_19; // @[ImmGen.scala 28:80:@111.4]
  wire [12:0] _T_24; // @[Cat.scala 30:58:@115.4]
  wire [12:0] SBimm; // @[ImmGen.scala 28:105:@116.4]
  wire [19:0] _T_25; // @[ImmGen.scala 29:29:@117.4]
  wire [31:0] _T_27; // @[Cat.scala 30:58:@118.4]
  wire [31:0] Uimm; // @[ImmGen.scala 29:56:@119.4]
  wire [7:0] _T_29; // @[ImmGen.scala 30:45:@121.4]
  wire  _T_30; // @[ImmGen.scala 30:65:@122.4]
  wire [9:0] _T_31; // @[ImmGen.scala 30:81:@123.4]
  wire [20:0] _T_36; // @[Cat.scala 30:58:@127.4]
  wire [20:0] UJimm; // @[ImmGen.scala 30:107:@128.4]
  wire  _T_90; // @[Mux.scala 46:19:@129.4]
  wire [20:0] _T_91; // @[Mux.scala 46:16:@130.4]
  wire  _T_92; // @[Mux.scala 46:19:@131.4]
  wire [31:0] _T_93; // @[Mux.scala 46:16:@132.4]
  wire  _T_94; // @[Mux.scala 46:19:@133.4]
  wire [31:0] _T_95; // @[Mux.scala 46:16:@134.4]
  wire  _T_96; // @[Mux.scala 46:19:@135.4]
  wire [31:0] _T_97; // @[Mux.scala 46:16:@136.4]
  wire  _T_98; // @[Mux.scala 46:19:@137.4]
  wire [31:0] _T_99; // @[Mux.scala 46:16:@138.4]
  wire  _T_100; // @[Mux.scala 46:19:@139.4]
  wire [31:0] _T_101; // @[Mux.scala 46:16:@140.4]
  assign _T_12 = io_inst_in[31:20]; // @[ImmGen.scala 26:25:@102.4]
  assign Iimm = $signed(_T_12); // @[ImmGen.scala 26:40:@103.4]
  assign _T_13 = io_inst_in[31:25]; // @[ImmGen.scala 27:29:@104.4]
  assign _T_14 = io_inst_in[11:7]; // @[ImmGen.scala 27:49:@105.4]
  assign _T_15 = {_T_13,_T_14}; // @[Cat.scala 30:58:@106.4]
  assign Simm = $signed(_T_15); // @[ImmGen.scala 27:64:@107.4]
  assign _T_16 = io_inst_in[31]; // @[ImmGen.scala 28:29:@108.4]
  assign _T_17 = io_inst_in[7]; // @[ImmGen.scala 28:45:@109.4]
  assign _T_18 = io_inst_in[30:25]; // @[ImmGen.scala 28:60:@110.4]
  assign _T_19 = io_inst_in[11:8]; // @[ImmGen.scala 28:80:@111.4]
  assign _T_24 = {_T_16,_T_17,_T_18,_T_19,1'h0}; // @[Cat.scala 30:58:@115.4]
  assign SBimm = $signed(_T_24); // @[ImmGen.scala 28:105:@116.4]
  assign _T_25 = io_inst_in[31:12]; // @[ImmGen.scala 29:29:@117.4]
  assign _T_27 = {_T_25,12'h0}; // @[Cat.scala 30:58:@118.4]
  assign Uimm = $signed(_T_27); // @[ImmGen.scala 29:56:@119.4]
  assign _T_29 = io_inst_in[19:12]; // @[ImmGen.scala 30:45:@121.4]
  assign _T_30 = io_inst_in[20]; // @[ImmGen.scala 30:65:@122.4]
  assign _T_31 = io_inst_in[30:21]; // @[ImmGen.scala 30:81:@123.4]
  assign _T_36 = {_T_16,_T_29,_T_30,_T_31,1'h0}; // @[Cat.scala 30:58:@127.4]
  assign UJimm = $signed(_T_36); // @[ImmGen.scala 30:107:@128.4]
  assign _T_90 = 3'h6 == io_imm_sel; // @[Mux.scala 46:19:@129.4]
  assign _T_91 = _T_90 ? $signed(UJimm) : $signed(21'sh0); // @[Mux.scala 46:16:@130.4]
  assign _T_92 = 3'h5 == io_imm_sel; // @[Mux.scala 46:19:@131.4]
  assign _T_93 = _T_92 ? $signed(Uimm) : $signed({{11{_T_91[20]}},_T_91}); // @[Mux.scala 46:16:@132.4]
  assign _T_94 = 3'h4 == io_imm_sel; // @[Mux.scala 46:19:@133.4]
  assign _T_95 = _T_94 ? $signed({{19{SBimm[12]}},SBimm}) : $signed(_T_93); // @[Mux.scala 46:16:@134.4]
  assign _T_96 = 3'h3 == io_imm_sel; // @[Mux.scala 46:19:@135.4]
  assign _T_97 = _T_96 ? $signed({{20{Simm[11]}},Simm}) : $signed(_T_95); // @[Mux.scala 46:16:@136.4]
  assign _T_98 = 3'h2 == io_imm_sel; // @[Mux.scala 46:19:@137.4]
  assign _T_99 = _T_98 ? $signed({{20{Iimm[11]}},Iimm}) : $signed(_T_97); // @[Mux.scala 46:16:@138.4]
  assign _T_100 = 3'h1 == io_imm_sel; // @[Mux.scala 46:19:@139.4]
  assign _T_101 = _T_100 ? $signed(32'sh0) : $signed(_T_99); // @[Mux.scala 46:16:@140.4]
  assign io_imm = $unsigned(_T_101); // @[ImmGen.scala 32:10:@142.4]
endmodule
module Control( // @[:@144.2]
  input  [31:0] io_inst, // @[:@147.4]
  output        io_Reg_Write, // @[:@147.4]
  output [2:0]  io_Imm_Sel, // @[:@147.4]
  output        io_ALU_Src, // @[:@147.4]
  output [4:0]  io_ALUOp, // @[:@147.4]
  output        io_Branch, // @[:@147.4]
  output        io_Branch_Src, // @[:@147.4]
  output        io_Mem_Read, // @[:@147.4]
  output        io_Mem_Write, // @[:@147.4]
  output [1:0]  io_Data_Size, // @[:@147.4]
  output        io_Load_Type, // @[:@147.4]
  output [2:0]  io_Mem_to_Reg, // @[:@147.4]
  output        io_Jump_Type // @[:@147.4]
);
  wire [31:0] _T_33; // @[Lookup.scala 9:38:@149.4]
  wire  _T_34; // @[Lookup.scala 9:38:@150.4]
  wire  _T_38; // @[Lookup.scala 9:38:@152.4]
  wire  _T_42; // @[Lookup.scala 9:38:@154.4]
  wire  _T_46; // @[Lookup.scala 9:38:@156.4]
  wire  _T_50; // @[Lookup.scala 9:38:@158.4]
  wire [31:0] _T_53; // @[Lookup.scala 9:38:@159.4]
  wire  _T_54; // @[Lookup.scala 9:38:@160.4]
  wire  _T_58; // @[Lookup.scala 9:38:@162.4]
  wire  _T_62; // @[Lookup.scala 9:38:@164.4]
  wire  _T_66; // @[Lookup.scala 9:38:@166.4]
  wire  _T_70; // @[Lookup.scala 9:38:@168.4]
  wire  _T_74; // @[Lookup.scala 9:38:@170.4]
  wire  _T_78; // @[Lookup.scala 9:38:@172.4]
  wire  _T_82; // @[Lookup.scala 9:38:@174.4]
  wire  _T_86; // @[Lookup.scala 9:38:@176.4]
  wire  _T_90; // @[Lookup.scala 9:38:@178.4]
  wire  _T_94; // @[Lookup.scala 9:38:@180.4]
  wire  _T_98; // @[Lookup.scala 9:38:@182.4]
  wire  _T_102; // @[Lookup.scala 9:38:@184.4]
  wire  _T_106; // @[Lookup.scala 9:38:@186.4]
  wire  _T_110; // @[Lookup.scala 9:38:@188.4]
  wire  _T_114; // @[Lookup.scala 9:38:@190.4]
  wire  _T_118; // @[Lookup.scala 9:38:@192.4]
  wire  _T_122; // @[Lookup.scala 9:38:@194.4]
  wire  _T_126; // @[Lookup.scala 9:38:@196.4]
  wire  _T_130; // @[Lookup.scala 9:38:@198.4]
  wire  _T_134; // @[Lookup.scala 9:38:@200.4]
  wire  _T_138; // @[Lookup.scala 9:38:@202.4]
  wire  _T_142; // @[Lookup.scala 9:38:@204.4]
  wire  _T_146; // @[Lookup.scala 9:38:@206.4]
  wire  _T_150; // @[Lookup.scala 9:38:@208.4]
  wire  _T_154; // @[Lookup.scala 9:38:@210.4]
  wire  _T_158; // @[Lookup.scala 9:38:@212.4]
  wire  _T_162; // @[Lookup.scala 9:38:@214.4]
  wire [31:0] _T_165; // @[Lookup.scala 9:38:@215.4]
  wire  _T_166; // @[Lookup.scala 9:38:@216.4]
  wire  _T_170; // @[Lookup.scala 9:38:@218.4]
  wire  _T_174; // @[Lookup.scala 9:38:@220.4]
  wire  _T_178; // @[Lookup.scala 9:38:@222.4]
  wire  _T_185; // @[Lookup.scala 11:37:@227.4]
  wire  _T_186; // @[Lookup.scala 11:37:@228.4]
  wire  _T_187; // @[Lookup.scala 11:37:@229.4]
  wire  _T_188; // @[Lookup.scala 11:37:@230.4]
  wire  _T_189; // @[Lookup.scala 11:37:@231.4]
  wire  _T_190; // @[Lookup.scala 11:37:@232.4]
  wire  _T_191; // @[Lookup.scala 11:37:@233.4]
  wire  _T_192; // @[Lookup.scala 11:37:@234.4]
  wire  _T_193; // @[Lookup.scala 11:37:@235.4]
  wire  _T_194; // @[Lookup.scala 11:37:@236.4]
  wire  _T_195; // @[Lookup.scala 11:37:@237.4]
  wire  _T_196; // @[Lookup.scala 11:37:@238.4]
  wire  _T_197; // @[Lookup.scala 11:37:@239.4]
  wire  _T_198; // @[Lookup.scala 11:37:@240.4]
  wire  _T_199; // @[Lookup.scala 11:37:@241.4]
  wire  _T_200; // @[Lookup.scala 11:37:@242.4]
  wire  _T_201; // @[Lookup.scala 11:37:@243.4]
  wire  _T_202; // @[Lookup.scala 11:37:@244.4]
  wire  _T_203; // @[Lookup.scala 11:37:@245.4]
  wire  _T_204; // @[Lookup.scala 11:37:@246.4]
  wire  _T_205; // @[Lookup.scala 11:37:@247.4]
  wire  _T_206; // @[Lookup.scala 11:37:@248.4]
  wire  _T_207; // @[Lookup.scala 11:37:@249.4]
  wire  _T_208; // @[Lookup.scala 11:37:@250.4]
  wire  _T_209; // @[Lookup.scala 11:37:@251.4]
  wire  _T_210; // @[Lookup.scala 11:37:@252.4]
  wire  _T_211; // @[Lookup.scala 11:37:@253.4]
  wire  _T_212; // @[Lookup.scala 11:37:@254.4]
  wire  _T_213; // @[Lookup.scala 11:37:@255.4]
  wire  _T_214; // @[Lookup.scala 11:37:@256.4]
  wire  _T_215; // @[Lookup.scala 11:37:@257.4]
  wire  _T_216; // @[Lookup.scala 11:37:@258.4]
  wire  _T_217; // @[Lookup.scala 11:37:@259.4]
  wire  _T_218; // @[Lookup.scala 11:37:@260.4]
  wire  _T_219; // @[Lookup.scala 11:37:@261.4]
  wire [2:0] _T_221; // @[Lookup.scala 11:37:@264.4]
  wire [2:0] _T_222; // @[Lookup.scala 11:37:@265.4]
  wire [2:0] _T_223; // @[Lookup.scala 11:37:@266.4]
  wire [2:0] _T_224; // @[Lookup.scala 11:37:@267.4]
  wire [2:0] _T_225; // @[Lookup.scala 11:37:@268.4]
  wire [2:0] _T_226; // @[Lookup.scala 11:37:@269.4]
  wire [2:0] _T_227; // @[Lookup.scala 11:37:@270.4]
  wire [2:0] _T_228; // @[Lookup.scala 11:37:@271.4]
  wire [2:0] _T_229; // @[Lookup.scala 11:37:@272.4]
  wire [2:0] _T_230; // @[Lookup.scala 11:37:@273.4]
  wire [2:0] _T_231; // @[Lookup.scala 11:37:@274.4]
  wire [2:0] _T_232; // @[Lookup.scala 11:37:@275.4]
  wire [2:0] _T_233; // @[Lookup.scala 11:37:@276.4]
  wire [2:0] _T_234; // @[Lookup.scala 11:37:@277.4]
  wire [2:0] _T_235; // @[Lookup.scala 11:37:@278.4]
  wire [2:0] _T_236; // @[Lookup.scala 11:37:@279.4]
  wire [2:0] _T_237; // @[Lookup.scala 11:37:@280.4]
  wire [2:0] _T_238; // @[Lookup.scala 11:37:@281.4]
  wire [2:0] _T_239; // @[Lookup.scala 11:37:@282.4]
  wire [2:0] _T_240; // @[Lookup.scala 11:37:@283.4]
  wire [2:0] _T_241; // @[Lookup.scala 11:37:@284.4]
  wire [2:0] _T_242; // @[Lookup.scala 11:37:@285.4]
  wire [2:0] _T_243; // @[Lookup.scala 11:37:@286.4]
  wire [2:0] _T_244; // @[Lookup.scala 11:37:@287.4]
  wire [2:0] _T_245; // @[Lookup.scala 11:37:@288.4]
  wire [2:0] _T_246; // @[Lookup.scala 11:37:@289.4]
  wire [2:0] _T_247; // @[Lookup.scala 11:37:@290.4]
  wire [2:0] _T_248; // @[Lookup.scala 11:37:@291.4]
  wire [2:0] _T_249; // @[Lookup.scala 11:37:@292.4]
  wire [2:0] _T_250; // @[Lookup.scala 11:37:@293.4]
  wire [2:0] _T_251; // @[Lookup.scala 11:37:@294.4]
  wire [2:0] _T_252; // @[Lookup.scala 11:37:@295.4]
  wire [2:0] _T_253; // @[Lookup.scala 11:37:@296.4]
  wire [2:0] _T_254; // @[Lookup.scala 11:37:@297.4]
  wire [2:0] _T_255; // @[Lookup.scala 11:37:@298.4]
  wire [2:0] _T_256; // @[Lookup.scala 11:37:@299.4]
  wire  _T_269; // @[Lookup.scala 11:37:@313.4]
  wire  _T_270; // @[Lookup.scala 11:37:@314.4]
  wire  _T_271; // @[Lookup.scala 11:37:@315.4]
  wire  _T_272; // @[Lookup.scala 11:37:@316.4]
  wire  _T_273; // @[Lookup.scala 11:37:@317.4]
  wire  _T_274; // @[Lookup.scala 11:37:@318.4]
  wire  _T_275; // @[Lookup.scala 11:37:@319.4]
  wire  _T_276; // @[Lookup.scala 11:37:@320.4]
  wire  _T_277; // @[Lookup.scala 11:37:@321.4]
  wire  _T_278; // @[Lookup.scala 11:37:@322.4]
  wire  _T_279; // @[Lookup.scala 11:37:@323.4]
  wire  _T_280; // @[Lookup.scala 11:37:@324.4]
  wire  _T_281; // @[Lookup.scala 11:37:@325.4]
  wire  _T_282; // @[Lookup.scala 11:37:@326.4]
  wire  _T_283; // @[Lookup.scala 11:37:@327.4]
  wire  _T_284; // @[Lookup.scala 11:37:@328.4]
  wire  _T_285; // @[Lookup.scala 11:37:@329.4]
  wire  _T_286; // @[Lookup.scala 11:37:@330.4]
  wire  _T_287; // @[Lookup.scala 11:37:@331.4]
  wire  _T_288; // @[Lookup.scala 11:37:@332.4]
  wire  _T_289; // @[Lookup.scala 11:37:@333.4]
  wire  _T_290; // @[Lookup.scala 11:37:@334.4]
  wire  _T_291; // @[Lookup.scala 11:37:@335.4]
  wire  _T_292; // @[Lookup.scala 11:37:@336.4]
  wire  _T_293; // @[Lookup.scala 11:37:@337.4]
  wire [4:0] _T_295; // @[Lookup.scala 11:37:@340.4]
  wire [4:0] _T_296; // @[Lookup.scala 11:37:@341.4]
  wire [4:0] _T_297; // @[Lookup.scala 11:37:@342.4]
  wire [4:0] _T_298; // @[Lookup.scala 11:37:@343.4]
  wire [4:0] _T_299; // @[Lookup.scala 11:37:@344.4]
  wire [4:0] _T_300; // @[Lookup.scala 11:37:@345.4]
  wire [4:0] _T_301; // @[Lookup.scala 11:37:@346.4]
  wire [4:0] _T_302; // @[Lookup.scala 11:37:@347.4]
  wire [4:0] _T_303; // @[Lookup.scala 11:37:@348.4]
  wire [4:0] _T_304; // @[Lookup.scala 11:37:@349.4]
  wire [4:0] _T_305; // @[Lookup.scala 11:37:@350.4]
  wire [4:0] _T_306; // @[Lookup.scala 11:37:@351.4]
  wire [4:0] _T_307; // @[Lookup.scala 11:37:@352.4]
  wire [4:0] _T_308; // @[Lookup.scala 11:37:@353.4]
  wire [4:0] _T_309; // @[Lookup.scala 11:37:@354.4]
  wire [4:0] _T_310; // @[Lookup.scala 11:37:@355.4]
  wire [4:0] _T_311; // @[Lookup.scala 11:37:@356.4]
  wire [4:0] _T_312; // @[Lookup.scala 11:37:@357.4]
  wire [4:0] _T_313; // @[Lookup.scala 11:37:@358.4]
  wire [4:0] _T_314; // @[Lookup.scala 11:37:@359.4]
  wire [4:0] _T_315; // @[Lookup.scala 11:37:@360.4]
  wire [4:0] _T_316; // @[Lookup.scala 11:37:@361.4]
  wire [4:0] _T_317; // @[Lookup.scala 11:37:@362.4]
  wire [4:0] _T_318; // @[Lookup.scala 11:37:@363.4]
  wire [4:0] _T_319; // @[Lookup.scala 11:37:@364.4]
  wire [4:0] _T_320; // @[Lookup.scala 11:37:@365.4]
  wire [4:0] _T_321; // @[Lookup.scala 11:37:@366.4]
  wire [4:0] _T_322; // @[Lookup.scala 11:37:@367.4]
  wire [4:0] _T_323; // @[Lookup.scala 11:37:@368.4]
  wire [4:0] _T_324; // @[Lookup.scala 11:37:@369.4]
  wire [4:0] _T_325; // @[Lookup.scala 11:37:@370.4]
  wire [4:0] _T_326; // @[Lookup.scala 11:37:@371.4]
  wire [4:0] _T_327; // @[Lookup.scala 11:37:@372.4]
  wire [4:0] _T_328; // @[Lookup.scala 11:37:@373.4]
  wire [4:0] _T_329; // @[Lookup.scala 11:37:@374.4]
  wire [4:0] _T_330; // @[Lookup.scala 11:37:@375.4]
  wire  _T_335; // @[Lookup.scala 11:37:@381.4]
  wire  _T_336; // @[Lookup.scala 11:37:@382.4]
  wire  _T_337; // @[Lookup.scala 11:37:@383.4]
  wire  _T_338; // @[Lookup.scala 11:37:@384.4]
  wire  _T_339; // @[Lookup.scala 11:37:@385.4]
  wire  _T_340; // @[Lookup.scala 11:37:@386.4]
  wire  _T_341; // @[Lookup.scala 11:37:@387.4]
  wire  _T_342; // @[Lookup.scala 11:37:@388.4]
  wire  _T_343; // @[Lookup.scala 11:37:@389.4]
  wire  _T_344; // @[Lookup.scala 11:37:@390.4]
  wire  _T_345; // @[Lookup.scala 11:37:@391.4]
  wire  _T_346; // @[Lookup.scala 11:37:@392.4]
  wire  _T_347; // @[Lookup.scala 11:37:@393.4]
  wire  _T_348; // @[Lookup.scala 11:37:@394.4]
  wire  _T_349; // @[Lookup.scala 11:37:@395.4]
  wire  _T_350; // @[Lookup.scala 11:37:@396.4]
  wire  _T_351; // @[Lookup.scala 11:37:@397.4]
  wire  _T_352; // @[Lookup.scala 11:37:@398.4]
  wire  _T_353; // @[Lookup.scala 11:37:@399.4]
  wire  _T_354; // @[Lookup.scala 11:37:@400.4]
  wire  _T_355; // @[Lookup.scala 11:37:@401.4]
  wire  _T_356; // @[Lookup.scala 11:37:@402.4]
  wire  _T_357; // @[Lookup.scala 11:37:@403.4]
  wire  _T_358; // @[Lookup.scala 11:37:@404.4]
  wire  _T_359; // @[Lookup.scala 11:37:@405.4]
  wire  _T_360; // @[Lookup.scala 11:37:@406.4]
  wire  _T_361; // @[Lookup.scala 11:37:@407.4]
  wire  _T_362; // @[Lookup.scala 11:37:@408.4]
  wire  _T_363; // @[Lookup.scala 11:37:@409.4]
  wire  _T_364; // @[Lookup.scala 11:37:@410.4]
  wire  _T_365; // @[Lookup.scala 11:37:@411.4]
  wire  _T_366; // @[Lookup.scala 11:37:@412.4]
  wire  _T_367; // @[Lookup.scala 11:37:@413.4]
  wire  _T_372; // @[Lookup.scala 11:37:@419.4]
  wire  _T_373; // @[Lookup.scala 11:37:@420.4]
  wire  _T_374; // @[Lookup.scala 11:37:@421.4]
  wire  _T_375; // @[Lookup.scala 11:37:@422.4]
  wire  _T_376; // @[Lookup.scala 11:37:@423.4]
  wire  _T_377; // @[Lookup.scala 11:37:@424.4]
  wire  _T_378; // @[Lookup.scala 11:37:@425.4]
  wire  _T_379; // @[Lookup.scala 11:37:@426.4]
  wire  _T_380; // @[Lookup.scala 11:37:@427.4]
  wire  _T_381; // @[Lookup.scala 11:37:@428.4]
  wire  _T_382; // @[Lookup.scala 11:37:@429.4]
  wire  _T_383; // @[Lookup.scala 11:37:@430.4]
  wire  _T_384; // @[Lookup.scala 11:37:@431.4]
  wire  _T_385; // @[Lookup.scala 11:37:@432.4]
  wire  _T_386; // @[Lookup.scala 11:37:@433.4]
  wire  _T_387; // @[Lookup.scala 11:37:@434.4]
  wire  _T_388; // @[Lookup.scala 11:37:@435.4]
  wire  _T_389; // @[Lookup.scala 11:37:@436.4]
  wire  _T_390; // @[Lookup.scala 11:37:@437.4]
  wire  _T_391; // @[Lookup.scala 11:37:@438.4]
  wire  _T_392; // @[Lookup.scala 11:37:@439.4]
  wire  _T_393; // @[Lookup.scala 11:37:@440.4]
  wire  _T_394; // @[Lookup.scala 11:37:@441.4]
  wire  _T_395; // @[Lookup.scala 11:37:@442.4]
  wire  _T_396; // @[Lookup.scala 11:37:@443.4]
  wire  _T_397; // @[Lookup.scala 11:37:@444.4]
  wire  _T_398; // @[Lookup.scala 11:37:@445.4]
  wire  _T_399; // @[Lookup.scala 11:37:@446.4]
  wire  _T_400; // @[Lookup.scala 11:37:@447.4]
  wire  _T_401; // @[Lookup.scala 11:37:@448.4]
  wire  _T_402; // @[Lookup.scala 11:37:@449.4]
  wire  _T_403; // @[Lookup.scala 11:37:@450.4]
  wire  _T_404; // @[Lookup.scala 11:37:@451.4]
  wire  _T_420; // @[Lookup.scala 11:37:@468.4]
  wire  _T_421; // @[Lookup.scala 11:37:@469.4]
  wire  _T_422; // @[Lookup.scala 11:37:@470.4]
  wire  _T_423; // @[Lookup.scala 11:37:@471.4]
  wire  _T_424; // @[Lookup.scala 11:37:@472.4]
  wire  _T_425; // @[Lookup.scala 11:37:@473.4]
  wire  _T_426; // @[Lookup.scala 11:37:@474.4]
  wire  _T_427; // @[Lookup.scala 11:37:@475.4]
  wire  _T_428; // @[Lookup.scala 11:37:@476.4]
  wire  _T_429; // @[Lookup.scala 11:37:@477.4]
  wire  _T_430; // @[Lookup.scala 11:37:@478.4]
  wire  _T_431; // @[Lookup.scala 11:37:@479.4]
  wire  _T_432; // @[Lookup.scala 11:37:@480.4]
  wire  _T_433; // @[Lookup.scala 11:37:@481.4]
  wire  _T_434; // @[Lookup.scala 11:37:@482.4]
  wire  _T_435; // @[Lookup.scala 11:37:@483.4]
  wire  _T_436; // @[Lookup.scala 11:37:@484.4]
  wire  _T_437; // @[Lookup.scala 11:37:@485.4]
  wire  _T_438; // @[Lookup.scala 11:37:@486.4]
  wire  _T_439; // @[Lookup.scala 11:37:@487.4]
  wire  _T_440; // @[Lookup.scala 11:37:@488.4]
  wire  _T_441; // @[Lookup.scala 11:37:@489.4]
  wire  _T_456; // @[Lookup.scala 11:37:@505.4]
  wire  _T_457; // @[Lookup.scala 11:37:@506.4]
  wire  _T_458; // @[Lookup.scala 11:37:@507.4]
  wire  _T_459; // @[Lookup.scala 11:37:@508.4]
  wire  _T_460; // @[Lookup.scala 11:37:@509.4]
  wire  _T_461; // @[Lookup.scala 11:37:@510.4]
  wire  _T_462; // @[Lookup.scala 11:37:@511.4]
  wire  _T_463; // @[Lookup.scala 11:37:@512.4]
  wire  _T_464; // @[Lookup.scala 11:37:@513.4]
  wire  _T_465; // @[Lookup.scala 11:37:@514.4]
  wire  _T_466; // @[Lookup.scala 11:37:@515.4]
  wire  _T_467; // @[Lookup.scala 11:37:@516.4]
  wire  _T_468; // @[Lookup.scala 11:37:@517.4]
  wire  _T_469; // @[Lookup.scala 11:37:@518.4]
  wire  _T_470; // @[Lookup.scala 11:37:@519.4]
  wire  _T_471; // @[Lookup.scala 11:37:@520.4]
  wire  _T_472; // @[Lookup.scala 11:37:@521.4]
  wire  _T_473; // @[Lookup.scala 11:37:@522.4]
  wire  _T_474; // @[Lookup.scala 11:37:@523.4]
  wire  _T_475; // @[Lookup.scala 11:37:@524.4]
  wire  _T_476; // @[Lookup.scala 11:37:@525.4]
  wire  _T_477; // @[Lookup.scala 11:37:@526.4]
  wire  _T_478; // @[Lookup.scala 11:37:@527.4]
  wire [1:0] _T_490; // @[Lookup.scala 11:37:@540.4]
  wire [1:0] _T_491; // @[Lookup.scala 11:37:@541.4]
  wire [1:0] _T_492; // @[Lookup.scala 11:37:@542.4]
  wire [1:0] _T_493; // @[Lookup.scala 11:37:@543.4]
  wire [1:0] _T_494; // @[Lookup.scala 11:37:@544.4]
  wire [1:0] _T_495; // @[Lookup.scala 11:37:@545.4]
  wire [1:0] _T_496; // @[Lookup.scala 11:37:@546.4]
  wire [1:0] _T_497; // @[Lookup.scala 11:37:@547.4]
  wire [1:0] _T_498; // @[Lookup.scala 11:37:@548.4]
  wire [1:0] _T_499; // @[Lookup.scala 11:37:@549.4]
  wire [1:0] _T_500; // @[Lookup.scala 11:37:@550.4]
  wire [1:0] _T_501; // @[Lookup.scala 11:37:@551.4]
  wire [1:0] _T_502; // @[Lookup.scala 11:37:@552.4]
  wire [1:0] _T_503; // @[Lookup.scala 11:37:@553.4]
  wire [1:0] _T_504; // @[Lookup.scala 11:37:@554.4]
  wire [1:0] _T_505; // @[Lookup.scala 11:37:@555.4]
  wire [1:0] _T_506; // @[Lookup.scala 11:37:@556.4]
  wire [1:0] _T_507; // @[Lookup.scala 11:37:@557.4]
  wire [1:0] _T_508; // @[Lookup.scala 11:37:@558.4]
  wire [1:0] _T_509; // @[Lookup.scala 11:37:@559.4]
  wire [1:0] _T_510; // @[Lookup.scala 11:37:@560.4]
  wire [1:0] _T_511; // @[Lookup.scala 11:37:@561.4]
  wire [1:0] _T_512; // @[Lookup.scala 11:37:@562.4]
  wire [1:0] _T_513; // @[Lookup.scala 11:37:@563.4]
  wire [1:0] _T_514; // @[Lookup.scala 11:37:@564.4]
  wire [1:0] _T_515; // @[Lookup.scala 11:37:@565.4]
  wire  _T_532; // @[Lookup.scala 11:37:@583.4]
  wire  _T_533; // @[Lookup.scala 11:37:@584.4]
  wire  _T_534; // @[Lookup.scala 11:37:@585.4]
  wire  _T_535; // @[Lookup.scala 11:37:@586.4]
  wire  _T_536; // @[Lookup.scala 11:37:@587.4]
  wire  _T_537; // @[Lookup.scala 11:37:@588.4]
  wire  _T_538; // @[Lookup.scala 11:37:@589.4]
  wire  _T_539; // @[Lookup.scala 11:37:@590.4]
  wire  _T_540; // @[Lookup.scala 11:37:@591.4]
  wire  _T_541; // @[Lookup.scala 11:37:@592.4]
  wire  _T_542; // @[Lookup.scala 11:37:@593.4]
  wire  _T_543; // @[Lookup.scala 11:37:@594.4]
  wire  _T_544; // @[Lookup.scala 11:37:@595.4]
  wire  _T_545; // @[Lookup.scala 11:37:@596.4]
  wire  _T_546; // @[Lookup.scala 11:37:@597.4]
  wire  _T_547; // @[Lookup.scala 11:37:@598.4]
  wire  _T_548; // @[Lookup.scala 11:37:@599.4]
  wire  _T_549; // @[Lookup.scala 11:37:@600.4]
  wire  _T_550; // @[Lookup.scala 11:37:@601.4]
  wire  _T_551; // @[Lookup.scala 11:37:@602.4]
  wire  _T_552; // @[Lookup.scala 11:37:@603.4]
  wire [2:0] _T_554; // @[Lookup.scala 11:37:@606.4]
  wire [2:0] _T_555; // @[Lookup.scala 11:37:@607.4]
  wire [2:0] _T_556; // @[Lookup.scala 11:37:@608.4]
  wire [2:0] _T_557; // @[Lookup.scala 11:37:@609.4]
  wire [2:0] _T_558; // @[Lookup.scala 11:37:@610.4]
  wire [2:0] _T_559; // @[Lookup.scala 11:37:@611.4]
  wire [2:0] _T_560; // @[Lookup.scala 11:37:@612.4]
  wire [2:0] _T_561; // @[Lookup.scala 11:37:@613.4]
  wire [2:0] _T_562; // @[Lookup.scala 11:37:@614.4]
  wire [2:0] _T_563; // @[Lookup.scala 11:37:@615.4]
  wire [2:0] _T_564; // @[Lookup.scala 11:37:@616.4]
  wire [2:0] _T_565; // @[Lookup.scala 11:37:@617.4]
  wire [2:0] _T_566; // @[Lookup.scala 11:37:@618.4]
  wire [2:0] _T_567; // @[Lookup.scala 11:37:@619.4]
  wire [2:0] _T_568; // @[Lookup.scala 11:37:@620.4]
  wire [2:0] _T_569; // @[Lookup.scala 11:37:@621.4]
  wire [2:0] _T_570; // @[Lookup.scala 11:37:@622.4]
  wire [2:0] _T_571; // @[Lookup.scala 11:37:@623.4]
  wire [2:0] _T_572; // @[Lookup.scala 11:37:@624.4]
  wire [2:0] _T_573; // @[Lookup.scala 11:37:@625.4]
  wire [2:0] _T_574; // @[Lookup.scala 11:37:@626.4]
  wire [2:0] _T_575; // @[Lookup.scala 11:37:@627.4]
  wire [2:0] _T_576; // @[Lookup.scala 11:37:@628.4]
  wire [2:0] _T_577; // @[Lookup.scala 11:37:@629.4]
  wire [2:0] _T_578; // @[Lookup.scala 11:37:@630.4]
  wire [2:0] _T_579; // @[Lookup.scala 11:37:@631.4]
  wire [2:0] _T_580; // @[Lookup.scala 11:37:@632.4]
  wire [2:0] _T_581; // @[Lookup.scala 11:37:@633.4]
  wire [2:0] _T_582; // @[Lookup.scala 11:37:@634.4]
  wire [2:0] _T_583; // @[Lookup.scala 11:37:@635.4]
  wire [2:0] _T_584; // @[Lookup.scala 11:37:@636.4]
  wire [2:0] _T_585; // @[Lookup.scala 11:37:@637.4]
  wire [2:0] _T_586; // @[Lookup.scala 11:37:@638.4]
  wire [2:0] _T_587; // @[Lookup.scala 11:37:@639.4]
  wire [2:0] _T_588; // @[Lookup.scala 11:37:@640.4]
  wire [2:0] _T_589; // @[Lookup.scala 11:37:@641.4]
  wire  _T_595; // @[Lookup.scala 11:37:@648.4]
  wire  _T_596; // @[Lookup.scala 11:37:@649.4]
  wire  _T_597; // @[Lookup.scala 11:37:@650.4]
  wire  _T_598; // @[Lookup.scala 11:37:@651.4]
  wire  _T_599; // @[Lookup.scala 11:37:@652.4]
  wire  _T_600; // @[Lookup.scala 11:37:@653.4]
  wire  _T_601; // @[Lookup.scala 11:37:@654.4]
  wire  _T_602; // @[Lookup.scala 11:37:@655.4]
  wire  _T_603; // @[Lookup.scala 11:37:@656.4]
  wire  _T_604; // @[Lookup.scala 11:37:@657.4]
  wire  _T_605; // @[Lookup.scala 11:37:@658.4]
  wire  _T_606; // @[Lookup.scala 11:37:@659.4]
  wire  _T_607; // @[Lookup.scala 11:37:@660.4]
  wire  _T_608; // @[Lookup.scala 11:37:@661.4]
  wire  _T_609; // @[Lookup.scala 11:37:@662.4]
  wire  _T_610; // @[Lookup.scala 11:37:@663.4]
  wire  _T_611; // @[Lookup.scala 11:37:@664.4]
  wire  _T_612; // @[Lookup.scala 11:37:@665.4]
  wire  _T_613; // @[Lookup.scala 11:37:@666.4]
  wire  _T_614; // @[Lookup.scala 11:37:@667.4]
  wire  _T_615; // @[Lookup.scala 11:37:@668.4]
  wire  _T_616; // @[Lookup.scala 11:37:@669.4]
  wire  _T_617; // @[Lookup.scala 11:37:@670.4]
  wire  _T_618; // @[Lookup.scala 11:37:@671.4]
  wire  _T_619; // @[Lookup.scala 11:37:@672.4]
  wire  _T_620; // @[Lookup.scala 11:37:@673.4]
  wire  _T_621; // @[Lookup.scala 11:37:@674.4]
  wire  _T_622; // @[Lookup.scala 11:37:@675.4]
  wire  _T_623; // @[Lookup.scala 11:37:@676.4]
  wire  _T_624; // @[Lookup.scala 11:37:@677.4]
  wire  _T_625; // @[Lookup.scala 11:37:@678.4]
  wire  _T_626; // @[Lookup.scala 11:37:@679.4]
  assign _T_33 = io_inst & 32'hfe00707f; // @[Lookup.scala 9:38:@149.4]
  assign _T_34 = 32'h33 == _T_33; // @[Lookup.scala 9:38:@150.4]
  assign _T_38 = 32'h40000033 == _T_33; // @[Lookup.scala 9:38:@152.4]
  assign _T_42 = 32'h7033 == _T_33; // @[Lookup.scala 9:38:@154.4]
  assign _T_46 = 32'h6033 == _T_33; // @[Lookup.scala 9:38:@156.4]
  assign _T_50 = 32'h4033 == _T_33; // @[Lookup.scala 9:38:@158.4]
  assign _T_53 = io_inst & 32'h707f; // @[Lookup.scala 9:38:@159.4]
  assign _T_54 = 32'h13 == _T_53; // @[Lookup.scala 9:38:@160.4]
  assign _T_58 = 32'h7013 == _T_53; // @[Lookup.scala 9:38:@162.4]
  assign _T_62 = 32'h6013 == _T_53; // @[Lookup.scala 9:38:@164.4]
  assign _T_66 = 32'h4013 == _T_53; // @[Lookup.scala 9:38:@166.4]
  assign _T_70 = 32'h1033 == _T_33; // @[Lookup.scala 9:38:@168.4]
  assign _T_74 = 32'h5033 == _T_33; // @[Lookup.scala 9:38:@170.4]
  assign _T_78 = 32'h40005033 == _T_33; // @[Lookup.scala 9:38:@172.4]
  assign _T_82 = 32'h1013 == _T_33; // @[Lookup.scala 9:38:@174.4]
  assign _T_86 = 32'h5013 == _T_33; // @[Lookup.scala 9:38:@176.4]
  assign _T_90 = 32'h40005013 == _T_33; // @[Lookup.scala 9:38:@178.4]
  assign _T_94 = 32'h2033 == _T_33; // @[Lookup.scala 9:38:@180.4]
  assign _T_98 = 32'h3033 == _T_33; // @[Lookup.scala 9:38:@182.4]
  assign _T_102 = 32'h2013 == _T_53; // @[Lookup.scala 9:38:@184.4]
  assign _T_106 = 32'h3013 == _T_53; // @[Lookup.scala 9:38:@186.4]
  assign _T_110 = 32'h2003 == _T_53; // @[Lookup.scala 9:38:@188.4]
  assign _T_114 = 32'h1003 == _T_53; // @[Lookup.scala 9:38:@190.4]
  assign _T_118 = 32'h3 == _T_53; // @[Lookup.scala 9:38:@192.4]
  assign _T_122 = 32'h5003 == _T_53; // @[Lookup.scala 9:38:@194.4]
  assign _T_126 = 32'h4003 == _T_53; // @[Lookup.scala 9:38:@196.4]
  assign _T_130 = 32'h2023 == _T_53; // @[Lookup.scala 9:38:@198.4]
  assign _T_134 = 32'h1023 == _T_53; // @[Lookup.scala 9:38:@200.4]
  assign _T_138 = 32'h23 == _T_53; // @[Lookup.scala 9:38:@202.4]
  assign _T_142 = 32'h63 == _T_53; // @[Lookup.scala 9:38:@204.4]
  assign _T_146 = 32'h1063 == _T_53; // @[Lookup.scala 9:38:@206.4]
  assign _T_150 = 32'h4063 == _T_53; // @[Lookup.scala 9:38:@208.4]
  assign _T_154 = 32'h5063 == _T_53; // @[Lookup.scala 9:38:@210.4]
  assign _T_158 = 32'h6063 == _T_53; // @[Lookup.scala 9:38:@212.4]
  assign _T_162 = 32'h7063 == _T_53; // @[Lookup.scala 9:38:@214.4]
  assign _T_165 = io_inst & 32'h7f; // @[Lookup.scala 9:38:@215.4]
  assign _T_166 = 32'h6f == _T_165; // @[Lookup.scala 9:38:@216.4]
  assign _T_170 = 32'h67 == _T_53; // @[Lookup.scala 9:38:@218.4]
  assign _T_174 = 32'h37 == _T_165; // @[Lookup.scala 9:38:@220.4]
  assign _T_178 = 32'h17 == _T_165; // @[Lookup.scala 9:38:@222.4]
  assign _T_185 = _T_174 ? 1'h1 : _T_178; // @[Lookup.scala 11:37:@227.4]
  assign _T_186 = _T_170 ? 1'h1 : _T_185; // @[Lookup.scala 11:37:@228.4]
  assign _T_187 = _T_166 ? 1'h1 : _T_186; // @[Lookup.scala 11:37:@229.4]
  assign _T_188 = _T_162 ? 1'h0 : _T_187; // @[Lookup.scala 11:37:@230.4]
  assign _T_189 = _T_158 ? 1'h0 : _T_188; // @[Lookup.scala 11:37:@231.4]
  assign _T_190 = _T_154 ? 1'h0 : _T_189; // @[Lookup.scala 11:37:@232.4]
  assign _T_191 = _T_150 ? 1'h0 : _T_190; // @[Lookup.scala 11:37:@233.4]
  assign _T_192 = _T_146 ? 1'h0 : _T_191; // @[Lookup.scala 11:37:@234.4]
  assign _T_193 = _T_142 ? 1'h0 : _T_192; // @[Lookup.scala 11:37:@235.4]
  assign _T_194 = _T_138 ? 1'h0 : _T_193; // @[Lookup.scala 11:37:@236.4]
  assign _T_195 = _T_134 ? 1'h0 : _T_194; // @[Lookup.scala 11:37:@237.4]
  assign _T_196 = _T_130 ? 1'h0 : _T_195; // @[Lookup.scala 11:37:@238.4]
  assign _T_197 = _T_126 ? 1'h1 : _T_196; // @[Lookup.scala 11:37:@239.4]
  assign _T_198 = _T_122 ? 1'h1 : _T_197; // @[Lookup.scala 11:37:@240.4]
  assign _T_199 = _T_118 ? 1'h1 : _T_198; // @[Lookup.scala 11:37:@241.4]
  assign _T_200 = _T_114 ? 1'h1 : _T_199; // @[Lookup.scala 11:37:@242.4]
  assign _T_201 = _T_110 ? 1'h1 : _T_200; // @[Lookup.scala 11:37:@243.4]
  assign _T_202 = _T_106 ? 1'h1 : _T_201; // @[Lookup.scala 11:37:@244.4]
  assign _T_203 = _T_102 ? 1'h1 : _T_202; // @[Lookup.scala 11:37:@245.4]
  assign _T_204 = _T_98 ? 1'h1 : _T_203; // @[Lookup.scala 11:37:@246.4]
  assign _T_205 = _T_94 ? 1'h1 : _T_204; // @[Lookup.scala 11:37:@247.4]
  assign _T_206 = _T_90 ? 1'h1 : _T_205; // @[Lookup.scala 11:37:@248.4]
  assign _T_207 = _T_86 ? 1'h1 : _T_206; // @[Lookup.scala 11:37:@249.4]
  assign _T_208 = _T_82 ? 1'h1 : _T_207; // @[Lookup.scala 11:37:@250.4]
  assign _T_209 = _T_78 ? 1'h1 : _T_208; // @[Lookup.scala 11:37:@251.4]
  assign _T_210 = _T_74 ? 1'h1 : _T_209; // @[Lookup.scala 11:37:@252.4]
  assign _T_211 = _T_70 ? 1'h1 : _T_210; // @[Lookup.scala 11:37:@253.4]
  assign _T_212 = _T_66 ? 1'h1 : _T_211; // @[Lookup.scala 11:37:@254.4]
  assign _T_213 = _T_62 ? 1'h1 : _T_212; // @[Lookup.scala 11:37:@255.4]
  assign _T_214 = _T_58 ? 1'h1 : _T_213; // @[Lookup.scala 11:37:@256.4]
  assign _T_215 = _T_54 ? 1'h1 : _T_214; // @[Lookup.scala 11:37:@257.4]
  assign _T_216 = _T_50 ? 1'h1 : _T_215; // @[Lookup.scala 11:37:@258.4]
  assign _T_217 = _T_46 ? 1'h1 : _T_216; // @[Lookup.scala 11:37:@259.4]
  assign _T_218 = _T_42 ? 1'h1 : _T_217; // @[Lookup.scala 11:37:@260.4]
  assign _T_219 = _T_38 ? 1'h1 : _T_218; // @[Lookup.scala 11:37:@261.4]
  assign _T_221 = _T_178 ? 3'h5 : 3'h0; // @[Lookup.scala 11:37:@264.4]
  assign _T_222 = _T_174 ? 3'h5 : _T_221; // @[Lookup.scala 11:37:@265.4]
  assign _T_223 = _T_170 ? 3'h2 : _T_222; // @[Lookup.scala 11:37:@266.4]
  assign _T_224 = _T_166 ? 3'h6 : _T_223; // @[Lookup.scala 11:37:@267.4]
  assign _T_225 = _T_162 ? 3'h4 : _T_224; // @[Lookup.scala 11:37:@268.4]
  assign _T_226 = _T_158 ? 3'h4 : _T_225; // @[Lookup.scala 11:37:@269.4]
  assign _T_227 = _T_154 ? 3'h4 : _T_226; // @[Lookup.scala 11:37:@270.4]
  assign _T_228 = _T_150 ? 3'h4 : _T_227; // @[Lookup.scala 11:37:@271.4]
  assign _T_229 = _T_146 ? 3'h4 : _T_228; // @[Lookup.scala 11:37:@272.4]
  assign _T_230 = _T_142 ? 3'h4 : _T_229; // @[Lookup.scala 11:37:@273.4]
  assign _T_231 = _T_138 ? 3'h3 : _T_230; // @[Lookup.scala 11:37:@274.4]
  assign _T_232 = _T_134 ? 3'h3 : _T_231; // @[Lookup.scala 11:37:@275.4]
  assign _T_233 = _T_130 ? 3'h3 : _T_232; // @[Lookup.scala 11:37:@276.4]
  assign _T_234 = _T_126 ? 3'h2 : _T_233; // @[Lookup.scala 11:37:@277.4]
  assign _T_235 = _T_122 ? 3'h2 : _T_234; // @[Lookup.scala 11:37:@278.4]
  assign _T_236 = _T_118 ? 3'h2 : _T_235; // @[Lookup.scala 11:37:@279.4]
  assign _T_237 = _T_114 ? 3'h2 : _T_236; // @[Lookup.scala 11:37:@280.4]
  assign _T_238 = _T_110 ? 3'h2 : _T_237; // @[Lookup.scala 11:37:@281.4]
  assign _T_239 = _T_106 ? 3'h2 : _T_238; // @[Lookup.scala 11:37:@282.4]
  assign _T_240 = _T_102 ? 3'h2 : _T_239; // @[Lookup.scala 11:37:@283.4]
  assign _T_241 = _T_98 ? 3'h1 : _T_240; // @[Lookup.scala 11:37:@284.4]
  assign _T_242 = _T_94 ? 3'h1 : _T_241; // @[Lookup.scala 11:37:@285.4]
  assign _T_243 = _T_90 ? 3'h2 : _T_242; // @[Lookup.scala 11:37:@286.4]
  assign _T_244 = _T_86 ? 3'h2 : _T_243; // @[Lookup.scala 11:37:@287.4]
  assign _T_245 = _T_82 ? 3'h2 : _T_244; // @[Lookup.scala 11:37:@288.4]
  assign _T_246 = _T_78 ? 3'h1 : _T_245; // @[Lookup.scala 11:37:@289.4]
  assign _T_247 = _T_74 ? 3'h1 : _T_246; // @[Lookup.scala 11:37:@290.4]
  assign _T_248 = _T_70 ? 3'h1 : _T_247; // @[Lookup.scala 11:37:@291.4]
  assign _T_249 = _T_66 ? 3'h2 : _T_248; // @[Lookup.scala 11:37:@292.4]
  assign _T_250 = _T_62 ? 3'h2 : _T_249; // @[Lookup.scala 11:37:@293.4]
  assign _T_251 = _T_58 ? 3'h2 : _T_250; // @[Lookup.scala 11:37:@294.4]
  assign _T_252 = _T_54 ? 3'h2 : _T_251; // @[Lookup.scala 11:37:@295.4]
  assign _T_253 = _T_50 ? 3'h1 : _T_252; // @[Lookup.scala 11:37:@296.4]
  assign _T_254 = _T_46 ? 3'h1 : _T_253; // @[Lookup.scala 11:37:@297.4]
  assign _T_255 = _T_42 ? 3'h1 : _T_254; // @[Lookup.scala 11:37:@298.4]
  assign _T_256 = _T_38 ? 3'h1 : _T_255; // @[Lookup.scala 11:37:@299.4]
  assign _T_269 = _T_134 ? 1'h1 : _T_138; // @[Lookup.scala 11:37:@313.4]
  assign _T_270 = _T_130 ? 1'h1 : _T_269; // @[Lookup.scala 11:37:@314.4]
  assign _T_271 = _T_126 ? 1'h1 : _T_270; // @[Lookup.scala 11:37:@315.4]
  assign _T_272 = _T_122 ? 1'h1 : _T_271; // @[Lookup.scala 11:37:@316.4]
  assign _T_273 = _T_118 ? 1'h1 : _T_272; // @[Lookup.scala 11:37:@317.4]
  assign _T_274 = _T_114 ? 1'h1 : _T_273; // @[Lookup.scala 11:37:@318.4]
  assign _T_275 = _T_110 ? 1'h1 : _T_274; // @[Lookup.scala 11:37:@319.4]
  assign _T_276 = _T_106 ? 1'h1 : _T_275; // @[Lookup.scala 11:37:@320.4]
  assign _T_277 = _T_102 ? 1'h1 : _T_276; // @[Lookup.scala 11:37:@321.4]
  assign _T_278 = _T_98 ? 1'h0 : _T_277; // @[Lookup.scala 11:37:@322.4]
  assign _T_279 = _T_94 ? 1'h0 : _T_278; // @[Lookup.scala 11:37:@323.4]
  assign _T_280 = _T_90 ? 1'h1 : _T_279; // @[Lookup.scala 11:37:@324.4]
  assign _T_281 = _T_86 ? 1'h1 : _T_280; // @[Lookup.scala 11:37:@325.4]
  assign _T_282 = _T_82 ? 1'h1 : _T_281; // @[Lookup.scala 11:37:@326.4]
  assign _T_283 = _T_78 ? 1'h0 : _T_282; // @[Lookup.scala 11:37:@327.4]
  assign _T_284 = _T_74 ? 1'h0 : _T_283; // @[Lookup.scala 11:37:@328.4]
  assign _T_285 = _T_70 ? 1'h0 : _T_284; // @[Lookup.scala 11:37:@329.4]
  assign _T_286 = _T_66 ? 1'h1 : _T_285; // @[Lookup.scala 11:37:@330.4]
  assign _T_287 = _T_62 ? 1'h1 : _T_286; // @[Lookup.scala 11:37:@331.4]
  assign _T_288 = _T_58 ? 1'h1 : _T_287; // @[Lookup.scala 11:37:@332.4]
  assign _T_289 = _T_54 ? 1'h1 : _T_288; // @[Lookup.scala 11:37:@333.4]
  assign _T_290 = _T_50 ? 1'h0 : _T_289; // @[Lookup.scala 11:37:@334.4]
  assign _T_291 = _T_46 ? 1'h0 : _T_290; // @[Lookup.scala 11:37:@335.4]
  assign _T_292 = _T_42 ? 1'h0 : _T_291; // @[Lookup.scala 11:37:@336.4]
  assign _T_293 = _T_38 ? 1'h0 : _T_292; // @[Lookup.scala 11:37:@337.4]
  assign _T_295 = _T_178 ? 5'h0 : 5'h10; // @[Lookup.scala 11:37:@340.4]
  assign _T_296 = _T_174 ? 5'h0 : _T_295; // @[Lookup.scala 11:37:@341.4]
  assign _T_297 = _T_170 ? 5'h0 : _T_296; // @[Lookup.scala 11:37:@342.4]
  assign _T_298 = _T_166 ? 5'h0 : _T_297; // @[Lookup.scala 11:37:@343.4]
  assign _T_299 = _T_162 ? 5'hf : _T_298; // @[Lookup.scala 11:37:@344.4]
  assign _T_300 = _T_158 ? 5'he : _T_299; // @[Lookup.scala 11:37:@345.4]
  assign _T_301 = _T_154 ? 5'hd : _T_300; // @[Lookup.scala 11:37:@346.4]
  assign _T_302 = _T_150 ? 5'hc : _T_301; // @[Lookup.scala 11:37:@347.4]
  assign _T_303 = _T_146 ? 5'hb : _T_302; // @[Lookup.scala 11:37:@348.4]
  assign _T_304 = _T_142 ? 5'ha : _T_303; // @[Lookup.scala 11:37:@349.4]
  assign _T_305 = _T_138 ? 5'h0 : _T_304; // @[Lookup.scala 11:37:@350.4]
  assign _T_306 = _T_134 ? 5'h0 : _T_305; // @[Lookup.scala 11:37:@351.4]
  assign _T_307 = _T_130 ? 5'h0 : _T_306; // @[Lookup.scala 11:37:@352.4]
  assign _T_308 = _T_126 ? 5'h0 : _T_307; // @[Lookup.scala 11:37:@353.4]
  assign _T_309 = _T_122 ? 5'h0 : _T_308; // @[Lookup.scala 11:37:@354.4]
  assign _T_310 = _T_118 ? 5'h0 : _T_309; // @[Lookup.scala 11:37:@355.4]
  assign _T_311 = _T_114 ? 5'h0 : _T_310; // @[Lookup.scala 11:37:@356.4]
  assign _T_312 = _T_110 ? 5'h0 : _T_311; // @[Lookup.scala 11:37:@357.4]
  assign _T_313 = _T_106 ? 5'h9 : _T_312; // @[Lookup.scala 11:37:@358.4]
  assign _T_314 = _T_102 ? 5'h8 : _T_313; // @[Lookup.scala 11:37:@359.4]
  assign _T_315 = _T_98 ? 5'h9 : _T_314; // @[Lookup.scala 11:37:@360.4]
  assign _T_316 = _T_94 ? 5'h8 : _T_315; // @[Lookup.scala 11:37:@361.4]
  assign _T_317 = _T_90 ? 5'h7 : _T_316; // @[Lookup.scala 11:37:@362.4]
  assign _T_318 = _T_86 ? 5'h6 : _T_317; // @[Lookup.scala 11:37:@363.4]
  assign _T_319 = _T_82 ? 5'h5 : _T_318; // @[Lookup.scala 11:37:@364.4]
  assign _T_320 = _T_78 ? 5'h7 : _T_319; // @[Lookup.scala 11:37:@365.4]
  assign _T_321 = _T_74 ? 5'h6 : _T_320; // @[Lookup.scala 11:37:@366.4]
  assign _T_322 = _T_70 ? 5'h5 : _T_321; // @[Lookup.scala 11:37:@367.4]
  assign _T_323 = _T_66 ? 5'h4 : _T_322; // @[Lookup.scala 11:37:@368.4]
  assign _T_324 = _T_62 ? 5'h3 : _T_323; // @[Lookup.scala 11:37:@369.4]
  assign _T_325 = _T_58 ? 5'h2 : _T_324; // @[Lookup.scala 11:37:@370.4]
  assign _T_326 = _T_54 ? 5'h0 : _T_325; // @[Lookup.scala 11:37:@371.4]
  assign _T_327 = _T_50 ? 5'h4 : _T_326; // @[Lookup.scala 11:37:@372.4]
  assign _T_328 = _T_46 ? 5'h3 : _T_327; // @[Lookup.scala 11:37:@373.4]
  assign _T_329 = _T_42 ? 5'h2 : _T_328; // @[Lookup.scala 11:37:@374.4]
  assign _T_330 = _T_38 ? 5'h1 : _T_329; // @[Lookup.scala 11:37:@375.4]
  assign _T_335 = _T_166 ? 1'h1 : _T_170; // @[Lookup.scala 11:37:@381.4]
  assign _T_336 = _T_162 ? 1'h1 : _T_335; // @[Lookup.scala 11:37:@382.4]
  assign _T_337 = _T_158 ? 1'h1 : _T_336; // @[Lookup.scala 11:37:@383.4]
  assign _T_338 = _T_154 ? 1'h1 : _T_337; // @[Lookup.scala 11:37:@384.4]
  assign _T_339 = _T_150 ? 1'h1 : _T_338; // @[Lookup.scala 11:37:@385.4]
  assign _T_340 = _T_146 ? 1'h1 : _T_339; // @[Lookup.scala 11:37:@386.4]
  assign _T_341 = _T_142 ? 1'h1 : _T_340; // @[Lookup.scala 11:37:@387.4]
  assign _T_342 = _T_138 ? 1'h0 : _T_341; // @[Lookup.scala 11:37:@388.4]
  assign _T_343 = _T_134 ? 1'h0 : _T_342; // @[Lookup.scala 11:37:@389.4]
  assign _T_344 = _T_130 ? 1'h0 : _T_343; // @[Lookup.scala 11:37:@390.4]
  assign _T_345 = _T_126 ? 1'h0 : _T_344; // @[Lookup.scala 11:37:@391.4]
  assign _T_346 = _T_122 ? 1'h0 : _T_345; // @[Lookup.scala 11:37:@392.4]
  assign _T_347 = _T_118 ? 1'h0 : _T_346; // @[Lookup.scala 11:37:@393.4]
  assign _T_348 = _T_114 ? 1'h0 : _T_347; // @[Lookup.scala 11:37:@394.4]
  assign _T_349 = _T_110 ? 1'h0 : _T_348; // @[Lookup.scala 11:37:@395.4]
  assign _T_350 = _T_106 ? 1'h0 : _T_349; // @[Lookup.scala 11:37:@396.4]
  assign _T_351 = _T_102 ? 1'h0 : _T_350; // @[Lookup.scala 11:37:@397.4]
  assign _T_352 = _T_98 ? 1'h0 : _T_351; // @[Lookup.scala 11:37:@398.4]
  assign _T_353 = _T_94 ? 1'h0 : _T_352; // @[Lookup.scala 11:37:@399.4]
  assign _T_354 = _T_90 ? 1'h0 : _T_353; // @[Lookup.scala 11:37:@400.4]
  assign _T_355 = _T_86 ? 1'h0 : _T_354; // @[Lookup.scala 11:37:@401.4]
  assign _T_356 = _T_82 ? 1'h0 : _T_355; // @[Lookup.scala 11:37:@402.4]
  assign _T_357 = _T_78 ? 1'h0 : _T_356; // @[Lookup.scala 11:37:@403.4]
  assign _T_358 = _T_74 ? 1'h0 : _T_357; // @[Lookup.scala 11:37:@404.4]
  assign _T_359 = _T_70 ? 1'h0 : _T_358; // @[Lookup.scala 11:37:@405.4]
  assign _T_360 = _T_66 ? 1'h0 : _T_359; // @[Lookup.scala 11:37:@406.4]
  assign _T_361 = _T_62 ? 1'h0 : _T_360; // @[Lookup.scala 11:37:@407.4]
  assign _T_362 = _T_58 ? 1'h0 : _T_361; // @[Lookup.scala 11:37:@408.4]
  assign _T_363 = _T_54 ? 1'h0 : _T_362; // @[Lookup.scala 11:37:@409.4]
  assign _T_364 = _T_50 ? 1'h0 : _T_363; // @[Lookup.scala 11:37:@410.4]
  assign _T_365 = _T_46 ? 1'h0 : _T_364; // @[Lookup.scala 11:37:@411.4]
  assign _T_366 = _T_42 ? 1'h0 : _T_365; // @[Lookup.scala 11:37:@412.4]
  assign _T_367 = _T_38 ? 1'h0 : _T_366; // @[Lookup.scala 11:37:@413.4]
  assign _T_372 = _T_166 ? 1'h0 : _T_170; // @[Lookup.scala 11:37:@419.4]
  assign _T_373 = _T_162 ? 1'h0 : _T_372; // @[Lookup.scala 11:37:@420.4]
  assign _T_374 = _T_158 ? 1'h0 : _T_373; // @[Lookup.scala 11:37:@421.4]
  assign _T_375 = _T_154 ? 1'h0 : _T_374; // @[Lookup.scala 11:37:@422.4]
  assign _T_376 = _T_150 ? 1'h0 : _T_375; // @[Lookup.scala 11:37:@423.4]
  assign _T_377 = _T_146 ? 1'h0 : _T_376; // @[Lookup.scala 11:37:@424.4]
  assign _T_378 = _T_142 ? 1'h0 : _T_377; // @[Lookup.scala 11:37:@425.4]
  assign _T_379 = _T_138 ? 1'h0 : _T_378; // @[Lookup.scala 11:37:@426.4]
  assign _T_380 = _T_134 ? 1'h0 : _T_379; // @[Lookup.scala 11:37:@427.4]
  assign _T_381 = _T_130 ? 1'h0 : _T_380; // @[Lookup.scala 11:37:@428.4]
  assign _T_382 = _T_126 ? 1'h0 : _T_381; // @[Lookup.scala 11:37:@429.4]
  assign _T_383 = _T_122 ? 1'h0 : _T_382; // @[Lookup.scala 11:37:@430.4]
  assign _T_384 = _T_118 ? 1'h0 : _T_383; // @[Lookup.scala 11:37:@431.4]
  assign _T_385 = _T_114 ? 1'h0 : _T_384; // @[Lookup.scala 11:37:@432.4]
  assign _T_386 = _T_110 ? 1'h0 : _T_385; // @[Lookup.scala 11:37:@433.4]
  assign _T_387 = _T_106 ? 1'h0 : _T_386; // @[Lookup.scala 11:37:@434.4]
  assign _T_388 = _T_102 ? 1'h0 : _T_387; // @[Lookup.scala 11:37:@435.4]
  assign _T_389 = _T_98 ? 1'h0 : _T_388; // @[Lookup.scala 11:37:@436.4]
  assign _T_390 = _T_94 ? 1'h0 : _T_389; // @[Lookup.scala 11:37:@437.4]
  assign _T_391 = _T_90 ? 1'h0 : _T_390; // @[Lookup.scala 11:37:@438.4]
  assign _T_392 = _T_86 ? 1'h0 : _T_391; // @[Lookup.scala 11:37:@439.4]
  assign _T_393 = _T_82 ? 1'h0 : _T_392; // @[Lookup.scala 11:37:@440.4]
  assign _T_394 = _T_78 ? 1'h0 : _T_393; // @[Lookup.scala 11:37:@441.4]
  assign _T_395 = _T_74 ? 1'h0 : _T_394; // @[Lookup.scala 11:37:@442.4]
  assign _T_396 = _T_70 ? 1'h0 : _T_395; // @[Lookup.scala 11:37:@443.4]
  assign _T_397 = _T_66 ? 1'h0 : _T_396; // @[Lookup.scala 11:37:@444.4]
  assign _T_398 = _T_62 ? 1'h0 : _T_397; // @[Lookup.scala 11:37:@445.4]
  assign _T_399 = _T_58 ? 1'h0 : _T_398; // @[Lookup.scala 11:37:@446.4]
  assign _T_400 = _T_54 ? 1'h0 : _T_399; // @[Lookup.scala 11:37:@447.4]
  assign _T_401 = _T_50 ? 1'h0 : _T_400; // @[Lookup.scala 11:37:@448.4]
  assign _T_402 = _T_46 ? 1'h0 : _T_401; // @[Lookup.scala 11:37:@449.4]
  assign _T_403 = _T_42 ? 1'h0 : _T_402; // @[Lookup.scala 11:37:@450.4]
  assign _T_404 = _T_38 ? 1'h0 : _T_403; // @[Lookup.scala 11:37:@451.4]
  assign _T_420 = _T_122 ? 1'h1 : _T_126; // @[Lookup.scala 11:37:@468.4]
  assign _T_421 = _T_118 ? 1'h1 : _T_420; // @[Lookup.scala 11:37:@469.4]
  assign _T_422 = _T_114 ? 1'h1 : _T_421; // @[Lookup.scala 11:37:@470.4]
  assign _T_423 = _T_110 ? 1'h1 : _T_422; // @[Lookup.scala 11:37:@471.4]
  assign _T_424 = _T_106 ? 1'h0 : _T_423; // @[Lookup.scala 11:37:@472.4]
  assign _T_425 = _T_102 ? 1'h0 : _T_424; // @[Lookup.scala 11:37:@473.4]
  assign _T_426 = _T_98 ? 1'h0 : _T_425; // @[Lookup.scala 11:37:@474.4]
  assign _T_427 = _T_94 ? 1'h0 : _T_426; // @[Lookup.scala 11:37:@475.4]
  assign _T_428 = _T_90 ? 1'h0 : _T_427; // @[Lookup.scala 11:37:@476.4]
  assign _T_429 = _T_86 ? 1'h0 : _T_428; // @[Lookup.scala 11:37:@477.4]
  assign _T_430 = _T_82 ? 1'h0 : _T_429; // @[Lookup.scala 11:37:@478.4]
  assign _T_431 = _T_78 ? 1'h0 : _T_430; // @[Lookup.scala 11:37:@479.4]
  assign _T_432 = _T_74 ? 1'h0 : _T_431; // @[Lookup.scala 11:37:@480.4]
  assign _T_433 = _T_70 ? 1'h0 : _T_432; // @[Lookup.scala 11:37:@481.4]
  assign _T_434 = _T_66 ? 1'h0 : _T_433; // @[Lookup.scala 11:37:@482.4]
  assign _T_435 = _T_62 ? 1'h0 : _T_434; // @[Lookup.scala 11:37:@483.4]
  assign _T_436 = _T_58 ? 1'h0 : _T_435; // @[Lookup.scala 11:37:@484.4]
  assign _T_437 = _T_54 ? 1'h0 : _T_436; // @[Lookup.scala 11:37:@485.4]
  assign _T_438 = _T_50 ? 1'h0 : _T_437; // @[Lookup.scala 11:37:@486.4]
  assign _T_439 = _T_46 ? 1'h0 : _T_438; // @[Lookup.scala 11:37:@487.4]
  assign _T_440 = _T_42 ? 1'h0 : _T_439; // @[Lookup.scala 11:37:@488.4]
  assign _T_441 = _T_38 ? 1'h0 : _T_440; // @[Lookup.scala 11:37:@489.4]
  assign _T_456 = _T_126 ? 1'h0 : _T_270; // @[Lookup.scala 11:37:@505.4]
  assign _T_457 = _T_122 ? 1'h0 : _T_456; // @[Lookup.scala 11:37:@506.4]
  assign _T_458 = _T_118 ? 1'h0 : _T_457; // @[Lookup.scala 11:37:@507.4]
  assign _T_459 = _T_114 ? 1'h0 : _T_458; // @[Lookup.scala 11:37:@508.4]
  assign _T_460 = _T_110 ? 1'h0 : _T_459; // @[Lookup.scala 11:37:@509.4]
  assign _T_461 = _T_106 ? 1'h0 : _T_460; // @[Lookup.scala 11:37:@510.4]
  assign _T_462 = _T_102 ? 1'h0 : _T_461; // @[Lookup.scala 11:37:@511.4]
  assign _T_463 = _T_98 ? 1'h0 : _T_462; // @[Lookup.scala 11:37:@512.4]
  assign _T_464 = _T_94 ? 1'h0 : _T_463; // @[Lookup.scala 11:37:@513.4]
  assign _T_465 = _T_90 ? 1'h0 : _T_464; // @[Lookup.scala 11:37:@514.4]
  assign _T_466 = _T_86 ? 1'h0 : _T_465; // @[Lookup.scala 11:37:@515.4]
  assign _T_467 = _T_82 ? 1'h0 : _T_466; // @[Lookup.scala 11:37:@516.4]
  assign _T_468 = _T_78 ? 1'h0 : _T_467; // @[Lookup.scala 11:37:@517.4]
  assign _T_469 = _T_74 ? 1'h0 : _T_468; // @[Lookup.scala 11:37:@518.4]
  assign _T_470 = _T_70 ? 1'h0 : _T_469; // @[Lookup.scala 11:37:@519.4]
  assign _T_471 = _T_66 ? 1'h0 : _T_470; // @[Lookup.scala 11:37:@520.4]
  assign _T_472 = _T_62 ? 1'h0 : _T_471; // @[Lookup.scala 11:37:@521.4]
  assign _T_473 = _T_58 ? 1'h0 : _T_472; // @[Lookup.scala 11:37:@522.4]
  assign _T_474 = _T_54 ? 1'h0 : _T_473; // @[Lookup.scala 11:37:@523.4]
  assign _T_475 = _T_50 ? 1'h0 : _T_474; // @[Lookup.scala 11:37:@524.4]
  assign _T_476 = _T_46 ? 1'h0 : _T_475; // @[Lookup.scala 11:37:@525.4]
  assign _T_477 = _T_42 ? 1'h0 : _T_476; // @[Lookup.scala 11:37:@526.4]
  assign _T_478 = _T_38 ? 1'h0 : _T_477; // @[Lookup.scala 11:37:@527.4]
  assign _T_490 = _T_138 ? 2'h2 : 2'h0; // @[Lookup.scala 11:37:@540.4]
  assign _T_491 = _T_134 ? 2'h1 : _T_490; // @[Lookup.scala 11:37:@541.4]
  assign _T_492 = _T_130 ? 2'h0 : _T_491; // @[Lookup.scala 11:37:@542.4]
  assign _T_493 = _T_126 ? 2'h2 : _T_492; // @[Lookup.scala 11:37:@543.4]
  assign _T_494 = _T_122 ? 2'h1 : _T_493; // @[Lookup.scala 11:37:@544.4]
  assign _T_495 = _T_118 ? 2'h2 : _T_494; // @[Lookup.scala 11:37:@545.4]
  assign _T_496 = _T_114 ? 2'h1 : _T_495; // @[Lookup.scala 11:37:@546.4]
  assign _T_497 = _T_110 ? 2'h0 : _T_496; // @[Lookup.scala 11:37:@547.4]
  assign _T_498 = _T_106 ? 2'h0 : _T_497; // @[Lookup.scala 11:37:@548.4]
  assign _T_499 = _T_102 ? 2'h0 : _T_498; // @[Lookup.scala 11:37:@549.4]
  assign _T_500 = _T_98 ? 2'h0 : _T_499; // @[Lookup.scala 11:37:@550.4]
  assign _T_501 = _T_94 ? 2'h0 : _T_500; // @[Lookup.scala 11:37:@551.4]
  assign _T_502 = _T_90 ? 2'h0 : _T_501; // @[Lookup.scala 11:37:@552.4]
  assign _T_503 = _T_86 ? 2'h0 : _T_502; // @[Lookup.scala 11:37:@553.4]
  assign _T_504 = _T_82 ? 2'h0 : _T_503; // @[Lookup.scala 11:37:@554.4]
  assign _T_505 = _T_78 ? 2'h0 : _T_504; // @[Lookup.scala 11:37:@555.4]
  assign _T_506 = _T_74 ? 2'h0 : _T_505; // @[Lookup.scala 11:37:@556.4]
  assign _T_507 = _T_70 ? 2'h0 : _T_506; // @[Lookup.scala 11:37:@557.4]
  assign _T_508 = _T_66 ? 2'h0 : _T_507; // @[Lookup.scala 11:37:@558.4]
  assign _T_509 = _T_62 ? 2'h0 : _T_508; // @[Lookup.scala 11:37:@559.4]
  assign _T_510 = _T_58 ? 2'h0 : _T_509; // @[Lookup.scala 11:37:@560.4]
  assign _T_511 = _T_54 ? 2'h0 : _T_510; // @[Lookup.scala 11:37:@561.4]
  assign _T_512 = _T_50 ? 2'h0 : _T_511; // @[Lookup.scala 11:37:@562.4]
  assign _T_513 = _T_46 ? 2'h0 : _T_512; // @[Lookup.scala 11:37:@563.4]
  assign _T_514 = _T_42 ? 2'h0 : _T_513; // @[Lookup.scala 11:37:@564.4]
  assign _T_515 = _T_38 ? 2'h0 : _T_514; // @[Lookup.scala 11:37:@565.4]
  assign _T_532 = _T_118 ? 1'h0 : _T_420; // @[Lookup.scala 11:37:@583.4]
  assign _T_533 = _T_114 ? 1'h0 : _T_532; // @[Lookup.scala 11:37:@584.4]
  assign _T_534 = _T_110 ? 1'h0 : _T_533; // @[Lookup.scala 11:37:@585.4]
  assign _T_535 = _T_106 ? 1'h0 : _T_534; // @[Lookup.scala 11:37:@586.4]
  assign _T_536 = _T_102 ? 1'h0 : _T_535; // @[Lookup.scala 11:37:@587.4]
  assign _T_537 = _T_98 ? 1'h0 : _T_536; // @[Lookup.scala 11:37:@588.4]
  assign _T_538 = _T_94 ? 1'h0 : _T_537; // @[Lookup.scala 11:37:@589.4]
  assign _T_539 = _T_90 ? 1'h0 : _T_538; // @[Lookup.scala 11:37:@590.4]
  assign _T_540 = _T_86 ? 1'h0 : _T_539; // @[Lookup.scala 11:37:@591.4]
  assign _T_541 = _T_82 ? 1'h0 : _T_540; // @[Lookup.scala 11:37:@592.4]
  assign _T_542 = _T_78 ? 1'h0 : _T_541; // @[Lookup.scala 11:37:@593.4]
  assign _T_543 = _T_74 ? 1'h0 : _T_542; // @[Lookup.scala 11:37:@594.4]
  assign _T_544 = _T_70 ? 1'h0 : _T_543; // @[Lookup.scala 11:37:@595.4]
  assign _T_545 = _T_66 ? 1'h0 : _T_544; // @[Lookup.scala 11:37:@596.4]
  assign _T_546 = _T_62 ? 1'h0 : _T_545; // @[Lookup.scala 11:37:@597.4]
  assign _T_547 = _T_58 ? 1'h0 : _T_546; // @[Lookup.scala 11:37:@598.4]
  assign _T_548 = _T_54 ? 1'h0 : _T_547; // @[Lookup.scala 11:37:@599.4]
  assign _T_549 = _T_50 ? 1'h0 : _T_548; // @[Lookup.scala 11:37:@600.4]
  assign _T_550 = _T_46 ? 1'h0 : _T_549; // @[Lookup.scala 11:37:@601.4]
  assign _T_551 = _T_42 ? 1'h0 : _T_550; // @[Lookup.scala 11:37:@602.4]
  assign _T_552 = _T_38 ? 1'h0 : _T_551; // @[Lookup.scala 11:37:@603.4]
  assign _T_554 = _T_178 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37:@606.4]
  assign _T_555 = _T_174 ? 3'h3 : _T_554; // @[Lookup.scala 11:37:@607.4]
  assign _T_556 = _T_170 ? 3'h2 : _T_555; // @[Lookup.scala 11:37:@608.4]
  assign _T_557 = _T_166 ? 3'h2 : _T_556; // @[Lookup.scala 11:37:@609.4]
  assign _T_558 = _T_162 ? 3'h0 : _T_557; // @[Lookup.scala 11:37:@610.4]
  assign _T_559 = _T_158 ? 3'h0 : _T_558; // @[Lookup.scala 11:37:@611.4]
  assign _T_560 = _T_154 ? 3'h0 : _T_559; // @[Lookup.scala 11:37:@612.4]
  assign _T_561 = _T_150 ? 3'h0 : _T_560; // @[Lookup.scala 11:37:@613.4]
  assign _T_562 = _T_146 ? 3'h0 : _T_561; // @[Lookup.scala 11:37:@614.4]
  assign _T_563 = _T_142 ? 3'h0 : _T_562; // @[Lookup.scala 11:37:@615.4]
  assign _T_564 = _T_138 ? 3'h0 : _T_563; // @[Lookup.scala 11:37:@616.4]
  assign _T_565 = _T_134 ? 3'h0 : _T_564; // @[Lookup.scala 11:37:@617.4]
  assign _T_566 = _T_130 ? 3'h0 : _T_565; // @[Lookup.scala 11:37:@618.4]
  assign _T_567 = _T_126 ? 3'h1 : _T_566; // @[Lookup.scala 11:37:@619.4]
  assign _T_568 = _T_122 ? 3'h1 : _T_567; // @[Lookup.scala 11:37:@620.4]
  assign _T_569 = _T_118 ? 3'h1 : _T_568; // @[Lookup.scala 11:37:@621.4]
  assign _T_570 = _T_114 ? 3'h1 : _T_569; // @[Lookup.scala 11:37:@622.4]
  assign _T_571 = _T_110 ? 3'h1 : _T_570; // @[Lookup.scala 11:37:@623.4]
  assign _T_572 = _T_106 ? 3'h0 : _T_571; // @[Lookup.scala 11:37:@624.4]
  assign _T_573 = _T_102 ? 3'h0 : _T_572; // @[Lookup.scala 11:37:@625.4]
  assign _T_574 = _T_98 ? 3'h0 : _T_573; // @[Lookup.scala 11:37:@626.4]
  assign _T_575 = _T_94 ? 3'h0 : _T_574; // @[Lookup.scala 11:37:@627.4]
  assign _T_576 = _T_90 ? 3'h0 : _T_575; // @[Lookup.scala 11:37:@628.4]
  assign _T_577 = _T_86 ? 3'h0 : _T_576; // @[Lookup.scala 11:37:@629.4]
  assign _T_578 = _T_82 ? 3'h0 : _T_577; // @[Lookup.scala 11:37:@630.4]
  assign _T_579 = _T_78 ? 3'h0 : _T_578; // @[Lookup.scala 11:37:@631.4]
  assign _T_580 = _T_74 ? 3'h0 : _T_579; // @[Lookup.scala 11:37:@632.4]
  assign _T_581 = _T_70 ? 3'h0 : _T_580; // @[Lookup.scala 11:37:@633.4]
  assign _T_582 = _T_66 ? 3'h0 : _T_581; // @[Lookup.scala 11:37:@634.4]
  assign _T_583 = _T_62 ? 3'h0 : _T_582; // @[Lookup.scala 11:37:@635.4]
  assign _T_584 = _T_58 ? 3'h0 : _T_583; // @[Lookup.scala 11:37:@636.4]
  assign _T_585 = _T_54 ? 3'h0 : _T_584; // @[Lookup.scala 11:37:@637.4]
  assign _T_586 = _T_50 ? 3'h0 : _T_585; // @[Lookup.scala 11:37:@638.4]
  assign _T_587 = _T_46 ? 3'h0 : _T_586; // @[Lookup.scala 11:37:@639.4]
  assign _T_588 = _T_42 ? 3'h0 : _T_587; // @[Lookup.scala 11:37:@640.4]
  assign _T_589 = _T_38 ? 3'h0 : _T_588; // @[Lookup.scala 11:37:@641.4]
  assign _T_595 = _T_162 ? 1'h0 : _T_335; // @[Lookup.scala 11:37:@648.4]
  assign _T_596 = _T_158 ? 1'h0 : _T_595; // @[Lookup.scala 11:37:@649.4]
  assign _T_597 = _T_154 ? 1'h0 : _T_596; // @[Lookup.scala 11:37:@650.4]
  assign _T_598 = _T_150 ? 1'h0 : _T_597; // @[Lookup.scala 11:37:@651.4]
  assign _T_599 = _T_146 ? 1'h0 : _T_598; // @[Lookup.scala 11:37:@652.4]
  assign _T_600 = _T_142 ? 1'h0 : _T_599; // @[Lookup.scala 11:37:@653.4]
  assign _T_601 = _T_138 ? 1'h0 : _T_600; // @[Lookup.scala 11:37:@654.4]
  assign _T_602 = _T_134 ? 1'h0 : _T_601; // @[Lookup.scala 11:37:@655.4]
  assign _T_603 = _T_130 ? 1'h0 : _T_602; // @[Lookup.scala 11:37:@656.4]
  assign _T_604 = _T_126 ? 1'h0 : _T_603; // @[Lookup.scala 11:37:@657.4]
  assign _T_605 = _T_122 ? 1'h0 : _T_604; // @[Lookup.scala 11:37:@658.4]
  assign _T_606 = _T_118 ? 1'h0 : _T_605; // @[Lookup.scala 11:37:@659.4]
  assign _T_607 = _T_114 ? 1'h0 : _T_606; // @[Lookup.scala 11:37:@660.4]
  assign _T_608 = _T_110 ? 1'h0 : _T_607; // @[Lookup.scala 11:37:@661.4]
  assign _T_609 = _T_106 ? 1'h0 : _T_608; // @[Lookup.scala 11:37:@662.4]
  assign _T_610 = _T_102 ? 1'h0 : _T_609; // @[Lookup.scala 11:37:@663.4]
  assign _T_611 = _T_98 ? 1'h0 : _T_610; // @[Lookup.scala 11:37:@664.4]
  assign _T_612 = _T_94 ? 1'h0 : _T_611; // @[Lookup.scala 11:37:@665.4]
  assign _T_613 = _T_90 ? 1'h0 : _T_612; // @[Lookup.scala 11:37:@666.4]
  assign _T_614 = _T_86 ? 1'h0 : _T_613; // @[Lookup.scala 11:37:@667.4]
  assign _T_615 = _T_82 ? 1'h0 : _T_614; // @[Lookup.scala 11:37:@668.4]
  assign _T_616 = _T_78 ? 1'h0 : _T_615; // @[Lookup.scala 11:37:@669.4]
  assign _T_617 = _T_74 ? 1'h0 : _T_616; // @[Lookup.scala 11:37:@670.4]
  assign _T_618 = _T_70 ? 1'h0 : _T_617; // @[Lookup.scala 11:37:@671.4]
  assign _T_619 = _T_66 ? 1'h0 : _T_618; // @[Lookup.scala 11:37:@672.4]
  assign _T_620 = _T_62 ? 1'h0 : _T_619; // @[Lookup.scala 11:37:@673.4]
  assign _T_621 = _T_58 ? 1'h0 : _T_620; // @[Lookup.scala 11:37:@674.4]
  assign _T_622 = _T_54 ? 1'h0 : _T_621; // @[Lookup.scala 11:37:@675.4]
  assign _T_623 = _T_50 ? 1'h0 : _T_622; // @[Lookup.scala 11:37:@676.4]
  assign _T_624 = _T_46 ? 1'h0 : _T_623; // @[Lookup.scala 11:37:@677.4]
  assign _T_625 = _T_42 ? 1'h0 : _T_624; // @[Lookup.scala 11:37:@678.4]
  assign _T_626 = _T_38 ? 1'h0 : _T_625; // @[Lookup.scala 11:37:@679.4]
  assign io_Reg_Write = _T_34 ? 1'h1 : _T_219; // @[Control.scala 174:17:@691.4]
  assign io_Imm_Sel = _T_34 ? 3'h1 : _T_256; // @[Control.scala 158:17:@681.4]
  assign io_ALU_Src = _T_34 ? 1'h0 : _T_293; // @[Control.scala 161:17:@682.4]
  assign io_ALUOp = _T_34 ? 5'h0 : _T_330; // @[Control.scala 162:17:@683.4]
  assign io_Branch = _T_34 ? 1'h0 : _T_367; // @[Control.scala 163:17:@684.4]
  assign io_Branch_Src = _T_34 ? 1'h0 : _T_404; // @[Control.scala 164:17:@685.4]
  assign io_Mem_Read = _T_34 ? 1'h0 : _T_441; // @[Control.scala 168:17:@687.4]
  assign io_Mem_Write = _T_34 ? 1'h0 : _T_478; // @[Control.scala 169:17:@688.4]
  assign io_Data_Size = _T_34 ? 2'h0 : _T_515; // @[Control.scala 170:17:@689.4]
  assign io_Load_Type = _T_34 ? 1'h0 : _T_552; // @[Control.scala 171:17:@690.4]
  assign io_Mem_to_Reg = _T_34 ? 3'h0 : _T_589; // @[Control.scala 175:17:@692.4]
  assign io_Jump_Type = _T_34 ? 1'h0 : _T_626; // @[Control.scala 165:17:@686.4]
endmodule
module ID_EX_Register( // @[:@694.2]
  input         clock, // @[:@695.4]
  input         reset, // @[:@696.4]
  input  [31:0] io_id_pc, // @[:@697.4]
  input  [31:0] io_id_pc_4, // @[:@697.4]
  input  [31:0] io_id_rs1_out, // @[:@697.4]
  input  [31:0] io_id_rs2_out, // @[:@697.4]
  input  [31:0] io_id_imm, // @[:@697.4]
  input  [31:0] io_id_inst, // @[:@697.4]
  input  [4:0]  io_id_rs1, // @[:@697.4]
  input  [4:0]  io_id_rs2, // @[:@697.4]
  input         io_ID_EX_Flush, // @[:@697.4]
  input         io_ALU_Src, // @[:@697.4]
  input  [4:0]  io_ALUOp, // @[:@697.4]
  input         io_Branch, // @[:@697.4]
  input         io_Branch_Src, // @[:@697.4]
  input         io_Jump_Type, // @[:@697.4]
  input         io_Mem_Read, // @[:@697.4]
  input         io_Mem_Write, // @[:@697.4]
  input  [1:0]  io_Data_Size, // @[:@697.4]
  input         io_Load_Type, // @[:@697.4]
  input         io_Reg_Write, // @[:@697.4]
  input  [2:0]  io_Mem_to_Reg, // @[:@697.4]
  output        io_ex_ALU_Src, // @[:@697.4]
  output [4:0]  io_ex_ALUOp, // @[:@697.4]
  output        io_ex_Branch, // @[:@697.4]
  output        io_ex_Branch_Src, // @[:@697.4]
  output        io_ex_Jump_Type, // @[:@697.4]
  output        io_ex_Mem_Read, // @[:@697.4]
  output        io_ex_Mem_Write, // @[:@697.4]
  output [1:0]  io_ex_Data_Size, // @[:@697.4]
  output        io_ex_Load_Type, // @[:@697.4]
  output        io_ex_Reg_Write, // @[:@697.4]
  output [2:0]  io_ex_Mem_to_Reg, // @[:@697.4]
  output [31:0] io_ex_pc, // @[:@697.4]
  output [31:0] io_ex_pc_4, // @[:@697.4]
  output [31:0] io_ex_rs1_out, // @[:@697.4]
  output [31:0] io_ex_rs2_out, // @[:@697.4]
  output [4:0]  io_ex_rd, // @[:@697.4]
  output [31:0] io_ex_imm, // @[:@697.4]
  output [4:0]  io_ex_rs1, // @[:@697.4]
  output [4:0]  io_ex_rs2 // @[:@697.4]
);
  reg [31:0] pc; // @[ID_EX_Register.scala 71:28:@699.4]
  reg [31:0] _RAND_0;
  reg [31:0] pc_4; // @[ID_EX_Register.scala 72:28:@700.4]
  reg [31:0] _RAND_1;
  reg [31:0] rs1_out; // @[ID_EX_Register.scala 73:28:@701.4]
  reg [31:0] _RAND_2;
  reg [31:0] rs2_out; // @[ID_EX_Register.scala 74:28:@702.4]
  reg [31:0] _RAND_3;
  reg [31:0] imm; // @[ID_EX_Register.scala 75:28:@703.4]
  reg [31:0] _RAND_4;
  reg [31:0] inst; // @[ID_EX_Register.scala 76:28:@704.4]
  reg [31:0] _RAND_5;
  reg [31:0] rs1; // @[ID_EX_Register.scala 77:28:@705.4]
  reg [31:0] _RAND_6;
  reg [31:0] rs2; // @[ID_EX_Register.scala 78:28:@706.4]
  reg [31:0] _RAND_7;
  reg  alu_src; // @[ID_EX_Register.scala 79:28:@707.4]
  reg [31:0] _RAND_8;
  reg [4:0] aluop; // @[ID_EX_Register.scala 80:28:@708.4]
  reg [31:0] _RAND_9;
  reg  branch; // @[ID_EX_Register.scala 81:28:@709.4]
  reg [31:0] _RAND_10;
  reg  branch_src; // @[ID_EX_Register.scala 82:28:@710.4]
  reg [31:0] _RAND_11;
  reg  jump_type; // @[ID_EX_Register.scala 83:28:@711.4]
  reg [31:0] _RAND_12;
  reg  mem_read; // @[ID_EX_Register.scala 84:28:@712.4]
  reg [31:0] _RAND_13;
  reg  mem_write; // @[ID_EX_Register.scala 85:28:@713.4]
  reg [31:0] _RAND_14;
  reg [1:0] data_size; // @[ID_EX_Register.scala 86:28:@714.4]
  reg [31:0] _RAND_15;
  reg  load_type; // @[ID_EX_Register.scala 87:28:@715.4]
  reg [31:0] _RAND_16;
  reg  reg_write; // @[ID_EX_Register.scala 88:28:@716.4]
  reg [31:0] _RAND_17;
  reg [2:0] mem_to_reg; // @[ID_EX_Register.scala 89:28:@717.4]
  reg [31:0] _RAND_18;
  wire [31:0] _T_125; // @[ID_EX_Register.scala 92:27:@719.4]
  wire [31:0] _T_128; // @[ID_EX_Register.scala 93:27:@722.4]
  wire [31:0] _T_131; // @[ID_EX_Register.scala 94:27:@725.4]
  wire [31:0] _T_134; // @[ID_EX_Register.scala 95:27:@728.4]
  wire [31:0] _T_137; // @[ID_EX_Register.scala 96:27:@731.4]
  wire [31:0] _T_140; // @[ID_EX_Register.scala 97:27:@734.4]
  wire [31:0] _T_143; // @[ID_EX_Register.scala 98:27:@737.4]
  wire [31:0] _T_146; // @[ID_EX_Register.scala 99:27:@740.4]
  wire [31:0] _T_149; // @[ID_EX_Register.scala 100:27:@743.4]
  wire [31:0] _T_152; // @[ID_EX_Register.scala 101:27:@746.4]
  wire [31:0] _T_155; // @[ID_EX_Register.scala 102:27:@749.4]
  wire [31:0] _T_158; // @[ID_EX_Register.scala 103:27:@752.4]
  wire [31:0] _T_161; // @[ID_EX_Register.scala 104:27:@755.4]
  wire [31:0] _T_164; // @[ID_EX_Register.scala 105:27:@758.4]
  wire [31:0] _T_167; // @[ID_EX_Register.scala 106:27:@761.4]
  wire [31:0] _T_170; // @[ID_EX_Register.scala 107:27:@764.4]
  wire [31:0] _T_173; // @[ID_EX_Register.scala 108:27:@767.4]
  wire [31:0] _T_176; // @[ID_EX_Register.scala 109:27:@770.4]
  wire [31:0] _T_179; // @[ID_EX_Register.scala 110:27:@773.4]
  assign _T_125 = io_ID_EX_Flush ? 32'h0 : io_id_pc; // @[ID_EX_Register.scala 92:27:@719.4]
  assign _T_128 = io_ID_EX_Flush ? 32'h0 : io_id_pc_4; // @[ID_EX_Register.scala 93:27:@722.4]
  assign _T_131 = io_ID_EX_Flush ? 32'h0 : io_id_rs1_out; // @[ID_EX_Register.scala 94:27:@725.4]
  assign _T_134 = io_ID_EX_Flush ? 32'h0 : io_id_rs2_out; // @[ID_EX_Register.scala 95:27:@728.4]
  assign _T_137 = io_ID_EX_Flush ? 32'h0 : io_id_imm; // @[ID_EX_Register.scala 96:27:@731.4]
  assign _T_140 = io_ID_EX_Flush ? 32'h0 : io_id_inst; // @[ID_EX_Register.scala 97:27:@734.4]
  assign _T_143 = io_ID_EX_Flush ? 32'h0 : {{27'd0}, io_id_rs1}; // @[ID_EX_Register.scala 98:27:@737.4]
  assign _T_146 = io_ID_EX_Flush ? 32'h0 : {{27'd0}, io_id_rs2}; // @[ID_EX_Register.scala 99:27:@740.4]
  assign _T_149 = io_ID_EX_Flush ? 32'h0 : {{31'd0}, io_ALU_Src}; // @[ID_EX_Register.scala 100:27:@743.4]
  assign _T_152 = io_ID_EX_Flush ? 32'h0 : {{27'd0}, io_ALUOp}; // @[ID_EX_Register.scala 101:27:@746.4]
  assign _T_155 = io_ID_EX_Flush ? 32'h0 : {{31'd0}, io_Branch}; // @[ID_EX_Register.scala 102:27:@749.4]
  assign _T_158 = io_ID_EX_Flush ? 32'h0 : {{31'd0}, io_Branch_Src}; // @[ID_EX_Register.scala 103:27:@752.4]
  assign _T_161 = io_ID_EX_Flush ? 32'h0 : {{31'd0}, io_Jump_Type}; // @[ID_EX_Register.scala 104:27:@755.4]
  assign _T_164 = io_ID_EX_Flush ? 32'h0 : {{31'd0}, io_Mem_Read}; // @[ID_EX_Register.scala 105:27:@758.4]
  assign _T_167 = io_ID_EX_Flush ? 32'h0 : {{31'd0}, io_Mem_Write}; // @[ID_EX_Register.scala 106:27:@761.4]
  assign _T_170 = io_ID_EX_Flush ? 32'h0 : {{30'd0}, io_Data_Size}; // @[ID_EX_Register.scala 107:27:@764.4]
  assign _T_173 = io_ID_EX_Flush ? 32'h0 : {{31'd0}, io_Load_Type}; // @[ID_EX_Register.scala 108:27:@767.4]
  assign _T_176 = io_ID_EX_Flush ? 32'h0 : {{31'd0}, io_Reg_Write}; // @[ID_EX_Register.scala 109:27:@770.4]
  assign _T_179 = io_ID_EX_Flush ? 32'h0 : {{29'd0}, io_Mem_to_Reg}; // @[ID_EX_Register.scala 110:27:@773.4]
  assign io_ex_ALU_Src = alu_src; // @[ID_EX_Register.scala 113:21:@775.4]
  assign io_ex_ALUOp = aluop; // @[ID_EX_Register.scala 114:21:@776.4]
  assign io_ex_Branch = branch; // @[ID_EX_Register.scala 115:21:@777.4]
  assign io_ex_Branch_Src = branch_src; // @[ID_EX_Register.scala 116:21:@778.4]
  assign io_ex_Jump_Type = jump_type; // @[ID_EX_Register.scala 117:21:@779.4]
  assign io_ex_Mem_Read = mem_read; // @[ID_EX_Register.scala 118:21:@780.4]
  assign io_ex_Mem_Write = mem_write; // @[ID_EX_Register.scala 119:21:@781.4]
  assign io_ex_Data_Size = data_size; // @[ID_EX_Register.scala 122:21:@784.4]
  assign io_ex_Load_Type = load_type; // @[ID_EX_Register.scala 123:21:@785.4]
  assign io_ex_Reg_Write = reg_write; // @[ID_EX_Register.scala 120:21:@782.4]
  assign io_ex_Mem_to_Reg = mem_to_reg; // @[ID_EX_Register.scala 121:21:@783.4]
  assign io_ex_pc = pc; // @[ID_EX_Register.scala 124:21:@786.4]
  assign io_ex_pc_4 = pc_4; // @[ID_EX_Register.scala 125:21:@787.4]
  assign io_ex_rs1_out = rs1_out; // @[ID_EX_Register.scala 126:21:@788.4]
  assign io_ex_rs2_out = rs2_out; // @[ID_EX_Register.scala 127:21:@789.4]
  assign io_ex_rd = inst[11:7]; // @[ID_EX_Register.scala 132:21:@795.4]
  assign io_ex_imm = imm; // @[ID_EX_Register.scala 130:21:@792.4]
  assign io_ex_rs1 = rs1[4:0]; // @[ID_EX_Register.scala 128:21:@790.4]
  assign io_ex_rs2 = rs2[4:0]; // @[ID_EX_Register.scala 129:21:@791.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  pc = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  pc_4 = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rs1_out = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  rs2_out = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  imm = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  inst = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  rs1 = _RAND_6[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  rs2 = _RAND_7[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  alu_src = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  aluop = _RAND_9[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  branch = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  branch_src = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  jump_type = _RAND_12[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_13 = {1{`RANDOM}};
  mem_read = _RAND_13[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_14 = {1{`RANDOM}};
  mem_write = _RAND_14[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_15 = {1{`RANDOM}};
  data_size = _RAND_15[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_16 = {1{`RANDOM}};
  load_type = _RAND_16[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_17 = {1{`RANDOM}};
  reg_write = _RAND_17[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_18 = {1{`RANDOM}};
  mem_to_reg = _RAND_18[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      pc <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        pc <= 32'h0;
      end else begin
        pc <= io_id_pc;
      end
    end
    if (reset) begin
      pc_4 <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        pc_4 <= 32'h0;
      end else begin
        pc_4 <= io_id_pc_4;
      end
    end
    if (reset) begin
      rs1_out <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        rs1_out <= 32'h0;
      end else begin
        rs1_out <= io_id_rs1_out;
      end
    end
    if (reset) begin
      rs2_out <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        rs2_out <= 32'h0;
      end else begin
        rs2_out <= io_id_rs2_out;
      end
    end
    if (reset) begin
      imm <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        imm <= 32'h0;
      end else begin
        imm <= io_id_imm;
      end
    end
    if (reset) begin
      inst <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        inst <= 32'h0;
      end else begin
        inst <= io_id_inst;
      end
    end
    if (reset) begin
      rs1 <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        rs1 <= 32'h0;
      end else begin
        rs1 <= {{27'd0}, io_id_rs1};
      end
    end
    if (reset) begin
      rs2 <= 32'h0;
    end else begin
      if (io_ID_EX_Flush) begin
        rs2 <= 32'h0;
      end else begin
        rs2 <= {{27'd0}, io_id_rs2};
      end
    end
    if (reset) begin
      alu_src <= 1'h0;
    end else begin
      alu_src <= _T_149[0];
    end
    if (reset) begin
      aluop <= 5'h0;
    end else begin
      aluop <= _T_152[4:0];
    end
    if (reset) begin
      branch <= 1'h0;
    end else begin
      branch <= _T_155[0];
    end
    if (reset) begin
      branch_src <= 1'h0;
    end else begin
      branch_src <= _T_158[0];
    end
    if (reset) begin
      jump_type <= 1'h0;
    end else begin
      jump_type <= _T_161[0];
    end
    if (reset) begin
      mem_read <= 1'h0;
    end else begin
      mem_read <= _T_164[0];
    end
    if (reset) begin
      mem_write <= 1'h0;
    end else begin
      mem_write <= _T_167[0];
    end
    if (reset) begin
      data_size <= 2'h0;
    end else begin
      data_size <= _T_170[1:0];
    end
    if (reset) begin
      load_type <= 1'h0;
    end else begin
      load_type <= _T_173[0];
    end
    if (reset) begin
      reg_write <= 1'h0;
    end else begin
      reg_write <= _T_176[0];
    end
    if (reset) begin
      mem_to_reg <= 3'h0;
    end else begin
      mem_to_reg <= _T_179[2:0];
    end
  end
endmodule
module ALU( // @[:@797.2]
  input  [31:0] io_Src_A, // @[:@800.4]
  input  [31:0] io_Src_B, // @[:@800.4]
  input  [4:0]  io_ALUOp, // @[:@800.4]
  output [31:0] io_Sum, // @[:@800.4]
  output        io_Conflag // @[:@800.4]
);
  wire [5:0] shamt; // @[ALU.scala 52:23:@802.4]
  wire [32:0] _T_15; // @[ALU.scala 54:28:@803.4]
  wire [31:0] _T_16; // @[ALU.scala 54:28:@804.4]
  wire [32:0] _T_17; // @[ALU.scala 55:28:@805.4]
  wire [32:0] _T_18; // @[ALU.scala 55:28:@806.4]
  wire [31:0] _T_19; // @[ALU.scala 55:28:@807.4]
  wire [31:0] _T_20; // @[ALU.scala 56:28:@808.4]
  wire [31:0] _T_21; // @[ALU.scala 57:28:@809.4]
  wire [31:0] _GEN_0; // @[ALU.scala 58:28:@810.4]
  wire [31:0] _T_22; // @[ALU.scala 58:28:@810.4]
  wire [94:0] _GEN_1; // @[ALU.scala 59:28:@811.4]
  wire [94:0] _T_23; // @[ALU.scala 59:28:@811.4]
  wire [31:0] _T_24; // @[ALU.scala 60:28:@812.4]
  wire [31:0] _T_25; // @[ALU.scala 61:34:@813.4]
  wire [31:0] _T_26; // @[ALU.scala 61:37:@814.4]
  wire [31:0] _T_27; // @[ALU.scala 61:53:@815.4]
  wire [31:0] _T_29; // @[ALU.scala 62:54:@817.4]
  wire  _T_30; // @[ALU.scala 62:37:@818.4]
  wire  _T_31; // @[ALU.scala 63:28:@819.4]
  wire  _T_32; // @[Mux.scala 46:19:@820.4]
  wire [31:0] _T_33; // @[Mux.scala 46:16:@821.4]
  wire  _T_34; // @[Mux.scala 46:19:@822.4]
  wire [31:0] _T_35; // @[Mux.scala 46:16:@823.4]
  wire  _T_36; // @[Mux.scala 46:19:@824.4]
  wire [31:0] _T_37; // @[Mux.scala 46:16:@825.4]
  wire  _T_38; // @[Mux.scala 46:19:@826.4]
  wire [31:0] _T_39; // @[Mux.scala 46:16:@827.4]
  wire  _T_40; // @[Mux.scala 46:19:@828.4]
  wire [94:0] _T_41; // @[Mux.scala 46:16:@829.4]
  wire  _T_42; // @[Mux.scala 46:19:@830.4]
  wire [94:0] _T_43; // @[Mux.scala 46:16:@831.4]
  wire  _T_44; // @[Mux.scala 46:19:@832.4]
  wire [94:0] _T_45; // @[Mux.scala 46:16:@833.4]
  wire  _T_46; // @[Mux.scala 46:19:@834.4]
  wire [94:0] _T_47; // @[Mux.scala 46:16:@835.4]
  wire  _T_48; // @[Mux.scala 46:19:@836.4]
  wire [94:0] _T_49; // @[Mux.scala 46:16:@837.4]
  wire  _T_50; // @[Mux.scala 46:19:@838.4]
  wire [94:0] _T_51; // @[Mux.scala 46:16:@839.4]
  wire  _T_55; // @[ALU.scala 67:37:@843.4]
  wire  _T_58; // @[ALU.scala 68:37:@846.4]
  wire  _T_64; // @[ALU.scala 70:37:@852.4]
  wire  _T_66; // @[ALU.scala 72:28:@854.4]
  wire  _T_67; // @[Mux.scala 46:19:@855.4]
  wire  _T_68; // @[Mux.scala 46:16:@856.4]
  wire  _T_69; // @[Mux.scala 46:19:@857.4]
  wire  _T_70; // @[Mux.scala 46:16:@858.4]
  wire  _T_71; // @[Mux.scala 46:19:@859.4]
  wire  _T_72; // @[Mux.scala 46:16:@860.4]
  wire  _T_73; // @[Mux.scala 46:19:@861.4]
  wire  _T_74; // @[Mux.scala 46:16:@862.4]
  wire  _T_75; // @[Mux.scala 46:19:@863.4]
  wire  _T_76; // @[Mux.scala 46:16:@864.4]
  wire  _T_77; // @[Mux.scala 46:19:@865.4]
  assign shamt = io_Src_B[5:0]; // @[ALU.scala 52:23:@802.4]
  assign _T_15 = io_Src_A + io_Src_B; // @[ALU.scala 54:28:@803.4]
  assign _T_16 = io_Src_A + io_Src_B; // @[ALU.scala 54:28:@804.4]
  assign _T_17 = io_Src_A - io_Src_B; // @[ALU.scala 55:28:@805.4]
  assign _T_18 = $unsigned(_T_17); // @[ALU.scala 55:28:@806.4]
  assign _T_19 = _T_18[31:0]; // @[ALU.scala 55:28:@807.4]
  assign _T_20 = io_Src_A & io_Src_B; // @[ALU.scala 56:28:@808.4]
  assign _T_21 = io_Src_A | io_Src_B; // @[ALU.scala 57:28:@809.4]
  assign _GEN_0 = {{26'd0}, shamt}; // @[ALU.scala 58:28:@810.4]
  assign _T_22 = io_Src_A ^ _GEN_0; // @[ALU.scala 58:28:@810.4]
  assign _GEN_1 = {{63'd0}, io_Src_A}; // @[ALU.scala 59:28:@811.4]
  assign _T_23 = _GEN_1 << shamt; // @[ALU.scala 59:28:@811.4]
  assign _T_24 = io_Src_A >> shamt; // @[ALU.scala 60:28:@812.4]
  assign _T_25 = $signed(io_Src_A); // @[ALU.scala 61:34:@813.4]
  assign _T_26 = $signed(_T_25) >>> shamt; // @[ALU.scala 61:37:@814.4]
  assign _T_27 = $unsigned(_T_26); // @[ALU.scala 61:53:@815.4]
  assign _T_29 = $signed(io_Src_B); // @[ALU.scala 62:54:@817.4]
  assign _T_30 = $signed(_T_25) < $signed(_T_29); // @[ALU.scala 62:37:@818.4]
  assign _T_31 = io_Src_A < io_Src_B; // @[ALU.scala 63:28:@819.4]
  assign _T_32 = 5'h9 == io_ALUOp; // @[Mux.scala 46:19:@820.4]
  assign _T_33 = _T_32 ? {{31'd0}, _T_31} : io_Src_B; // @[Mux.scala 46:16:@821.4]
  assign _T_34 = 5'h8 == io_ALUOp; // @[Mux.scala 46:19:@822.4]
  assign _T_35 = _T_34 ? {{31'd0}, _T_30} : _T_33; // @[Mux.scala 46:16:@823.4]
  assign _T_36 = 5'h7 == io_ALUOp; // @[Mux.scala 46:19:@824.4]
  assign _T_37 = _T_36 ? _T_27 : _T_35; // @[Mux.scala 46:16:@825.4]
  assign _T_38 = 5'h6 == io_ALUOp; // @[Mux.scala 46:19:@826.4]
  assign _T_39 = _T_38 ? _T_24 : _T_37; // @[Mux.scala 46:16:@827.4]
  assign _T_40 = 5'h5 == io_ALUOp; // @[Mux.scala 46:19:@828.4]
  assign _T_41 = _T_40 ? _T_23 : {{63'd0}, _T_39}; // @[Mux.scala 46:16:@829.4]
  assign _T_42 = 5'h4 == io_ALUOp; // @[Mux.scala 46:19:@830.4]
  assign _T_43 = _T_42 ? {{63'd0}, _T_22} : _T_41; // @[Mux.scala 46:16:@831.4]
  assign _T_44 = 5'h3 == io_ALUOp; // @[Mux.scala 46:19:@832.4]
  assign _T_45 = _T_44 ? {{63'd0}, _T_21} : _T_43; // @[Mux.scala 46:16:@833.4]
  assign _T_46 = 5'h2 == io_ALUOp; // @[Mux.scala 46:19:@834.4]
  assign _T_47 = _T_46 ? {{63'd0}, _T_20} : _T_45; // @[Mux.scala 46:16:@835.4]
  assign _T_48 = 5'h1 == io_ALUOp; // @[Mux.scala 46:19:@836.4]
  assign _T_49 = _T_48 ? {{63'd0}, _T_19} : _T_47; // @[Mux.scala 46:16:@837.4]
  assign _T_50 = 5'h0 == io_ALUOp; // @[Mux.scala 46:19:@838.4]
  assign _T_51 = _T_50 ? {{63'd0}, _T_16} : _T_49; // @[Mux.scala 46:16:@839.4]
  assign _T_55 = $signed(_T_25) == $signed(_T_29); // @[ALU.scala 67:37:@843.4]
  assign _T_58 = $signed(_T_25) != $signed(_T_29); // @[ALU.scala 68:37:@846.4]
  assign _T_64 = $signed(_T_25) >= $signed(_T_29); // @[ALU.scala 70:37:@852.4]
  assign _T_66 = io_Src_A >= io_Src_B; // @[ALU.scala 72:28:@854.4]
  assign _T_67 = 5'hf == io_ALUOp; // @[Mux.scala 46:19:@855.4]
  assign _T_68 = _T_67 ? _T_66 : 1'h0; // @[Mux.scala 46:16:@856.4]
  assign _T_69 = 5'he == io_ALUOp; // @[Mux.scala 46:19:@857.4]
  assign _T_70 = _T_69 ? _T_31 : _T_68; // @[Mux.scala 46:16:@858.4]
  assign _T_71 = 5'hd == io_ALUOp; // @[Mux.scala 46:19:@859.4]
  assign _T_72 = _T_71 ? _T_64 : _T_70; // @[Mux.scala 46:16:@860.4]
  assign _T_73 = 5'hc == io_ALUOp; // @[Mux.scala 46:19:@861.4]
  assign _T_74 = _T_73 ? _T_30 : _T_72; // @[Mux.scala 46:16:@862.4]
  assign _T_75 = 5'hb == io_ALUOp; // @[Mux.scala 46:19:@863.4]
  assign _T_76 = _T_75 ? _T_58 : _T_74; // @[Mux.scala 46:16:@864.4]
  assign _T_77 = 5'ha == io_ALUOp; // @[Mux.scala 46:19:@865.4]
  assign io_Sum = _T_51[31:0]; // @[ALU.scala 53:10:@840.4]
  assign io_Conflag = _T_77 ? _T_55 : _T_76; // @[ALU.scala 66:14:@867.4]
endmodule
module Datapath( // @[:@869.2]
  input  [31:0] io_if_datapathio_if_pc, // @[:@872.4]
  input  [1:0]  io_if_datapathio_PC_Sel, // @[:@872.4]
  input  [31:0] io_if_datapathio_new_addr, // @[:@872.4]
  input  [31:0] io_if_datapathio_pc_recover, // @[:@872.4]
  output [31:0] io_if_datapathio_if_new_pc, // @[:@872.4]
  output [31:0] io_if_datapathio_if_pc_4, // @[:@872.4]
  input         io_id_datapathio_Bubble, // @[:@872.4]
  input         io_id_datapathio_Reg_Write, // @[:@872.4]
  input         io_id_datapathio_ALU_Src, // @[:@872.4]
  input  [4:0]  io_id_datapathio_ALUOp, // @[:@872.4]
  input         io_id_datapathio_Branch, // @[:@872.4]
  input         io_id_datapathio_Branch_Src, // @[:@872.4]
  input         io_id_datapathio_Mem_Read, // @[:@872.4]
  input         io_id_datapathio_Mem_Write, // @[:@872.4]
  input  [1:0]  io_id_datapathio_Data_Size, // @[:@872.4]
  input         io_id_datapathio_Load_Type, // @[:@872.4]
  input  [2:0]  io_id_datapathio_Mem_to_Reg, // @[:@872.4]
  input         io_id_datapathio_Jump_Type, // @[:@872.4]
  output        io_id_datapathio_id_Reg_Write, // @[:@872.4]
  output        io_id_datapathio_id_ALU_Src, // @[:@872.4]
  output [4:0]  io_id_datapathio_id_ALUOp, // @[:@872.4]
  output        io_id_datapathio_id_Branch, // @[:@872.4]
  output        io_id_datapathio_id_Branch_Src, // @[:@872.4]
  output        io_id_datapathio_id_Mem_Read, // @[:@872.4]
  output        io_id_datapathio_id_Mem_Write, // @[:@872.4]
  output [1:0]  io_id_datapathio_id_Data_Size, // @[:@872.4]
  output        io_id_datapathio_id_Load_Type, // @[:@872.4]
  output [2:0]  io_id_datapathio_id_Mem_to_Reg, // @[:@872.4]
  output        io_id_datapathio_id_Jump_Type, // @[:@872.4]
  input  [31:0] io_ex_datapathio_ex_rs1_out, // @[:@872.4]
  input  [31:0] io_ex_datapathio_ex_rs2_out, // @[:@872.4]
  input  [31:0] io_ex_datapathio_ex_imm, // @[:@872.4]
  input  [31:0] io_ex_datapathio_ex_pc, // @[:@872.4]
  input         io_ex_datapathio_ex_ALU_Src, // @[:@872.4]
  input         io_ex_datapathio_ex_Branch, // @[:@872.4]
  input         io_ex_datapathio_ex_alu_conflag, // @[:@872.4]
  input         io_ex_datapathio_ex_Branch_Src, // @[:@872.4]
  input         io_ex_datapathio_ex_Jump_Type, // @[:@872.4]
  input  [1:0]  io_ex_datapathio_Forward_A, // @[:@872.4]
  input  [1:0]  io_ex_datapathio_Forward_B, // @[:@872.4]
  output [31:0] io_ex_datapathio_alu_b_src, // @[:@872.4]
  output [31:0] io_ex_datapathio_ex_aui_pc, // @[:@872.4]
  output [31:0] io_ex_datapathio_forward_rs2_out, // @[:@872.4]
  output [31:0] io_ex_datapathio_alu_a_src, // @[:@872.4]
  output        io_ex_datapathio_PC_Src, // @[:@872.4]
  output [31:0] io_ex_datapathio_branch_addr, // @[:@872.4]
  input  [31:0] io_mem_datapathio_mem_rs2_out, // @[:@872.4]
  input         io_mem_datapathio_MemWrite_Src, // @[:@872.4]
  input  [2:0]  io_mem_datapathio_mem_Mem_to_Reg, // @[:@872.4]
  input  [31:0] io_mem_datapathio_mem_alu_sum, // @[:@872.4]
  input  [31:0] io_mem_datapathio_mem_pc_4, // @[:@872.4]
  input  [31:0] io_mem_datapathio_mem_imm, // @[:@872.4]
  input  [31:0] io_mem_datapathio_mem_aui_pc, // @[:@872.4]
  output [31:0] io_mem_datapathio_mem_writedata, // @[:@872.4]
  input  [31:0] io_wb_datapathio_wb_alu_sum, // @[:@872.4]
  input  [31:0] io_wb_datapathio_wb_dataout, // @[:@872.4]
  input  [31:0] io_wb_datapathio_wb_pc_4, // @[:@872.4]
  input  [31:0] io_wb_datapathio_wb_imm, // @[:@872.4]
  input  [31:0] io_wb_datapathio_wb_aui_pc, // @[:@872.4]
  input  [2:0]  io_wb_datapathio_wb_Mem_to_Reg, // @[:@872.4]
  output [31:0] io_wb_datapathio_wb_reg_writedata // @[:@872.4]
);
  wire [32:0] _T_128; // @[Datapath.scala 114:37:@874.4]
  wire [31:0] PC_4; // @[Datapath.scala 114:37:@875.4]
  wire [31:0] _T_130; // @[Datapath.scala 118:27:@878.4]
  wire [32:0] _T_131; // @[Datapath.scala 118:121:@879.4]
  wire  _T_134; // @[Datapath.scala 124:19:@884.4]
  wire  _T_148; // @[Mux.scala 46:19:@889.4]
  wire [31:0] _T_149; // @[Mux.scala 46:16:@890.4]
  wire  _T_150; // @[Mux.scala 46:19:@891.4]
  wire [31:0] _T_151; // @[Mux.scala 46:16:@892.4]
  wire  _T_152; // @[Mux.scala 46:19:@893.4]
  wire  _T_187; // @[Mux.scala 46:19:@929.4]
  wire [31:0] _T_188; // @[Mux.scala 46:16:@930.4]
  wire  _T_189; // @[Mux.scala 46:19:@931.4]
  wire [31:0] _T_190; // @[Mux.scala 46:16:@932.4]
  wire  _T_191; // @[Mux.scala 46:19:@933.4]
  wire [31:0] _T_192; // @[Mux.scala 46:16:@934.4]
  wire  _T_193; // @[Mux.scala 46:19:@935.4]
  wire [31:0] mem_forward_value; // @[Mux.scala 46:16:@936.4]
  wire  _T_202; // @[Mux.scala 46:19:@937.4]
  wire [31:0] _T_203; // @[Mux.scala 46:16:@938.4]
  wire  _T_204; // @[Mux.scala 46:19:@939.4]
  wire [31:0] _T_205; // @[Mux.scala 46:16:@940.4]
  wire  _T_206; // @[Mux.scala 46:19:@941.4]
  wire  _T_208; // @[Mux.scala 46:19:@944.4]
  wire [31:0] _T_209; // @[Mux.scala 46:16:@945.4]
  wire  _T_210; // @[Mux.scala 46:19:@946.4]
  wire [31:0] _T_211; // @[Mux.scala 46:16:@947.4]
  wire  _T_212; // @[Mux.scala 46:19:@948.4]
  wire [31:0] operand_b; // @[Mux.scala 46:16:@949.4]
  wire  _T_217; // @[Mux.scala 46:19:@957.4]
  wire [31:0] _T_218; // @[Mux.scala 46:16:@958.4]
  wire  _T_219; // @[Mux.scala 46:19:@959.4]
  wire [31:0] _T_220; // @[Mux.scala 46:16:@960.4]
  wire  _T_221; // @[Mux.scala 46:19:@961.4]
  wire [31:0] _T_222; // @[Mux.scala 46:16:@962.4]
  wire  _T_223; // @[Mux.scala 46:19:@963.4]
  wire [31:0] _T_224; // @[Mux.scala 46:16:@964.4]
  wire  _T_225; // @[Mux.scala 46:19:@965.4]
  assign _T_128 = io_if_datapathio_if_pc + 32'h4; // @[Datapath.scala 114:37:@874.4]
  assign PC_4 = io_if_datapathio_if_pc + 32'h4; // @[Datapath.scala 114:37:@875.4]
  assign _T_130 = io_ex_datapathio_ex_Branch_Src ? io_ex_datapathio_alu_a_src : io_ex_datapathio_ex_pc; // @[Datapath.scala 118:27:@878.4]
  assign _T_131 = _T_130 + io_ex_datapathio_ex_imm; // @[Datapath.scala 118:121:@879.4]
  assign _T_134 = io_ex_datapathio_ex_Jump_Type ? 1'h1 : io_ex_datapathio_ex_alu_conflag; // @[Datapath.scala 124:19:@884.4]
  assign _T_148 = 2'h2 == io_if_datapathio_PC_Sel; // @[Mux.scala 46:19:@889.4]
  assign _T_149 = _T_148 ? io_if_datapathio_pc_recover : PC_4; // @[Mux.scala 46:16:@890.4]
  assign _T_150 = 2'h1 == io_if_datapathio_PC_Sel; // @[Mux.scala 46:19:@891.4]
  assign _T_151 = _T_150 ? io_if_datapathio_new_addr : _T_149; // @[Mux.scala 46:16:@892.4]
  assign _T_152 = 2'h0 == io_if_datapathio_PC_Sel; // @[Mux.scala 46:19:@893.4]
  assign _T_187 = 3'h4 == io_mem_datapathio_mem_Mem_to_Reg; // @[Mux.scala 46:19:@929.4]
  assign _T_188 = _T_187 ? io_mem_datapathio_mem_aui_pc : 32'h0; // @[Mux.scala 46:16:@930.4]
  assign _T_189 = 3'h3 == io_mem_datapathio_mem_Mem_to_Reg; // @[Mux.scala 46:19:@931.4]
  assign _T_190 = _T_189 ? io_mem_datapathio_mem_imm : _T_188; // @[Mux.scala 46:16:@932.4]
  assign _T_191 = 3'h2 == io_mem_datapathio_mem_Mem_to_Reg; // @[Mux.scala 46:19:@933.4]
  assign _T_192 = _T_191 ? io_mem_datapathio_mem_pc_4 : _T_190; // @[Mux.scala 46:16:@934.4]
  assign _T_193 = 3'h0 == io_mem_datapathio_mem_Mem_to_Reg; // @[Mux.scala 46:19:@935.4]
  assign mem_forward_value = _T_193 ? io_mem_datapathio_mem_alu_sum : _T_192; // @[Mux.scala 46:16:@936.4]
  assign _T_202 = 2'h2 == io_ex_datapathio_Forward_A; // @[Mux.scala 46:19:@937.4]
  assign _T_203 = _T_202 ? mem_forward_value : io_ex_datapathio_ex_rs1_out; // @[Mux.scala 46:16:@938.4]
  assign _T_204 = 2'h1 == io_ex_datapathio_Forward_A; // @[Mux.scala 46:19:@939.4]
  assign _T_205 = _T_204 ? io_wb_datapathio_wb_reg_writedata : _T_203; // @[Mux.scala 46:16:@940.4]
  assign _T_206 = 2'h0 == io_ex_datapathio_Forward_A; // @[Mux.scala 46:19:@941.4]
  assign _T_208 = 2'h2 == io_ex_datapathio_Forward_B; // @[Mux.scala 46:19:@944.4]
  assign _T_209 = _T_208 ? mem_forward_value : io_ex_datapathio_ex_rs2_out; // @[Mux.scala 46:16:@945.4]
  assign _T_210 = 2'h1 == io_ex_datapathio_Forward_B; // @[Mux.scala 46:19:@946.4]
  assign _T_211 = _T_210 ? io_wb_datapathio_wb_reg_writedata : _T_209; // @[Mux.scala 46:16:@947.4]
  assign _T_212 = 2'h0 == io_ex_datapathio_Forward_B; // @[Mux.scala 46:19:@948.4]
  assign operand_b = _T_212 ? io_ex_datapathio_ex_rs2_out : _T_211; // @[Mux.scala 46:16:@949.4]
  assign _T_217 = 3'h4 == io_wb_datapathio_wb_Mem_to_Reg; // @[Mux.scala 46:19:@957.4]
  assign _T_218 = _T_217 ? io_wb_datapathio_wb_aui_pc : io_wb_datapathio_wb_alu_sum; // @[Mux.scala 46:16:@958.4]
  assign _T_219 = 3'h3 == io_wb_datapathio_wb_Mem_to_Reg; // @[Mux.scala 46:19:@959.4]
  assign _T_220 = _T_219 ? io_wb_datapathio_wb_imm : _T_218; // @[Mux.scala 46:16:@960.4]
  assign _T_221 = 3'h2 == io_wb_datapathio_wb_Mem_to_Reg; // @[Mux.scala 46:19:@961.4]
  assign _T_222 = _T_221 ? io_wb_datapathio_wb_pc_4 : _T_220; // @[Mux.scala 46:16:@962.4]
  assign _T_223 = 3'h1 == io_wb_datapathio_wb_Mem_to_Reg; // @[Mux.scala 46:19:@963.4]
  assign _T_224 = _T_223 ? io_wb_datapathio_wb_dataout : _T_222; // @[Mux.scala 46:16:@964.4]
  assign _T_225 = 3'h0 == io_wb_datapathio_wb_Mem_to_Reg; // @[Mux.scala 46:19:@965.4]
  assign io_if_datapathio_if_new_pc = _T_152 ? PC_4 : _T_151; // @[Datapath.scala 127:30:@895.4]
  assign io_if_datapathio_if_pc_4 = io_if_datapathio_if_pc + 32'h4; // @[Datapath.scala 115:28:@876.4]
  assign io_id_datapathio_id_Reg_Write = io_id_datapathio_Bubble ? 1'h0 : io_id_datapathio_Reg_Write; // @[Datapath.scala 135:35:@898.4]
  assign io_id_datapathio_id_ALU_Src = io_id_datapathio_Bubble ? 1'h0 : io_id_datapathio_ALU_Src; // @[Datapath.scala 136:35:@901.4]
  assign io_id_datapathio_id_ALUOp = io_id_datapathio_Bubble ? 5'h0 : io_id_datapathio_ALUOp; // @[Datapath.scala 137:35:@904.4]
  assign io_id_datapathio_id_Branch = io_id_datapathio_Bubble ? 1'h0 : io_id_datapathio_Branch; // @[Datapath.scala 138:35:@907.4]
  assign io_id_datapathio_id_Branch_Src = io_id_datapathio_Bubble ? 1'h0 : io_id_datapathio_Branch_Src; // @[Datapath.scala 139:35:@910.4]
  assign io_id_datapathio_id_Mem_Read = io_id_datapathio_Bubble ? 1'h0 : io_id_datapathio_Mem_Read; // @[Datapath.scala 140:35:@913.4]
  assign io_id_datapathio_id_Mem_Write = io_id_datapathio_Bubble ? 1'h0 : io_id_datapathio_Mem_Write; // @[Datapath.scala 141:35:@916.4]
  assign io_id_datapathio_id_Data_Size = io_id_datapathio_Bubble ? 2'h0 : io_id_datapathio_Data_Size; // @[Datapath.scala 142:35:@919.4]
  assign io_id_datapathio_id_Load_Type = io_id_datapathio_Bubble ? 1'h0 : io_id_datapathio_Load_Type; // @[Datapath.scala 143:35:@922.4]
  assign io_id_datapathio_id_Mem_to_Reg = io_id_datapathio_Bubble ? 3'h0 : io_id_datapathio_Mem_to_Reg; // @[Datapath.scala 144:35:@925.4]
  assign io_id_datapathio_id_Jump_Type = io_id_datapathio_Bubble ? 1'h0 : io_id_datapathio_Jump_Type; // @[Datapath.scala 145:35:@928.4]
  assign io_ex_datapathio_alu_b_src = io_ex_datapathio_ex_ALU_Src ? io_ex_datapathio_ex_imm : operand_b; // @[Datapath.scala 171:30:@952.4]
  assign io_ex_datapathio_ex_aui_pc = _T_130 + io_ex_datapathio_ex_imm; // @[Datapath.scala 120:30:@881.4]
  assign io_ex_datapathio_forward_rs2_out = _T_212 ? io_ex_datapathio_ex_rs2_out : _T_211; // @[Datapath.scala 173:36:@953.4]
  assign io_ex_datapathio_alu_a_src = _T_206 ? io_ex_datapathio_ex_rs1_out : _T_205; // @[Datapath.scala 156:30:@943.4]
  assign io_ex_datapathio_PC_Src = _T_134 & io_ex_datapathio_ex_Branch; // @[Datapath.scala 126:27:@888.4]
  assign io_ex_datapathio_branch_addr = _T_130 + io_ex_datapathio_ex_imm; // @[Datapath.scala 121:32:@882.4]
  assign io_mem_datapathio_mem_writedata = io_mem_datapathio_MemWrite_Src ? io_wb_datapathio_wb_reg_writedata : io_mem_datapathio_mem_rs2_out; // @[Datapath.scala 177:35:@956.4]
  assign io_wb_datapathio_wb_reg_writedata = _T_225 ? io_wb_datapathio_wb_alu_sum : _T_224; // @[Datapath.scala 182:37:@967.4]
endmodule
module EX_MEM_Register( // @[:@969.2]
  input         clock, // @[:@970.4]
  input         reset, // @[:@971.4]
  input  [31:0] io_ex_alu_sum, // @[:@972.4]
  input  [31:0] io_ex_rs2_out, // @[:@972.4]
  input  [4:0]  io_ex_rd, // @[:@972.4]
  input  [31:0] io_ex_pc_4, // @[:@972.4]
  input  [31:0] io_ex_imm, // @[:@972.4]
  input  [31:0] io_ex_aui_pc, // @[:@972.4]
  input  [4:0]  io_ex_rs2, // @[:@972.4]
  input         io_ex_Mem_Read, // @[:@972.4]
  input         io_ex_Mem_Write, // @[:@972.4]
  input  [1:0]  io_ex_Data_Size, // @[:@972.4]
  input         io_ex_Load_Type, // @[:@972.4]
  input         io_ex_Reg_Write, // @[:@972.4]
  input  [2:0]  io_ex_Mem_to_Reg, // @[:@972.4]
  output        io_mem_Mem_Read, // @[:@972.4]
  output        io_mem_Mem_Write, // @[:@972.4]
  output [1:0]  io_mem_Data_Size, // @[:@972.4]
  output        io_mem_Load_Type, // @[:@972.4]
  output        io_mem_Reg_Write, // @[:@972.4]
  output [2:0]  io_mem_Mem_to_Reg, // @[:@972.4]
  output [31:0] io_mem_alu_sum, // @[:@972.4]
  output [31:0] io_mem_rs2_out, // @[:@972.4]
  output [4:0]  io_mem_rd, // @[:@972.4]
  output [31:0] io_mem_pc_4, // @[:@972.4]
  output [31:0] io_mem_imm, // @[:@972.4]
  output [31:0] io_mem_aui_pc, // @[:@972.4]
  output [4:0]  io_mem_rs2 // @[:@972.4]
);
  reg [31:0] alu_sum; // @[EX_MEM_Register.scala 55:30:@974.4]
  reg [31:0] _RAND_0;
  reg [31:0] rs2_out; // @[EX_MEM_Register.scala 56:30:@975.4]
  reg [31:0] _RAND_1;
  reg [4:0] rd; // @[EX_MEM_Register.scala 57:30:@976.4]
  reg [31:0] _RAND_2;
  reg [31:0] pc_4; // @[EX_MEM_Register.scala 58:30:@977.4]
  reg [31:0] _RAND_3;
  reg [31:0] imm; // @[EX_MEM_Register.scala 59:30:@978.4]
  reg [31:0] _RAND_4;
  reg [31:0] aui_pc; // @[EX_MEM_Register.scala 60:30:@979.4]
  reg [31:0] _RAND_5;
  reg [4:0] rs2; // @[EX_MEM_Register.scala 61:30:@980.4]
  reg [31:0] _RAND_6;
  reg  mem_read; // @[EX_MEM_Register.scala 63:30:@981.4]
  reg [31:0] _RAND_7;
  reg  mem_write; // @[EX_MEM_Register.scala 64:30:@982.4]
  reg [31:0] _RAND_8;
  reg [1:0] data_size; // @[EX_MEM_Register.scala 65:30:@983.4]
  reg [31:0] _RAND_9;
  reg  load_type; // @[EX_MEM_Register.scala 66:30:@984.4]
  reg [31:0] _RAND_10;
  reg  reg_write; // @[EX_MEM_Register.scala 67:30:@985.4]
  reg [31:0] _RAND_11;
  reg [2:0] mem_to_reg; // @[EX_MEM_Register.scala 68:30:@986.4]
  reg [31:0] _RAND_12;
  assign io_mem_Mem_Read = mem_read; // @[EX_MEM_Register.scala 93:23:@1007.4]
  assign io_mem_Mem_Write = mem_write; // @[EX_MEM_Register.scala 94:23:@1008.4]
  assign io_mem_Data_Size = data_size; // @[EX_MEM_Register.scala 95:23:@1009.4]
  assign io_mem_Load_Type = load_type; // @[EX_MEM_Register.scala 96:23:@1010.4]
  assign io_mem_Reg_Write = reg_write; // @[EX_MEM_Register.scala 97:23:@1011.4]
  assign io_mem_Mem_to_Reg = mem_to_reg; // @[EX_MEM_Register.scala 98:23:@1012.4]
  assign io_mem_alu_sum = alu_sum; // @[EX_MEM_Register.scala 86:23:@1000.4]
  assign io_mem_rs2_out = rs2_out; // @[EX_MEM_Register.scala 87:23:@1001.4]
  assign io_mem_rd = rd; // @[EX_MEM_Register.scala 88:23:@1002.4]
  assign io_mem_pc_4 = pc_4; // @[EX_MEM_Register.scala 89:23:@1003.4]
  assign io_mem_imm = imm; // @[EX_MEM_Register.scala 90:23:@1004.4]
  assign io_mem_aui_pc = aui_pc; // @[EX_MEM_Register.scala 91:23:@1005.4]
  assign io_mem_rs2 = rs2; // @[EX_MEM_Register.scala 92:23:@1006.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  alu_sum = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  rs2_out = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rd = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  pc_4 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  imm = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  aui_pc = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  rs2 = _RAND_6[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  mem_read = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  mem_write = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  data_size = _RAND_9[1:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  load_type = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  reg_write = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_12 = {1{`RANDOM}};
  mem_to_reg = _RAND_12[2:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      alu_sum <= 32'h0;
    end else begin
      alu_sum <= io_ex_alu_sum;
    end
    if (reset) begin
      rs2_out <= 32'h0;
    end else begin
      rs2_out <= io_ex_rs2_out;
    end
    if (reset) begin
      rd <= 5'h0;
    end else begin
      rd <= io_ex_rd;
    end
    if (reset) begin
      pc_4 <= 32'h0;
    end else begin
      pc_4 <= io_ex_pc_4;
    end
    if (reset) begin
      imm <= 32'h0;
    end else begin
      imm <= io_ex_imm;
    end
    if (reset) begin
      aui_pc <= 32'h0;
    end else begin
      aui_pc <= io_ex_aui_pc;
    end
    if (reset) begin
      rs2 <= 5'h0;
    end else begin
      rs2 <= io_ex_rs2;
    end
    if (reset) begin
      mem_read <= 1'h0;
    end else begin
      mem_read <= io_ex_Mem_Read;
    end
    if (reset) begin
      mem_write <= 1'h0;
    end else begin
      mem_write <= io_ex_Mem_Write;
    end
    if (reset) begin
      data_size <= 2'h0;
    end else begin
      data_size <= io_ex_Data_Size;
    end
    if (reset) begin
      load_type <= 1'h0;
    end else begin
      load_type <= io_ex_Load_Type;
    end
    if (reset) begin
      reg_write <= 1'h0;
    end else begin
      reg_write <= io_ex_Reg_Write;
    end
    if (reset) begin
      mem_to_reg <= 3'h0;
    end else begin
      mem_to_reg <= io_ex_Mem_to_Reg;
    end
  end
endmodule
module DataCache( // @[:@1014.2]
  input         clock, // @[:@1015.4]
  input  [31:0] io_addr, // @[:@1017.4]
  input  [31:0] io_write_data, // @[:@1017.4]
  input         io_Mem_Read, // @[:@1017.4]
  input         io_Mem_Write, // @[:@1017.4]
  input  [1:0]  io_Data_Size, // @[:@1017.4]
  input         io_Load_Type, // @[:@1017.4]
  output [31:0] io_data_out // @[:@1017.4]
);
  reg [31:0] cache [0:31]; // @[DataCache.scala 41:18:@1019.4]
  reg [31:0] _RAND_0;
  wire [31:0] cache__T_35_data; // @[DataCache.scala 41:18:@1019.4]
  wire [4:0] cache__T_35_addr; // @[DataCache.scala 41:18:@1019.4]
  wire [31:0] cache__T_37_data; // @[DataCache.scala 41:18:@1019.4]
  wire [4:0] cache__T_37_addr; // @[DataCache.scala 41:18:@1019.4]
  wire [31:0] cache__T_39_data; // @[DataCache.scala 41:18:@1019.4]
  wire [4:0] cache__T_39_addr; // @[DataCache.scala 41:18:@1019.4]
  wire [31:0] cache__T_42_data; // @[DataCache.scala 41:18:@1019.4]
  wire [4:0] cache__T_42_addr; // @[DataCache.scala 41:18:@1019.4]
  wire [31:0] cache__T_51_data; // @[DataCache.scala 41:18:@1019.4]
  wire [4:0] cache__T_51_addr; // @[DataCache.scala 41:18:@1019.4]
  wire [31:0] cache__T_54_data; // @[DataCache.scala 41:18:@1019.4]
  wire [4:0] cache__T_54_addr; // @[DataCache.scala 41:18:@1019.4]
  wire [31:0] cache__T_75_data; // @[DataCache.scala 41:18:@1019.4]
  wire [4:0] cache__T_75_addr; // @[DataCache.scala 41:18:@1019.4]
  wire [31:0] cache__T_72_data; // @[DataCache.scala 41:18:@1019.4]
  wire [4:0] cache__T_72_addr; // @[DataCache.scala 41:18:@1019.4]
  wire  cache__T_72_mask; // @[DataCache.scala 41:18:@1019.4]
  wire  cache__T_72_en; // @[DataCache.scala 41:18:@1019.4]
  wire [31:0] fix_addr; // @[DataCache.scala 44:26:@1020.4]
  wire [15:0] _T_23; // @[DataCache.scala 48:48:@1021.4]
  wire [31:0] _T_24; // @[Cat.scala 30:58:@1022.4]
  wire [7:0] _T_26; // @[DataCache.scala 49:48:@1023.4]
  wire [31:0] _T_27; // @[Cat.scala 30:58:@1024.4]
  wire  _T_28; // @[Mux.scala 46:19:@1025.4]
  wire [31:0] _T_29; // @[Mux.scala 46:16:@1026.4]
  wire  _T_30; // @[Mux.scala 46:19:@1027.4]
  wire [31:0] _T_31; // @[Mux.scala 46:16:@1028.4]
  wire  _T_32; // @[Mux.scala 46:19:@1029.4]
  wire [31:0] write_data; // @[Mux.scala 46:16:@1030.4]
  wire [2:0] _T_33; // @[Cat.scala 30:58:@1031.4]
  wire [15:0] _T_40; // @[DataCache.scala 54:38:@1038.4]
  wire [15:0] _T_43; // @[DataCache.scala 55:40:@1041.4]
  wire [15:0] _T_44; // @[DataCache.scala 55:54:@1042.4]
  wire [46:0] _GEN_18; // @[DataCache.scala 55:57:@1043.4]
  wire [46:0] _T_46; // @[DataCache.scala 55:57:@1043.4]
  wire [46:0] _T_48; // @[DataCache.scala 55:66:@1044.4]
  wire [46:0] _T_49; // @[DataCache.scala 55:81:@1045.4]
  wire [7:0] _T_52; // @[DataCache.scala 56:38:@1048.4]
  wire [7:0] _T_55; // @[DataCache.scala 57:40:@1051.4]
  wire [7:0] _T_56; // @[DataCache.scala 57:53:@1052.4]
  wire [38:0] _GEN_19; // @[DataCache.scala 57:56:@1053.4]
  wire [38:0] _T_58; // @[DataCache.scala 57:56:@1053.4]
  wire [38:0] _T_60; // @[DataCache.scala 57:65:@1054.4]
  wire [38:0] _T_61; // @[DataCache.scala 57:80:@1055.4]
  wire  _T_62; // @[Mux.scala 46:19:@1056.4]
  wire [38:0] _T_63; // @[Mux.scala 46:16:@1057.4]
  wire  _T_64; // @[Mux.scala 46:19:@1058.4]
  wire [38:0] _T_65; // @[Mux.scala 46:16:@1059.4]
  wire  _T_66; // @[Mux.scala 46:19:@1060.4]
  wire [46:0] _T_67; // @[Mux.scala 46:16:@1061.4]
  wire  _T_68; // @[Mux.scala 46:19:@1062.4]
  wire [46:0] _T_69; // @[Mux.scala 46:16:@1063.4]
  wire  _T_70; // @[Mux.scala 46:19:@1064.4]
  wire [46:0] read_data; // @[Mux.scala 46:16:@1065.4]
  wire [46:0] _T_79; // @[DataCache.scala 61:21:@1074.4]
  assign cache__T_35_addr = fix_addr[4:0];
  assign cache__T_35_data = cache[cache__T_35_addr]; // @[DataCache.scala 41:18:@1019.4]
  assign cache__T_37_addr = fix_addr[4:0];
  assign cache__T_37_data = cache[cache__T_37_addr]; // @[DataCache.scala 41:18:@1019.4]
  assign cache__T_39_addr = fix_addr[4:0];
  assign cache__T_39_data = cache[cache__T_39_addr]; // @[DataCache.scala 41:18:@1019.4]
  assign cache__T_42_addr = fix_addr[4:0];
  assign cache__T_42_data = cache[cache__T_42_addr]; // @[DataCache.scala 41:18:@1019.4]
  assign cache__T_51_addr = fix_addr[4:0];
  assign cache__T_51_data = cache[cache__T_51_addr]; // @[DataCache.scala 41:18:@1019.4]
  assign cache__T_54_addr = fix_addr[4:0];
  assign cache__T_54_data = cache[cache__T_54_addr]; // @[DataCache.scala 41:18:@1019.4]
  assign cache__T_75_addr = fix_addr[4:0];
  assign cache__T_75_data = cache[cache__T_75_addr]; // @[DataCache.scala 41:18:@1019.4]
  assign cache__T_72_data = io_Mem_Write ? write_data : cache__T_75_data;
  assign cache__T_72_addr = fix_addr[4:0];
  assign cache__T_72_mask = 1'h1;
  assign cache__T_72_en = 1'h1;
  assign fix_addr = io_addr / 32'h4; // @[DataCache.scala 44:26:@1020.4]
  assign _T_23 = io_write_data[15:0]; // @[DataCache.scala 48:48:@1021.4]
  assign _T_24 = {16'h0,_T_23}; // @[Cat.scala 30:58:@1022.4]
  assign _T_26 = io_write_data[7:0]; // @[DataCache.scala 49:48:@1023.4]
  assign _T_27 = {24'h0,_T_26}; // @[Cat.scala 30:58:@1024.4]
  assign _T_28 = 2'h2 == io_Data_Size; // @[Mux.scala 46:19:@1025.4]
  assign _T_29 = _T_28 ? _T_27 : io_write_data; // @[Mux.scala 46:16:@1026.4]
  assign _T_30 = 2'h1 == io_Data_Size; // @[Mux.scala 46:19:@1027.4]
  assign _T_31 = _T_30 ? _T_24 : _T_29; // @[Mux.scala 46:16:@1028.4]
  assign _T_32 = 2'h0 == io_Data_Size; // @[Mux.scala 46:19:@1029.4]
  assign write_data = _T_32 ? io_write_data : _T_31; // @[Mux.scala 46:16:@1030.4]
  assign _T_33 = {io_Data_Size,io_Load_Type}; // @[Cat.scala 30:58:@1031.4]
  assign _T_40 = cache__T_39_data[15:0]; // @[DataCache.scala 54:38:@1038.4]
  assign _T_43 = cache__T_42_data[15:0]; // @[DataCache.scala 55:40:@1041.4]
  assign _T_44 = $signed(_T_43); // @[DataCache.scala 55:54:@1042.4]
  assign _GEN_18 = {{31{_T_44[15]}},_T_44}; // @[DataCache.scala 55:57:@1043.4]
  assign _T_46 = $signed(_GEN_18) << 5'h10; // @[DataCache.scala 55:57:@1043.4]
  assign _T_48 = $signed(_T_46) >>> 5'h10; // @[DataCache.scala 55:66:@1044.4]
  assign _T_49 = $unsigned(_T_48); // @[DataCache.scala 55:81:@1045.4]
  assign _T_52 = cache__T_51_data[7:0]; // @[DataCache.scala 56:38:@1048.4]
  assign _T_55 = cache__T_54_data[7:0]; // @[DataCache.scala 57:40:@1051.4]
  assign _T_56 = $signed(_T_55); // @[DataCache.scala 57:53:@1052.4]
  assign _GEN_19 = {{31{_T_56[7]}},_T_56}; // @[DataCache.scala 57:56:@1053.4]
  assign _T_58 = $signed(_GEN_19) << 5'h18; // @[DataCache.scala 57:56:@1053.4]
  assign _T_60 = $signed(_T_58) >>> 5'h18; // @[DataCache.scala 57:65:@1054.4]
  assign _T_61 = $unsigned(_T_60); // @[DataCache.scala 57:80:@1055.4]
  assign _T_62 = 3'h4 == _T_33; // @[Mux.scala 46:19:@1056.4]
  assign _T_63 = _T_62 ? _T_61 : {{7'd0}, cache__T_35_data}; // @[Mux.scala 46:16:@1057.4]
  assign _T_64 = 3'h5 == _T_33; // @[Mux.scala 46:19:@1058.4]
  assign _T_65 = _T_64 ? {{31'd0}, _T_52} : _T_63; // @[Mux.scala 46:16:@1059.4]
  assign _T_66 = 3'h2 == _T_33; // @[Mux.scala 46:19:@1060.4]
  assign _T_67 = _T_66 ? _T_49 : {{8'd0}, _T_65}; // @[Mux.scala 46:16:@1061.4]
  assign _T_68 = 3'h3 == _T_33; // @[Mux.scala 46:19:@1062.4]
  assign _T_69 = _T_68 ? {{31'd0}, _T_40} : _T_67; // @[Mux.scala 46:16:@1063.4]
  assign _T_70 = 3'h1 == _T_33; // @[Mux.scala 46:19:@1064.4]
  assign read_data = _T_70 ? {{15'd0}, cache__T_37_data} : _T_69; // @[Mux.scala 46:16:@1065.4]
  assign _T_79 = io_Mem_Read ? read_data : 47'h0; // @[DataCache.scala 61:21:@1074.4]
  assign io_data_out = _T_79[31:0]; // @[DataCache.scala 61:15:@1075.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 32; initvar = initvar+1)
    cache[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(cache__T_72_en & cache__T_72_mask) begin
      cache[cache__T_72_addr] <= cache__T_72_data; // @[DataCache.scala 41:18:@1019.4]
    end
  end
endmodule
module MEM_WB_Register( // @[:@1077.2]
  input         clock, // @[:@1078.4]
  input         reset, // @[:@1079.4]
  input  [31:0] io_mem_dataout, // @[:@1080.4]
  input  [31:0] io_mem_alu_sum, // @[:@1080.4]
  input  [4:0]  io_mem_rd, // @[:@1080.4]
  input  [31:0] io_mem_pc_4, // @[:@1080.4]
  input  [31:0] io_mem_imm, // @[:@1080.4]
  input  [31:0] io_mem_aui_pc, // @[:@1080.4]
  input  [2:0]  io_mem_Mem_to_Reg, // @[:@1080.4]
  input         io_mem_Reg_Write, // @[:@1080.4]
  output [2:0]  io_wb_Mem_to_Reg, // @[:@1080.4]
  output        io_wb_Reg_Write, // @[:@1080.4]
  output [31:0] io_wb_dataout, // @[:@1080.4]
  output [31:0] io_wb_alu_sum, // @[:@1080.4]
  output [4:0]  io_wb_rd, // @[:@1080.4]
  output [31:0] io_wb_pc_4, // @[:@1080.4]
  output [31:0] io_wb_imm, // @[:@1080.4]
  output [31:0] io_wb_aui_pc // @[:@1080.4]
);
  reg [31:0] dataout; // @[MEM_WB_Register.scala 43:28:@1082.4]
  reg [31:0] _RAND_0;
  reg [31:0] alu_sum; // @[MEM_WB_Register.scala 44:28:@1083.4]
  reg [31:0] _RAND_1;
  reg [4:0] rd; // @[MEM_WB_Register.scala 45:28:@1084.4]
  reg [31:0] _RAND_2;
  reg [31:0] pc_4; // @[MEM_WB_Register.scala 46:28:@1085.4]
  reg [31:0] _RAND_3;
  reg [31:0] imm; // @[MEM_WB_Register.scala 47:28:@1086.4]
  reg [31:0] _RAND_4;
  reg [31:0] aui_pc; // @[MEM_WB_Register.scala 48:28:@1087.4]
  reg [31:0] _RAND_5;
  reg [2:0] mem_to_reg; // @[MEM_WB_Register.scala 49:28:@1088.4]
  reg [31:0] _RAND_6;
  reg  reg_write; // @[MEM_WB_Register.scala 50:28:@1089.4]
  reg [31:0] _RAND_7;
  assign io_wb_Mem_to_Reg = mem_to_reg; // @[MEM_WB_Register.scala 63:21:@1098.4]
  assign io_wb_Reg_Write = reg_write; // @[MEM_WB_Register.scala 64:21:@1099.4]
  assign io_wb_dataout = dataout; // @[MEM_WB_Register.scala 65:21:@1100.4]
  assign io_wb_alu_sum = alu_sum; // @[MEM_WB_Register.scala 66:21:@1101.4]
  assign io_wb_rd = rd; // @[MEM_WB_Register.scala 67:21:@1102.4]
  assign io_wb_pc_4 = pc_4; // @[MEM_WB_Register.scala 68:21:@1103.4]
  assign io_wb_imm = imm; // @[MEM_WB_Register.scala 69:21:@1104.4]
  assign io_wb_aui_pc = aui_pc; // @[MEM_WB_Register.scala 70:21:@1105.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  dataout = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  alu_sum = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rd = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  pc_4 = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  imm = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  aui_pc = _RAND_5[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  mem_to_reg = _RAND_6[2:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  reg_write = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      dataout <= 32'h0;
    end else begin
      dataout <= io_mem_dataout;
    end
    if (reset) begin
      alu_sum <= 32'h0;
    end else begin
      alu_sum <= io_mem_alu_sum;
    end
    if (reset) begin
      rd <= 5'h0;
    end else begin
      rd <= io_mem_rd;
    end
    if (reset) begin
      pc_4 <= 32'h0;
    end else begin
      pc_4 <= io_mem_pc_4;
    end
    if (reset) begin
      imm <= 32'h0;
    end else begin
      imm <= io_mem_imm;
    end
    if (reset) begin
      aui_pc <= 32'h0;
    end else begin
      aui_pc <= io_mem_aui_pc;
    end
    if (reset) begin
      mem_to_reg <= 3'h0;
    end else begin
      mem_to_reg <= io_mem_Mem_to_Reg;
    end
    if (reset) begin
      reg_write <= 1'h0;
    end else begin
      reg_write <= io_mem_Reg_Write;
    end
  end
endmodule
module Forward( // @[:@1107.2]
  input        io_ex_mem_Reg_Write, // @[:@1110.4]
  input  [4:0] io_ex_mem_rd, // @[:@1110.4]
  input        io_ex_mem_Mem_Write, // @[:@1110.4]
  input  [4:0] io_ex_mem_rs2, // @[:@1110.4]
  input        io_mem_wb_Reg_Write, // @[:@1110.4]
  input  [4:0] io_mem_wb_rd, // @[:@1110.4]
  input  [4:0] io_id_ex_rs1, // @[:@1110.4]
  input  [4:0] io_id_ex_rs2, // @[:@1110.4]
  output [1:0] io_Forward_A, // @[:@1110.4]
  output [1:0] io_Forward_B, // @[:@1110.4]
  output       io_MemWrite_Src // @[:@1110.4]
);
  wire  _T_29; // @[Forward.scala 51:35:@1113.4]
  wire  _T_30; // @[Forward.scala 50:51:@1114.4]
  wire  _T_31; // @[Forward.scala 52:36:@1115.4]
  wire  ex_mem_a_con; // @[Forward.scala 51:51:@1116.4]
  wire  _T_34; // @[Forward.scala 54:35:@1118.4]
  wire  _T_35; // @[Forward.scala 53:51:@1119.4]
  wire  _T_37; // @[Forward.scala 55:22:@1120.4]
  wire  _T_38; // @[Forward.scala 54:51:@1121.4]
  wire  _T_39; // @[Forward.scala 56:36:@1122.4]
  wire  ex_wb_a_con; // @[Forward.scala 55:51:@1123.4]
  wire  _T_44; // @[Forward.scala 59:36:@1127.4]
  wire  ex_mem_b_con; // @[Forward.scala 58:51:@1128.4]
  wire  _T_50; // @[Forward.scala 62:22:@1132.4]
  wire  _T_51; // @[Forward.scala 61:51:@1133.4]
  wire  _T_52; // @[Forward.scala 63:36:@1134.4]
  wire  ex_wb_b_con; // @[Forward.scala 62:51:@1135.4]
  wire  _T_57; // @[Forward.scala 69:54:@1142.4]
  wire  _T_58; // @[Forward.scala 71:40:@1143.4]
  assign _T_29 = io_ex_mem_rd != 5'h0; // @[Forward.scala 51:35:@1113.4]
  assign _T_30 = io_ex_mem_Reg_Write & _T_29; // @[Forward.scala 50:51:@1114.4]
  assign _T_31 = io_ex_mem_rd == io_id_ex_rs1; // @[Forward.scala 52:36:@1115.4]
  assign ex_mem_a_con = _T_30 & _T_31; // @[Forward.scala 51:51:@1116.4]
  assign _T_34 = io_mem_wb_rd != 5'h0; // @[Forward.scala 54:35:@1118.4]
  assign _T_35 = io_mem_wb_Reg_Write & _T_34; // @[Forward.scala 53:51:@1119.4]
  assign _T_37 = ex_mem_a_con == 1'h0; // @[Forward.scala 55:22:@1120.4]
  assign _T_38 = _T_35 & _T_37; // @[Forward.scala 54:51:@1121.4]
  assign _T_39 = io_mem_wb_rd == io_id_ex_rs1; // @[Forward.scala 56:36:@1122.4]
  assign ex_wb_a_con = _T_38 & _T_39; // @[Forward.scala 55:51:@1123.4]
  assign _T_44 = io_ex_mem_rd == io_id_ex_rs2; // @[Forward.scala 59:36:@1127.4]
  assign ex_mem_b_con = _T_30 & _T_44; // @[Forward.scala 58:51:@1128.4]
  assign _T_50 = ex_mem_b_con == 1'h0; // @[Forward.scala 62:22:@1132.4]
  assign _T_51 = _T_35 & _T_50; // @[Forward.scala 61:51:@1133.4]
  assign _T_52 = io_mem_wb_rd == io_id_ex_rs2; // @[Forward.scala 63:36:@1134.4]
  assign ex_wb_b_con = _T_51 & _T_52; // @[Forward.scala 62:51:@1135.4]
  assign _T_57 = io_mem_wb_Reg_Write & io_ex_mem_Mem_Write; // @[Forward.scala 69:54:@1142.4]
  assign _T_58 = io_ex_mem_rs2 == io_mem_wb_rd; // @[Forward.scala 71:40:@1143.4]
  assign io_Forward_A = {ex_mem_a_con,ex_wb_a_con}; // @[Forward.scala 65:16:@1137.4]
  assign io_Forward_B = {ex_mem_b_con,ex_wb_b_con}; // @[Forward.scala 66:16:@1139.4]
  assign io_MemWrite_Src = _T_57 & _T_58; // @[Forward.scala 73:19:@1146.4]
endmodule
module Hazard_Detection( // @[:@1148.2]
  input  [4:0] io_rs1, // @[:@1151.4]
  input  [4:0] io_rs2, // @[:@1151.4]
  input  [4:0] io_ex_rd, // @[:@1151.4]
  input  [2:0] io_Imm_Sel, // @[:@1151.4]
  input        io_ex_Mem_Read, // @[:@1151.4]
  output       io_Bubble, // @[:@1151.4]
  output       io_IF_ID_Write, // @[:@1151.4]
  output       io_PC_Write // @[:@1151.4]
);
  wire  _T_22; // @[Hazard_Detection.scala 48:28:@1154.4]
  wire  _T_23; // @[Hazard_Detection.scala 47:41:@1155.4]
  wire  _T_24; // @[Hazard_Detection.scala 49:28:@1156.4]
  wire  _T_25; // @[Hazard_Detection.scala 48:41:@1157.4]
  wire  _T_26; // @[Hazard_Detection.scala 50:24:@1158.4]
  wire  rs1_con; // @[Hazard_Detection.scala 49:41:@1159.4]
  wire  _T_28; // @[Hazard_Detection.scala 64:28:@1161.4]
  wire  _T_29; // @[Hazard_Detection.scala 63:41:@1162.4]
  wire  _T_30; // @[Hazard_Detection.scala 65:28:@1163.4]
  wire  _T_31; // @[Hazard_Detection.scala 64:41:@1164.4]
  wire  _T_32; // @[Hazard_Detection.scala 66:24:@1165.4]
  wire  rs2_con; // @[Hazard_Detection.scala 65:41:@1166.4]
  wire  stall_con; // @[Hazard_Detection.scala 68:27:@1167.4]
  assign _T_22 = io_Imm_Sel != 3'h5; // @[Hazard_Detection.scala 48:28:@1154.4]
  assign _T_23 = io_ex_Mem_Read & _T_22; // @[Hazard_Detection.scala 47:41:@1155.4]
  assign _T_24 = io_Imm_Sel != 3'h6; // @[Hazard_Detection.scala 49:28:@1156.4]
  assign _T_25 = _T_23 & _T_24; // @[Hazard_Detection.scala 48:41:@1157.4]
  assign _T_26 = io_rs1 == io_ex_rd; // @[Hazard_Detection.scala 50:24:@1158.4]
  assign rs1_con = _T_25 & _T_26; // @[Hazard_Detection.scala 49:41:@1159.4]
  assign _T_28 = io_Imm_Sel == 3'h1; // @[Hazard_Detection.scala 64:28:@1161.4]
  assign _T_29 = io_ex_Mem_Read & _T_28; // @[Hazard_Detection.scala 63:41:@1162.4]
  assign _T_30 = io_Imm_Sel == 3'h4; // @[Hazard_Detection.scala 65:28:@1163.4]
  assign _T_31 = _T_29 & _T_30; // @[Hazard_Detection.scala 64:41:@1164.4]
  assign _T_32 = io_rs2 == io_ex_rd; // @[Hazard_Detection.scala 66:24:@1165.4]
  assign rs2_con = _T_31 & _T_32; // @[Hazard_Detection.scala 65:41:@1166.4]
  assign stall_con = rs1_con | rs2_con; // @[Hazard_Detection.scala 68:27:@1167.4]
  assign io_Bubble = rs1_con | rs2_con; // @[Hazard_Detection.scala 70:19:@1169.4]
  assign io_IF_ID_Write = stall_con ? 1'h0 : 1'h1; // @[Hazard_Detection.scala 71:19:@1171.4]
  assign io_PC_Write = stall_con ? 1'h0 : 1'h1; // @[Hazard_Detection.scala 72:19:@1173.4]
endmodule
module Addr_Buffer( // @[:@1175.2]
  input         clock, // @[:@1176.4]
  input  [31:0] io_addr_input, // @[:@1178.4]
  input         io_flush, // @[:@1178.4]
  input         io_record, // @[:@1178.4]
  output [31:0] io_front // @[:@1178.4]
);
  reg [31:0] buffer [0:2]; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_0;
  wire [31:0] buffer__T_30_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_30_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_1;
  wire [31:0] buffer__T_32_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_32_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_2;
  wire [31:0] buffer__T_40_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_40_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_3;
  wire [31:0] buffer__T_42_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_42_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_4;
  wire [31:0] buffer__T_193_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_193_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_5;
  wire [31:0] buffer__T_196_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_196_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_6;
  wire [31:0] buffer__T_213_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_213_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_7;
  wire [31:0] buffer__T_216_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_216_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_8;
  wire [31:0] buffer__T_233_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_233_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_9;
  wire [31:0] buffer__T_236_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_236_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [31:0] _RAND_10;
  wire [31:0] buffer__T_181_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_181_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire  buffer__T_181_mask; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire  buffer__T_181_en; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [31:0] buffer__T_201_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_201_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire  buffer__T_201_mask; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire  buffer__T_201_en; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [31:0] buffer__T_221_data; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire [1:0] buffer__T_221_addr; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire  buffer__T_221_mask; // @[Addr_Buffer.scala 31:19:@1180.4]
  wire  buffer__T_221_en; // @[Addr_Buffer.scala 31:19:@1180.4]
  reg [1:0] counter [0:2]; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_11;
  wire [1:0] counter__T_20_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_20_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_12;
  wire [1:0] counter__T_22_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_22_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_13;
  wire [1:0] counter__T_25_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_25_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_14;
  wire [1:0] counter__T_27_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_27_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_15;
  wire [1:0] counter__T_35_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_35_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_16;
  wire [1:0] counter__T_37_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_37_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_17;
  wire [1:0] counter__T_89_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_89_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_18;
  wire [1:0] counter__T_100_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_100_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_19;
  wire [1:0] counter__T_111_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_111_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_20;
  wire [1:0] counter__T_122_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_122_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_21;
  wire [1:0] counter__T_129_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_129_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_22;
  wire [1:0] counter__T_134_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_134_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_23;
  wire [1:0] counter__T_143_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_143_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_24;
  wire [1:0] counter__T_150_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_150_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_25;
  wire [1:0] counter__T_155_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_155_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_26;
  wire [1:0] counter__T_164_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_164_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_27;
  wire [1:0] counter__T_171_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_171_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_28;
  wire [1:0] counter__T_176_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_176_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_29;
  wire [1:0] counter__T_185_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_185_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_30;
  wire [1:0] counter__T_205_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_205_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_31;
  wire [1:0] counter__T_225_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_225_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg [31:0] _RAND_32;
  wire [1:0] counter__T_118_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_118_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire  counter__T_118_mask; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire  counter__T_118_en; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_139_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_139_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire  counter__T_139_mask; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire  counter__T_139_en; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_160_data; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire [1:0] counter__T_160_addr; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire  counter__T_160_mask; // @[Addr_Buffer.scala 32:20:@1181.4]
  wire  counter__T_160_en; // @[Addr_Buffer.scala 32:20:@1181.4]
  reg  is_used [0:2]; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_33;
  wire  is_used__T_46_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_46_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_34;
  wire  is_used__T_53_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_53_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_35;
  wire  is_used__T_62_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_62_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_36;
  wire  is_used__T_65_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_65_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_37;
  wire  is_used__T_71_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_71_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_38;
  wire  is_used__T_74_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_74_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_39;
  wire  is_used__T_80_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_80_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_40;
  wire  is_used__T_83_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_83_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_41;
  wire  is_used__T_127_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_127_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_42;
  wire  is_used__T_148_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_148_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_43;
  wire  is_used__T_169_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_169_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  reg [31:0] _RAND_44;
  wire  is_used__T_85_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_85_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire  is_used__T_85_mask; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire  is_used__T_85_en; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire  is_used__T_96_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_96_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire  is_used__T_96_mask; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire  is_used__T_96_en; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire  is_used__T_107_data; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire [1:0] is_used__T_107_addr; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire  is_used__T_107_mask; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire  is_used__T_107_en; // @[Addr_Buffer.scala 33:20:@1182.4]
  wire  _T_23; // @[Addr_Buffer.scala 35:30:@1185.4]
  wire  _T_28; // @[Addr_Buffer.scala 36:20:@1188.4]
  wire [31:0] _T_33; // @[Addr_Buffer.scala 36:8:@1191.4]
  wire  _T_38; // @[Addr_Buffer.scala 37:20:@1194.4]
  wire [31:0] _T_43; // @[Addr_Buffer.scala 37:8:@1197.4]
  wire  _T_48; // @[Addr_Buffer.scala 39:36:@1201.4]
  wire  _T_55; // @[Addr_Buffer.scala 39:69:@1203.4]
  wire [1:0] _T_56; // @[Addr_Buffer.scala 39:57:@1204.4]
  wire [1:0] write_index; // @[Addr_Buffer.scala 39:24:@1205.4]
  wire  _T_59; // @[Addr_Buffer.scala 41:61:@1207.4]
  wire  _T_63; // @[Addr_Buffer.scala 41:48:@1209.4]
  wire  temp_used_0; // @[Addr_Buffer.scala 41:24:@1211.4]
  wire  _T_68; // @[Addr_Buffer.scala 42:61:@1213.4]
  wire  _T_72; // @[Addr_Buffer.scala 42:48:@1215.4]
  wire  temp_used_1; // @[Addr_Buffer.scala 42:24:@1217.4]
  wire  _T_77; // @[Addr_Buffer.scala 43:61:@1219.4]
  wire  _T_81; // @[Addr_Buffer.scala 43:48:@1221.4]
  wire  temp_used_2; // @[Addr_Buffer.scala 43:24:@1223.4]
  wire  _T_91; // @[Addr_Buffer.scala 45:64:@1227.4]
  wire  _T_93; // @[Addr_Buffer.scala 45:52:@1228.4]
  wire  _T_102; // @[Addr_Buffer.scala 46:64:@1234.4]
  wire  _T_104; // @[Addr_Buffer.scala 46:52:@1235.4]
  wire  _T_113; // @[Addr_Buffer.scala 47:64:@1241.4]
  wire  _T_115; // @[Addr_Buffer.scala 47:52:@1242.4]
  wire  _T_124; // @[Addr_Buffer.scala 49:60:@1248.4]
  wire [2:0] _T_131; // @[Addr_Buffer.scala 49:101:@1251.4]
  wire [1:0] _T_132; // @[Addr_Buffer.scala 49:101:@1252.4]
  wire [1:0] _T_135; // @[Addr_Buffer.scala 49:77:@1254.4]
  wire [1:0] _T_136; // @[Addr_Buffer.scala 49:48:@1255.4]
  wire  _T_145; // @[Addr_Buffer.scala 50:60:@1261.4]
  wire [2:0] _T_152; // @[Addr_Buffer.scala 50:101:@1264.4]
  wire [1:0] _T_153; // @[Addr_Buffer.scala 50:101:@1265.4]
  wire [1:0] _T_156; // @[Addr_Buffer.scala 50:77:@1267.4]
  wire [1:0] _T_157; // @[Addr_Buffer.scala 50:48:@1268.4]
  wire  _T_166; // @[Addr_Buffer.scala 51:60:@1274.4]
  wire [2:0] _T_173; // @[Addr_Buffer.scala 51:101:@1277.4]
  wire [1:0] _T_174; // @[Addr_Buffer.scala 51:101:@1278.4]
  wire [1:0] _T_177; // @[Addr_Buffer.scala 51:77:@1280.4]
  wire [1:0] _T_178; // @[Addr_Buffer.scala 51:48:@1281.4]
  wire  _T_187; // @[Addr_Buffer.scala 53:59:@1287.4]
  wire [31:0] _T_194; // @[Addr_Buffer.scala 54:8:@1291.4]
  wire [31:0] _T_197; // @[Addr_Buffer.scala 53:76:@1293.4]
  wire [31:0] _T_198; // @[Addr_Buffer.scala 53:47:@1294.4]
  wire  _T_207; // @[Addr_Buffer.scala 55:59:@1300.4]
  wire [31:0] _T_214; // @[Addr_Buffer.scala 56:8:@1304.4]
  wire [31:0] _T_217; // @[Addr_Buffer.scala 55:76:@1306.4]
  wire [31:0] _T_218; // @[Addr_Buffer.scala 55:47:@1307.4]
  wire  _T_227; // @[Addr_Buffer.scala 57:59:@1313.4]
  wire [31:0] _T_234; // @[Addr_Buffer.scala 58:8:@1317.4]
  wire [31:0] _T_237; // @[Addr_Buffer.scala 57:76:@1319.4]
  wire [31:0] _T_238; // @[Addr_Buffer.scala 57:47:@1320.4]
  assign buffer__T_30_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_30_data = buffer[buffer__T_30_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `else
  assign buffer__T_30_data = buffer__T_30_addr >= 2'h3 ? _RAND_1[31:0] : buffer[buffer__T_30_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_32_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_32_data = buffer[buffer__T_32_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `else
  assign buffer__T_32_data = buffer__T_32_addr >= 2'h3 ? _RAND_2[31:0] : buffer[buffer__T_32_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_40_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_40_data = buffer[buffer__T_40_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `else
  assign buffer__T_40_data = buffer__T_40_addr >= 2'h3 ? _RAND_3[31:0] : buffer[buffer__T_40_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_42_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_42_data = buffer[buffer__T_42_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `else
  assign buffer__T_42_data = buffer__T_42_addr >= 2'h3 ? _RAND_4[31:0] : buffer[buffer__T_42_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_193_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_193_data = buffer[buffer__T_193_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `else
  assign buffer__T_193_data = buffer__T_193_addr >= 2'h3 ? _RAND_5[31:0] : buffer[buffer__T_193_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_196_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_196_data = buffer[buffer__T_196_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `else
  assign buffer__T_196_data = buffer__T_196_addr >= 2'h3 ? _RAND_6[31:0] : buffer[buffer__T_196_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_213_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_213_data = buffer[buffer__T_213_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `else
  assign buffer__T_213_data = buffer__T_213_addr >= 2'h3 ? _RAND_7[31:0] : buffer[buffer__T_213_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_216_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_216_data = buffer[buffer__T_216_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `else
  assign buffer__T_216_data = buffer__T_216_addr >= 2'h3 ? _RAND_8[31:0] : buffer[buffer__T_216_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_233_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_233_data = buffer[buffer__T_233_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `else
  assign buffer__T_233_data = buffer__T_233_addr >= 2'h3 ? _RAND_9[31:0] : buffer[buffer__T_233_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_236_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_236_data = buffer[buffer__T_236_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `else
  assign buffer__T_236_data = buffer__T_236_addr >= 2'h3 ? _RAND_10[31:0] : buffer[buffer__T_236_addr]; // @[Addr_Buffer.scala 31:19:@1180.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign buffer__T_181_data = io_flush ? 32'h0 : _T_198;
  assign buffer__T_181_addr = 2'h0;
  assign buffer__T_181_mask = 1'h1;
  assign buffer__T_181_en = 1'h1;
  assign buffer__T_201_data = io_flush ? 32'h0 : _T_218;
  assign buffer__T_201_addr = 2'h1;
  assign buffer__T_201_mask = 1'h1;
  assign buffer__T_201_en = 1'h1;
  assign buffer__T_221_data = io_flush ? 32'h0 : _T_238;
  assign buffer__T_221_addr = 2'h2;
  assign buffer__T_221_mask = 1'h1;
  assign buffer__T_221_en = 1'h1;
  assign counter__T_20_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_20_data = counter[counter__T_20_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_20_data = counter__T_20_addr >= 2'h3 ? _RAND_12[1:0] : counter[counter__T_20_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_22_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_22_data = counter[counter__T_22_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_22_data = counter__T_22_addr >= 2'h3 ? _RAND_13[1:0] : counter[counter__T_22_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_25_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_25_data = counter[counter__T_25_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_25_data = counter__T_25_addr >= 2'h3 ? _RAND_14[1:0] : counter[counter__T_25_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_27_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_27_data = counter[counter__T_27_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_27_data = counter__T_27_addr >= 2'h3 ? _RAND_15[1:0] : counter[counter__T_27_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_35_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_35_data = counter[counter__T_35_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_35_data = counter__T_35_addr >= 2'h3 ? _RAND_16[1:0] : counter[counter__T_35_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_37_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_37_data = counter[counter__T_37_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_37_data = counter__T_37_addr >= 2'h3 ? _RAND_17[1:0] : counter[counter__T_37_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_89_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_89_data = counter[counter__T_89_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_89_data = counter__T_89_addr >= 2'h3 ? _RAND_18[1:0] : counter[counter__T_89_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_100_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_100_data = counter[counter__T_100_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_100_data = counter__T_100_addr >= 2'h3 ? _RAND_19[1:0] : counter[counter__T_100_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_111_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_111_data = counter[counter__T_111_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_111_data = counter__T_111_addr >= 2'h3 ? _RAND_20[1:0] : counter[counter__T_111_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_122_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_122_data = counter[counter__T_122_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_122_data = counter__T_122_addr >= 2'h3 ? _RAND_21[1:0] : counter[counter__T_122_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_129_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_129_data = counter[counter__T_129_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_129_data = counter__T_129_addr >= 2'h3 ? _RAND_22[1:0] : counter[counter__T_129_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_134_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_134_data = counter[counter__T_134_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_134_data = counter__T_134_addr >= 2'h3 ? _RAND_23[1:0] : counter[counter__T_134_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_143_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_143_data = counter[counter__T_143_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_143_data = counter__T_143_addr >= 2'h3 ? _RAND_24[1:0] : counter[counter__T_143_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_150_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_150_data = counter[counter__T_150_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_150_data = counter__T_150_addr >= 2'h3 ? _RAND_25[1:0] : counter[counter__T_150_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_155_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_155_data = counter[counter__T_155_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_155_data = counter__T_155_addr >= 2'h3 ? _RAND_26[1:0] : counter[counter__T_155_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_164_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_164_data = counter[counter__T_164_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_164_data = counter__T_164_addr >= 2'h3 ? _RAND_27[1:0] : counter[counter__T_164_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_171_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_171_data = counter[counter__T_171_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_171_data = counter__T_171_addr >= 2'h3 ? _RAND_28[1:0] : counter[counter__T_171_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_176_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_176_data = counter[counter__T_176_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_176_data = counter__T_176_addr >= 2'h3 ? _RAND_29[1:0] : counter[counter__T_176_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_185_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_185_data = counter[counter__T_185_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_185_data = counter__T_185_addr >= 2'h3 ? _RAND_30[1:0] : counter[counter__T_185_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_205_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_205_data = counter[counter__T_205_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_205_data = counter__T_205_addr >= 2'h3 ? _RAND_31[1:0] : counter[counter__T_205_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_225_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_225_data = counter[counter__T_225_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `else
  assign counter__T_225_data = counter__T_225_addr >= 2'h3 ? _RAND_32[1:0] : counter[counter__T_225_addr]; // @[Addr_Buffer.scala 32:20:@1181.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign counter__T_118_data = io_flush ? 2'h0 : _T_136;
  assign counter__T_118_addr = 2'h0;
  assign counter__T_118_mask = 1'h1;
  assign counter__T_118_en = 1'h1;
  assign counter__T_139_data = io_flush ? 2'h0 : _T_157;
  assign counter__T_139_addr = 2'h1;
  assign counter__T_139_mask = 1'h1;
  assign counter__T_139_en = 1'h1;
  assign counter__T_160_data = io_flush ? 2'h0 : _T_178;
  assign counter__T_160_addr = 2'h2;
  assign counter__T_160_mask = 1'h1;
  assign counter__T_160_en = 1'h1;
  assign is_used__T_46_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_46_data = is_used[is_used__T_46_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_46_data = is_used__T_46_addr >= 2'h3 ? _RAND_34[0:0] : is_used[is_used__T_46_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_53_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_53_data = is_used[is_used__T_53_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_53_data = is_used__T_53_addr >= 2'h3 ? _RAND_35[0:0] : is_used[is_used__T_53_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_62_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_62_data = is_used[is_used__T_62_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_62_data = is_used__T_62_addr >= 2'h3 ? _RAND_36[0:0] : is_used[is_used__T_62_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_65_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_65_data = is_used[is_used__T_65_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_65_data = is_used__T_65_addr >= 2'h3 ? _RAND_37[0:0] : is_used[is_used__T_65_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_71_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_71_data = is_used[is_used__T_71_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_71_data = is_used__T_71_addr >= 2'h3 ? _RAND_38[0:0] : is_used[is_used__T_71_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_74_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_74_data = is_used[is_used__T_74_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_74_data = is_used__T_74_addr >= 2'h3 ? _RAND_39[0:0] : is_used[is_used__T_74_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_80_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_80_data = is_used[is_used__T_80_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_80_data = is_used__T_80_addr >= 2'h3 ? _RAND_40[0:0] : is_used[is_used__T_80_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_83_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_83_data = is_used[is_used__T_83_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_83_data = is_used__T_83_addr >= 2'h3 ? _RAND_41[0:0] : is_used[is_used__T_83_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_127_addr = 2'h0;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_127_data = is_used[is_used__T_127_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_127_data = is_used__T_127_addr >= 2'h3 ? _RAND_42[0:0] : is_used[is_used__T_127_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_148_addr = 2'h1;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_148_data = is_used[is_used__T_148_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_148_data = is_used__T_148_addr >= 2'h3 ? _RAND_43[0:0] : is_used[is_used__T_148_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_169_addr = 2'h2;
  `ifndef RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_169_data = is_used[is_used__T_169_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `else
  assign is_used__T_169_data = is_used__T_169_addr >= 2'h3 ? _RAND_44[0:0] : is_used[is_used__T_169_addr]; // @[Addr_Buffer.scala 33:20:@1182.4]
  `endif // RANDOMIZE_GARBAGE_ASSIGN
  assign is_used__T_85_data = io_flush ? 1'h0 : _T_93;
  assign is_used__T_85_addr = 2'h0;
  assign is_used__T_85_mask = 1'h1;
  assign is_used__T_85_en = 1'h1;
  assign is_used__T_96_data = io_flush ? 1'h0 : _T_104;
  assign is_used__T_96_addr = 2'h1;
  assign is_used__T_96_mask = 1'h1;
  assign is_used__T_96_en = 1'h1;
  assign is_used__T_107_data = io_flush ? 1'h0 : _T_115;
  assign is_used__T_107_addr = 2'h2;
  assign is_used__T_107_mask = 1'h1;
  assign is_used__T_107_en = 1'h1;
  assign _T_23 = counter__T_20_data > counter__T_22_data; // @[Addr_Buffer.scala 35:30:@1185.4]
  assign _T_28 = counter__T_25_data > counter__T_27_data; // @[Addr_Buffer.scala 36:20:@1188.4]
  assign _T_33 = _T_28 ? buffer__T_30_data : buffer__T_32_data; // @[Addr_Buffer.scala 36:8:@1191.4]
  assign _T_38 = counter__T_35_data > counter__T_37_data; // @[Addr_Buffer.scala 37:20:@1194.4]
  assign _T_43 = _T_38 ? buffer__T_40_data : buffer__T_42_data; // @[Addr_Buffer.scala 37:8:@1197.4]
  assign _T_48 = is_used__T_46_data == 1'h0; // @[Addr_Buffer.scala 39:36:@1201.4]
  assign _T_55 = is_used__T_53_data == 1'h0; // @[Addr_Buffer.scala 39:69:@1203.4]
  assign _T_56 = _T_55 ? 2'h1 : 2'h2; // @[Addr_Buffer.scala 39:57:@1204.4]
  assign write_index = _T_48 ? 2'h0 : _T_56; // @[Addr_Buffer.scala 39:24:@1205.4]
  assign _T_59 = write_index == 2'h0; // @[Addr_Buffer.scala 41:61:@1207.4]
  assign _T_63 = _T_59 ? 1'h1 : is_used__T_62_data; // @[Addr_Buffer.scala 41:48:@1209.4]
  assign temp_used_0 = io_record ? _T_63 : is_used__T_65_data; // @[Addr_Buffer.scala 41:24:@1211.4]
  assign _T_68 = write_index == 2'h1; // @[Addr_Buffer.scala 42:61:@1213.4]
  assign _T_72 = _T_68 ? 1'h1 : is_used__T_71_data; // @[Addr_Buffer.scala 42:48:@1215.4]
  assign temp_used_1 = io_record ? _T_72 : is_used__T_74_data; // @[Addr_Buffer.scala 42:24:@1217.4]
  assign _T_77 = write_index == 2'h2; // @[Addr_Buffer.scala 43:61:@1219.4]
  assign _T_81 = _T_77 ? 1'h1 : is_used__T_80_data; // @[Addr_Buffer.scala 43:48:@1221.4]
  assign temp_used_2 = io_record ? _T_81 : is_used__T_83_data; // @[Addr_Buffer.scala 43:24:@1223.4]
  assign _T_91 = counter__T_89_data == 2'h2; // @[Addr_Buffer.scala 45:64:@1227.4]
  assign _T_93 = _T_91 ? 1'h0 : temp_used_0; // @[Addr_Buffer.scala 45:52:@1228.4]
  assign _T_102 = counter__T_100_data == 2'h2; // @[Addr_Buffer.scala 46:64:@1234.4]
  assign _T_104 = _T_102 ? 1'h0 : temp_used_1; // @[Addr_Buffer.scala 46:52:@1235.4]
  assign _T_113 = counter__T_111_data == 2'h2; // @[Addr_Buffer.scala 47:64:@1241.4]
  assign _T_115 = _T_113 ? 1'h0 : temp_used_2; // @[Addr_Buffer.scala 47:52:@1242.4]
  assign _T_124 = counter__T_122_data == 2'h2; // @[Addr_Buffer.scala 49:60:@1248.4]
  assign _T_131 = counter__T_129_data + 2'h1; // @[Addr_Buffer.scala 49:101:@1251.4]
  assign _T_132 = counter__T_129_data + 2'h1; // @[Addr_Buffer.scala 49:101:@1252.4]
  assign _T_135 = is_used__T_127_data ? _T_132 : counter__T_134_data; // @[Addr_Buffer.scala 49:77:@1254.4]
  assign _T_136 = _T_124 ? 2'h0 : _T_135; // @[Addr_Buffer.scala 49:48:@1255.4]
  assign _T_145 = counter__T_143_data == 2'h2; // @[Addr_Buffer.scala 50:60:@1261.4]
  assign _T_152 = counter__T_150_data + 2'h1; // @[Addr_Buffer.scala 50:101:@1264.4]
  assign _T_153 = counter__T_150_data + 2'h1; // @[Addr_Buffer.scala 50:101:@1265.4]
  assign _T_156 = is_used__T_148_data ? _T_153 : counter__T_155_data; // @[Addr_Buffer.scala 50:77:@1267.4]
  assign _T_157 = _T_145 ? 2'h0 : _T_156; // @[Addr_Buffer.scala 50:48:@1268.4]
  assign _T_166 = counter__T_164_data == 2'h2; // @[Addr_Buffer.scala 51:60:@1274.4]
  assign _T_173 = counter__T_171_data + 2'h1; // @[Addr_Buffer.scala 51:101:@1277.4]
  assign _T_174 = counter__T_171_data + 2'h1; // @[Addr_Buffer.scala 51:101:@1278.4]
  assign _T_177 = is_used__T_169_data ? _T_174 : counter__T_176_data; // @[Addr_Buffer.scala 51:77:@1280.4]
  assign _T_178 = _T_166 ? 2'h0 : _T_177; // @[Addr_Buffer.scala 51:48:@1281.4]
  assign _T_187 = counter__T_185_data == 2'h2; // @[Addr_Buffer.scala 53:59:@1287.4]
  assign _T_194 = _T_59 ? io_addr_input : buffer__T_193_data; // @[Addr_Buffer.scala 54:8:@1291.4]
  assign _T_197 = io_record ? _T_194 : buffer__T_196_data; // @[Addr_Buffer.scala 53:76:@1293.4]
  assign _T_198 = _T_187 ? 32'h0 : _T_197; // @[Addr_Buffer.scala 53:47:@1294.4]
  assign _T_207 = counter__T_205_data == 2'h2; // @[Addr_Buffer.scala 55:59:@1300.4]
  assign _T_214 = _T_68 ? io_addr_input : buffer__T_213_data; // @[Addr_Buffer.scala 56:8:@1304.4]
  assign _T_217 = io_record ? _T_214 : buffer__T_216_data; // @[Addr_Buffer.scala 55:76:@1306.4]
  assign _T_218 = _T_207 ? 32'h0 : _T_217; // @[Addr_Buffer.scala 55:47:@1307.4]
  assign _T_227 = counter__T_225_data == 2'h2; // @[Addr_Buffer.scala 57:59:@1313.4]
  assign _T_234 = _T_77 ? io_addr_input : buffer__T_233_data; // @[Addr_Buffer.scala 58:8:@1317.4]
  assign _T_237 = io_record ? _T_234 : buffer__T_236_data; // @[Addr_Buffer.scala 57:76:@1319.4]
  assign _T_238 = _T_227 ? 32'h0 : _T_237; // @[Addr_Buffer.scala 57:47:@1320.4]
  assign io_front = _T_23 ? _T_33 : _T_43; // @[Addr_Buffer.scala 35:12:@1199.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  _RAND_0 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    buffer[initvar] = _RAND_0[31:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_1 = {1{`RANDOM}};
  _RAND_2 = {1{`RANDOM}};
  _RAND_3 = {1{`RANDOM}};
  _RAND_4 = {1{`RANDOM}};
  _RAND_5 = {1{`RANDOM}};
  _RAND_6 = {1{`RANDOM}};
  _RAND_7 = {1{`RANDOM}};
  _RAND_8 = {1{`RANDOM}};
  _RAND_9 = {1{`RANDOM}};
  _RAND_10 = {1{`RANDOM}};
  _RAND_11 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    counter[initvar] = _RAND_11[1:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_12 = {1{`RANDOM}};
  _RAND_13 = {1{`RANDOM}};
  _RAND_14 = {1{`RANDOM}};
  _RAND_15 = {1{`RANDOM}};
  _RAND_16 = {1{`RANDOM}};
  _RAND_17 = {1{`RANDOM}};
  _RAND_18 = {1{`RANDOM}};
  _RAND_19 = {1{`RANDOM}};
  _RAND_20 = {1{`RANDOM}};
  _RAND_21 = {1{`RANDOM}};
  _RAND_22 = {1{`RANDOM}};
  _RAND_23 = {1{`RANDOM}};
  _RAND_24 = {1{`RANDOM}};
  _RAND_25 = {1{`RANDOM}};
  _RAND_26 = {1{`RANDOM}};
  _RAND_27 = {1{`RANDOM}};
  _RAND_28 = {1{`RANDOM}};
  _RAND_29 = {1{`RANDOM}};
  _RAND_30 = {1{`RANDOM}};
  _RAND_31 = {1{`RANDOM}};
  _RAND_32 = {1{`RANDOM}};
  _RAND_33 = {1{`RANDOM}};
  `ifdef RANDOMIZE_MEM_INIT
  for (initvar = 0; initvar < 3; initvar = initvar+1)
    is_used[initvar] = _RAND_33[0:0];
  `endif // RANDOMIZE_MEM_INIT
  _RAND_34 = {1{`RANDOM}};
  _RAND_35 = {1{`RANDOM}};
  _RAND_36 = {1{`RANDOM}};
  _RAND_37 = {1{`RANDOM}};
  _RAND_38 = {1{`RANDOM}};
  _RAND_39 = {1{`RANDOM}};
  _RAND_40 = {1{`RANDOM}};
  _RAND_41 = {1{`RANDOM}};
  _RAND_42 = {1{`RANDOM}};
  _RAND_43 = {1{`RANDOM}};
  _RAND_44 = {1{`RANDOM}};
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if(buffer__T_181_en & buffer__T_181_mask) begin
      buffer[buffer__T_181_addr] <= buffer__T_181_data; // @[Addr_Buffer.scala 31:19:@1180.4]
    end
    if(buffer__T_201_en & buffer__T_201_mask) begin
      buffer[buffer__T_201_addr] <= buffer__T_201_data; // @[Addr_Buffer.scala 31:19:@1180.4]
    end
    if(buffer__T_221_en & buffer__T_221_mask) begin
      buffer[buffer__T_221_addr] <= buffer__T_221_data; // @[Addr_Buffer.scala 31:19:@1180.4]
    end
    if(counter__T_118_en & counter__T_118_mask) begin
      counter[counter__T_118_addr] <= counter__T_118_data; // @[Addr_Buffer.scala 32:20:@1181.4]
    end
    if(counter__T_139_en & counter__T_139_mask) begin
      counter[counter__T_139_addr] <= counter__T_139_data; // @[Addr_Buffer.scala 32:20:@1181.4]
    end
    if(counter__T_160_en & counter__T_160_mask) begin
      counter[counter__T_160_addr] <= counter__T_160_data; // @[Addr_Buffer.scala 32:20:@1181.4]
    end
    if(is_used__T_85_en & is_used__T_85_mask) begin
      is_used[is_used__T_85_addr] <= is_used__T_85_data; // @[Addr_Buffer.scala 33:20:@1182.4]
    end
    if(is_used__T_96_en & is_used__T_96_mask) begin
      is_used[is_used__T_96_addr] <= is_used__T_96_data; // @[Addr_Buffer.scala 33:20:@1182.4]
    end
    if(is_used__T_107_en & is_used__T_107_mask) begin
      is_used[is_used__T_107_addr] <= is_used__T_107_data; // @[Addr_Buffer.scala 33:20:@1182.4]
    end
  end
endmodule
module Branch_Predict( // @[:@1324.2]
  input         clock, // @[:@1325.4]
  input         reset, // @[:@1326.4]
  input  [31:0] io_inst, // @[:@1327.4]
  input  [31:0] io_branch_addr, // @[:@1327.4]
  input         io_PC_Src, // @[:@1327.4]
  input  [31:0] io_pc, // @[:@1327.4]
  input         io_ex_Branch, // @[:@1327.4]
  input         io_ex_Jump_Type, // @[:@1327.4]
  output [1:0]  io_PC_Sel, // @[:@1327.4]
  output [31:0] io_new_addr, // @[:@1327.4]
  output [31:0] io_pc_recover, // @[:@1327.4]
  output        io_IF_ID_Flush, // @[:@1327.4]
  output        io_ID_EX_Flush // @[:@1327.4]
);
  wire  addr_buffer_clock; // @[Branch_Predict.scala 55:27:@1329.4]
  wire [31:0] addr_buffer_io_addr_input; // @[Branch_Predict.scala 55:27:@1329.4]
  wire  addr_buffer_io_flush; // @[Branch_Predict.scala 55:27:@1329.4]
  wire  addr_buffer_io_record; // @[Branch_Predict.scala 55:27:@1329.4]
  wire [31:0] addr_buffer_io_front; // @[Branch_Predict.scala 55:27:@1329.4]
  wire [31:0] _T_29; // @[Lookup.scala 9:38:@1332.4]
  wire  _T_30; // @[Lookup.scala 9:38:@1333.4]
  wire  _T_34; // @[Lookup.scala 9:38:@1335.4]
  wire  _T_38; // @[Lookup.scala 9:38:@1337.4]
  wire  _T_42; // @[Lookup.scala 9:38:@1339.4]
  wire  _T_46; // @[Lookup.scala 9:38:@1341.4]
  wire [31:0] _T_49; // @[Lookup.scala 9:38:@1342.4]
  wire  _T_50; // @[Lookup.scala 9:38:@1343.4]
  wire  _T_54; // @[Lookup.scala 9:38:@1345.4]
  wire  _T_58; // @[Lookup.scala 9:38:@1347.4]
  wire  _T_62; // @[Lookup.scala 9:38:@1349.4]
  wire  _T_66; // @[Lookup.scala 9:38:@1351.4]
  wire  _T_70; // @[Lookup.scala 9:38:@1353.4]
  wire  _T_74; // @[Lookup.scala 9:38:@1355.4]
  wire  _T_78; // @[Lookup.scala 9:38:@1357.4]
  wire  _T_82; // @[Lookup.scala 9:38:@1359.4]
  wire  _T_86; // @[Lookup.scala 9:38:@1361.4]
  wire  _T_90; // @[Lookup.scala 9:38:@1363.4]
  wire  _T_94; // @[Lookup.scala 9:38:@1365.4]
  wire  _T_98; // @[Lookup.scala 9:38:@1367.4]
  wire  _T_102; // @[Lookup.scala 9:38:@1369.4]
  wire  _T_106; // @[Lookup.scala 9:38:@1371.4]
  wire  _T_110; // @[Lookup.scala 9:38:@1373.4]
  wire  _T_114; // @[Lookup.scala 9:38:@1375.4]
  wire  _T_118; // @[Lookup.scala 9:38:@1377.4]
  wire  _T_122; // @[Lookup.scala 9:38:@1379.4]
  wire  _T_126; // @[Lookup.scala 9:38:@1381.4]
  wire  _T_130; // @[Lookup.scala 9:38:@1383.4]
  wire  _T_134; // @[Lookup.scala 9:38:@1385.4]
  wire  _T_138; // @[Lookup.scala 9:38:@1387.4]
  wire  _T_142; // @[Lookup.scala 9:38:@1389.4]
  wire  _T_146; // @[Lookup.scala 9:38:@1391.4]
  wire  _T_150; // @[Lookup.scala 9:38:@1393.4]
  wire  _T_154; // @[Lookup.scala 9:38:@1395.4]
  wire  _T_158; // @[Lookup.scala 9:38:@1397.4]
  wire [31:0] _T_161; // @[Lookup.scala 9:38:@1398.4]
  wire  _T_162; // @[Lookup.scala 9:38:@1399.4]
  wire  _T_166; // @[Lookup.scala 9:38:@1401.4]
  wire  _T_331; // @[Lookup.scala 11:37:@1564.4]
  wire  _T_332; // @[Lookup.scala 11:37:@1565.4]
  wire  _T_333; // @[Lookup.scala 11:37:@1566.4]
  wire  _T_334; // @[Lookup.scala 11:37:@1567.4]
  wire  _T_335; // @[Lookup.scala 11:37:@1568.4]
  wire  _T_336; // @[Lookup.scala 11:37:@1569.4]
  wire  _T_337; // @[Lookup.scala 11:37:@1570.4]
  wire  _T_338; // @[Lookup.scala 11:37:@1571.4]
  wire  _T_339; // @[Lookup.scala 11:37:@1572.4]
  wire  _T_340; // @[Lookup.scala 11:37:@1573.4]
  wire  _T_341; // @[Lookup.scala 11:37:@1574.4]
  wire  _T_342; // @[Lookup.scala 11:37:@1575.4]
  wire  _T_343; // @[Lookup.scala 11:37:@1576.4]
  wire  _T_344; // @[Lookup.scala 11:37:@1577.4]
  wire  _T_345; // @[Lookup.scala 11:37:@1578.4]
  wire  _T_346; // @[Lookup.scala 11:37:@1579.4]
  wire  _T_347; // @[Lookup.scala 11:37:@1580.4]
  wire  _T_348; // @[Lookup.scala 11:37:@1581.4]
  wire  _T_349; // @[Lookup.scala 11:37:@1582.4]
  wire  _T_350; // @[Lookup.scala 11:37:@1583.4]
  wire  _T_351; // @[Lookup.scala 11:37:@1584.4]
  wire  _T_352; // @[Lookup.scala 11:37:@1585.4]
  wire  _T_353; // @[Lookup.scala 11:37:@1586.4]
  wire  _T_354; // @[Lookup.scala 11:37:@1587.4]
  wire  _T_355; // @[Lookup.scala 11:37:@1588.4]
  wire  _T_356; // @[Lookup.scala 11:37:@1589.4]
  wire  _T_357; // @[Lookup.scala 11:37:@1590.4]
  wire  _T_358; // @[Lookup.scala 11:37:@1591.4]
  wire  _T_359; // @[Lookup.scala 11:37:@1592.4]
  wire  _T_360; // @[Lookup.scala 11:37:@1593.4]
  wire  _T_361; // @[Lookup.scala 11:37:@1594.4]
  wire  _T_362; // @[Lookup.scala 11:37:@1595.4]
  wire  _T_363; // @[Lookup.scala 11:37:@1596.4]
  wire  current_inst_ctrl_4; // @[Lookup.scala 11:37:@1597.4]
  wire  _T_591; // @[Lookup.scala 11:37:@1831.4]
  wire  _T_592; // @[Lookup.scala 11:37:@1832.4]
  wire  _T_593; // @[Lookup.scala 11:37:@1833.4]
  wire  _T_594; // @[Lookup.scala 11:37:@1834.4]
  wire  _T_595; // @[Lookup.scala 11:37:@1835.4]
  wire  _T_596; // @[Lookup.scala 11:37:@1836.4]
  wire  _T_597; // @[Lookup.scala 11:37:@1837.4]
  wire  _T_598; // @[Lookup.scala 11:37:@1838.4]
  wire  _T_599; // @[Lookup.scala 11:37:@1839.4]
  wire  _T_600; // @[Lookup.scala 11:37:@1840.4]
  wire  _T_601; // @[Lookup.scala 11:37:@1841.4]
  wire  _T_602; // @[Lookup.scala 11:37:@1842.4]
  wire  _T_603; // @[Lookup.scala 11:37:@1843.4]
  wire  _T_604; // @[Lookup.scala 11:37:@1844.4]
  wire  _T_605; // @[Lookup.scala 11:37:@1845.4]
  wire  _T_606; // @[Lookup.scala 11:37:@1846.4]
  wire  _T_607; // @[Lookup.scala 11:37:@1847.4]
  wire  _T_608; // @[Lookup.scala 11:37:@1848.4]
  wire  _T_609; // @[Lookup.scala 11:37:@1849.4]
  wire  _T_610; // @[Lookup.scala 11:37:@1850.4]
  wire  _T_611; // @[Lookup.scala 11:37:@1851.4]
  wire  _T_612; // @[Lookup.scala 11:37:@1852.4]
  wire  _T_613; // @[Lookup.scala 11:37:@1853.4]
  wire  _T_614; // @[Lookup.scala 11:37:@1854.4]
  wire  _T_615; // @[Lookup.scala 11:37:@1855.4]
  wire  _T_616; // @[Lookup.scala 11:37:@1856.4]
  wire  _T_617; // @[Lookup.scala 11:37:@1857.4]
  wire  _T_618; // @[Lookup.scala 11:37:@1858.4]
  wire  _T_619; // @[Lookup.scala 11:37:@1859.4]
  wire  _T_620; // @[Lookup.scala 11:37:@1860.4]
  wire  _T_621; // @[Lookup.scala 11:37:@1861.4]
  wire  _T_622; // @[Lookup.scala 11:37:@1862.4]
  wire  current_inst_ctrl_11; // @[Lookup.scala 11:37:@1863.4]
  reg [1:0] dynamic_counter_status; // @[Branch_Predict.scala 59:39:@1864.4]
  reg [31:0] _RAND_0;
  wire [32:0] _T_626; // @[Branch_Predict.scala 60:20:@1865.4]
  wire  _T_630; // @[Branch_Predict.scala 65:89:@1871.4]
  wire  is_conditional_jump; // @[Branch_Predict.scala 65:63:@1872.4]
  wire  noncon_addr_is_resolved; // @[Branch_Predict.scala 66:55:@1875.4]
  wire  _T_634; // @[Branch_Predict.scala 67:75:@1877.4]
  wire  con_addr_is_resolved; // @[Branch_Predict.scala 67:55:@1878.4]
  wire  _T_635; // @[Branch_Predict.scala 69:81:@1879.4]
  wire  _T_636; // @[Branch_Predict.scala 69:125:@1880.4]
  wire  _T_637; // @[Branch_Predict.scala 69:99:@1881.4]
  wire [1:0] noncon_PC_Sel; // @[Branch_Predict.scala 75:27:@1886.4]
  wire  _T_640; // @[Mux.scala 46:19:@1888.4]
  wire [1:0] _T_641; // @[Mux.scala 46:16:@1889.4]
  wire  _T_642; // @[Mux.scala 46:19:@1890.4]
  wire [1:0] _T_643; // @[Mux.scala 46:16:@1891.4]
  wire  _T_644; // @[Mux.scala 46:19:@1892.4]
  wire [1:0] _T_645; // @[Mux.scala 46:16:@1893.4]
  wire  _T_646; // @[Mux.scala 46:19:@1894.4]
  wire [1:0] _T_647; // @[Mux.scala 46:16:@1895.4]
  wire [1:0] _T_649; // @[Mux.scala 46:16:@1897.4]
  wire [1:0] _T_651; // @[Mux.scala 46:16:@1899.4]
  wire [1:0] _T_653; // @[Mux.scala 46:16:@1901.4]
  wire [1:0] _T_655; // @[Mux.scala 46:16:@1903.4]
  wire [1:0] _T_656; // @[Branch_Predict.scala 79:8:@1904.4]
  wire [1:0] update_status; // @[Branch_Predict.scala 78:26:@1905.4]
  wire  _T_657; // @[Branch_Predict.scala 93:72:@1907.4]
  wire  _T_658; // @[Branch_Predict.scala 93:104:@1908.4]
  wire  _T_659; // @[Branch_Predict.scala 93:87:@1909.4]
  wire  predict_fail; // @[Branch_Predict.scala 93:54:@1910.4]
  wire  _T_665; // @[Branch_Predict.scala 95:80:@1917.4]
  wire  _T_668; // @[Branch_Predict.scala 96:83:@1920.4]
  wire  _T_669; // @[Branch_Predict.scala 95:124:@1921.4]
  wire  need_recover_pc; // @[Branch_Predict.scala 95:46:@1922.4]
  wire [1:0] _T_671; // @[Mux.scala 46:16:@1926.4]
  wire [1:0] _T_673; // @[Mux.scala 46:16:@1928.4]
  wire [1:0] _T_675; // @[Mux.scala 46:16:@1930.4]
  wire [1:0] predict_PC_Sel; // @[Mux.scala 46:16:@1932.4]
  wire [31:0] _T_677; // @[Branch_Predict.scala 108:35:@1933.4]
  wire  _T_678; // @[Branch_Predict.scala 108:51:@1934.4]
  wire  _T_679; // @[Branch_Predict.scala 108:64:@1935.4]
  wire [5:0] _T_680; // @[Branch_Predict.scala 108:76:@1936.4]
  wire [3:0] _T_681; // @[Branch_Predict.scala 108:93:@1937.4]
  wire [12:0] _T_686; // @[Cat.scala 30:58:@1941.4]
  wire [12:0] _T_687; // @[Branch_Predict.scala 108:118:@1942.4]
  wire [31:0] _GEN_0; // @[Branch_Predict.scala 108:38:@1943.4]
  wire [32:0] _T_688; // @[Branch_Predict.scala 108:38:@1943.4]
  wire [31:0] _T_689; // @[Branch_Predict.scala 108:38:@1944.4]
  wire [31:0] _T_690; // @[Branch_Predict.scala 108:38:@1945.4]
  wire [31:0] predict_addr; // @[Branch_Predict.scala 108:128:@1946.4]
  wire [1:0] _T_691; // @[Branch_Predict.scala 111:8:@1947.4]
  wire [1:0] con_PC_Sel; // @[Branch_Predict.scala 110:23:@1948.4]
  wire  _T_692; // @[Branch_Predict.scala 116:30:@1949.4]
  wire [1:0] _T_693; // @[Branch_Predict.scala 117:10:@1950.4]
  wire [1:0] _T_694; // @[Branch_Predict.scala 116:8:@1951.4]
  wire [31:0] _T_697; // @[Branch_Predict.scala 120:8:@1954.4]
  wire [31:0] _T_698; // @[Branch_Predict.scala 119:68:@1955.4]
  Addr_Buffer addr_buffer ( // @[Branch_Predict.scala 55:27:@1329.4]
    .clock(addr_buffer_clock),
    .io_addr_input(addr_buffer_io_addr_input),
    .io_flush(addr_buffer_io_flush),
    .io_record(addr_buffer_io_record),
    .io_front(addr_buffer_io_front)
  );
  assign _T_29 = io_inst & 32'hfe00707f; // @[Lookup.scala 9:38:@1332.4]
  assign _T_30 = 32'h33 == _T_29; // @[Lookup.scala 9:38:@1333.4]
  assign _T_34 = 32'h40000033 == _T_29; // @[Lookup.scala 9:38:@1335.4]
  assign _T_38 = 32'h7033 == _T_29; // @[Lookup.scala 9:38:@1337.4]
  assign _T_42 = 32'h6033 == _T_29; // @[Lookup.scala 9:38:@1339.4]
  assign _T_46 = 32'h4033 == _T_29; // @[Lookup.scala 9:38:@1341.4]
  assign _T_49 = io_inst & 32'h707f; // @[Lookup.scala 9:38:@1342.4]
  assign _T_50 = 32'h13 == _T_49; // @[Lookup.scala 9:38:@1343.4]
  assign _T_54 = 32'h7013 == _T_49; // @[Lookup.scala 9:38:@1345.4]
  assign _T_58 = 32'h6013 == _T_49; // @[Lookup.scala 9:38:@1347.4]
  assign _T_62 = 32'h4013 == _T_49; // @[Lookup.scala 9:38:@1349.4]
  assign _T_66 = 32'h1033 == _T_29; // @[Lookup.scala 9:38:@1351.4]
  assign _T_70 = 32'h5033 == _T_29; // @[Lookup.scala 9:38:@1353.4]
  assign _T_74 = 32'h40005033 == _T_29; // @[Lookup.scala 9:38:@1355.4]
  assign _T_78 = 32'h1013 == _T_29; // @[Lookup.scala 9:38:@1357.4]
  assign _T_82 = 32'h5013 == _T_29; // @[Lookup.scala 9:38:@1359.4]
  assign _T_86 = 32'h40005013 == _T_29; // @[Lookup.scala 9:38:@1361.4]
  assign _T_90 = 32'h2033 == _T_29; // @[Lookup.scala 9:38:@1363.4]
  assign _T_94 = 32'h3033 == _T_29; // @[Lookup.scala 9:38:@1365.4]
  assign _T_98 = 32'h2013 == _T_49; // @[Lookup.scala 9:38:@1367.4]
  assign _T_102 = 32'h3013 == _T_49; // @[Lookup.scala 9:38:@1369.4]
  assign _T_106 = 32'h2003 == _T_49; // @[Lookup.scala 9:38:@1371.4]
  assign _T_110 = 32'h1003 == _T_49; // @[Lookup.scala 9:38:@1373.4]
  assign _T_114 = 32'h3 == _T_49; // @[Lookup.scala 9:38:@1375.4]
  assign _T_118 = 32'h5003 == _T_49; // @[Lookup.scala 9:38:@1377.4]
  assign _T_122 = 32'h4003 == _T_49; // @[Lookup.scala 9:38:@1379.4]
  assign _T_126 = 32'h2023 == _T_49; // @[Lookup.scala 9:38:@1381.4]
  assign _T_130 = 32'h1023 == _T_49; // @[Lookup.scala 9:38:@1383.4]
  assign _T_134 = 32'h23 == _T_49; // @[Lookup.scala 9:38:@1385.4]
  assign _T_138 = 32'h63 == _T_49; // @[Lookup.scala 9:38:@1387.4]
  assign _T_142 = 32'h1063 == _T_49; // @[Lookup.scala 9:38:@1389.4]
  assign _T_146 = 32'h4063 == _T_49; // @[Lookup.scala 9:38:@1391.4]
  assign _T_150 = 32'h5063 == _T_49; // @[Lookup.scala 9:38:@1393.4]
  assign _T_154 = 32'h6063 == _T_49; // @[Lookup.scala 9:38:@1395.4]
  assign _T_158 = 32'h7063 == _T_49; // @[Lookup.scala 9:38:@1397.4]
  assign _T_161 = io_inst & 32'h7f; // @[Lookup.scala 9:38:@1398.4]
  assign _T_162 = 32'h6f == _T_161; // @[Lookup.scala 9:38:@1399.4]
  assign _T_166 = 32'h67 == _T_49; // @[Lookup.scala 9:38:@1401.4]
  assign _T_331 = _T_162 ? 1'h1 : _T_166; // @[Lookup.scala 11:37:@1564.4]
  assign _T_332 = _T_158 ? 1'h1 : _T_331; // @[Lookup.scala 11:37:@1565.4]
  assign _T_333 = _T_154 ? 1'h1 : _T_332; // @[Lookup.scala 11:37:@1566.4]
  assign _T_334 = _T_150 ? 1'h1 : _T_333; // @[Lookup.scala 11:37:@1567.4]
  assign _T_335 = _T_146 ? 1'h1 : _T_334; // @[Lookup.scala 11:37:@1568.4]
  assign _T_336 = _T_142 ? 1'h1 : _T_335; // @[Lookup.scala 11:37:@1569.4]
  assign _T_337 = _T_138 ? 1'h1 : _T_336; // @[Lookup.scala 11:37:@1570.4]
  assign _T_338 = _T_134 ? 1'h0 : _T_337; // @[Lookup.scala 11:37:@1571.4]
  assign _T_339 = _T_130 ? 1'h0 : _T_338; // @[Lookup.scala 11:37:@1572.4]
  assign _T_340 = _T_126 ? 1'h0 : _T_339; // @[Lookup.scala 11:37:@1573.4]
  assign _T_341 = _T_122 ? 1'h0 : _T_340; // @[Lookup.scala 11:37:@1574.4]
  assign _T_342 = _T_118 ? 1'h0 : _T_341; // @[Lookup.scala 11:37:@1575.4]
  assign _T_343 = _T_114 ? 1'h0 : _T_342; // @[Lookup.scala 11:37:@1576.4]
  assign _T_344 = _T_110 ? 1'h0 : _T_343; // @[Lookup.scala 11:37:@1577.4]
  assign _T_345 = _T_106 ? 1'h0 : _T_344; // @[Lookup.scala 11:37:@1578.4]
  assign _T_346 = _T_102 ? 1'h0 : _T_345; // @[Lookup.scala 11:37:@1579.4]
  assign _T_347 = _T_98 ? 1'h0 : _T_346; // @[Lookup.scala 11:37:@1580.4]
  assign _T_348 = _T_94 ? 1'h0 : _T_347; // @[Lookup.scala 11:37:@1581.4]
  assign _T_349 = _T_90 ? 1'h0 : _T_348; // @[Lookup.scala 11:37:@1582.4]
  assign _T_350 = _T_86 ? 1'h0 : _T_349; // @[Lookup.scala 11:37:@1583.4]
  assign _T_351 = _T_82 ? 1'h0 : _T_350; // @[Lookup.scala 11:37:@1584.4]
  assign _T_352 = _T_78 ? 1'h0 : _T_351; // @[Lookup.scala 11:37:@1585.4]
  assign _T_353 = _T_74 ? 1'h0 : _T_352; // @[Lookup.scala 11:37:@1586.4]
  assign _T_354 = _T_70 ? 1'h0 : _T_353; // @[Lookup.scala 11:37:@1587.4]
  assign _T_355 = _T_66 ? 1'h0 : _T_354; // @[Lookup.scala 11:37:@1588.4]
  assign _T_356 = _T_62 ? 1'h0 : _T_355; // @[Lookup.scala 11:37:@1589.4]
  assign _T_357 = _T_58 ? 1'h0 : _T_356; // @[Lookup.scala 11:37:@1590.4]
  assign _T_358 = _T_54 ? 1'h0 : _T_357; // @[Lookup.scala 11:37:@1591.4]
  assign _T_359 = _T_50 ? 1'h0 : _T_358; // @[Lookup.scala 11:37:@1592.4]
  assign _T_360 = _T_46 ? 1'h0 : _T_359; // @[Lookup.scala 11:37:@1593.4]
  assign _T_361 = _T_42 ? 1'h0 : _T_360; // @[Lookup.scala 11:37:@1594.4]
  assign _T_362 = _T_38 ? 1'h0 : _T_361; // @[Lookup.scala 11:37:@1595.4]
  assign _T_363 = _T_34 ? 1'h0 : _T_362; // @[Lookup.scala 11:37:@1596.4]
  assign current_inst_ctrl_4 = _T_30 ? 1'h0 : _T_363; // @[Lookup.scala 11:37:@1597.4]
  assign _T_591 = _T_158 ? 1'h0 : _T_331; // @[Lookup.scala 11:37:@1831.4]
  assign _T_592 = _T_154 ? 1'h0 : _T_591; // @[Lookup.scala 11:37:@1832.4]
  assign _T_593 = _T_150 ? 1'h0 : _T_592; // @[Lookup.scala 11:37:@1833.4]
  assign _T_594 = _T_146 ? 1'h0 : _T_593; // @[Lookup.scala 11:37:@1834.4]
  assign _T_595 = _T_142 ? 1'h0 : _T_594; // @[Lookup.scala 11:37:@1835.4]
  assign _T_596 = _T_138 ? 1'h0 : _T_595; // @[Lookup.scala 11:37:@1836.4]
  assign _T_597 = _T_134 ? 1'h0 : _T_596; // @[Lookup.scala 11:37:@1837.4]
  assign _T_598 = _T_130 ? 1'h0 : _T_597; // @[Lookup.scala 11:37:@1838.4]
  assign _T_599 = _T_126 ? 1'h0 : _T_598; // @[Lookup.scala 11:37:@1839.4]
  assign _T_600 = _T_122 ? 1'h0 : _T_599; // @[Lookup.scala 11:37:@1840.4]
  assign _T_601 = _T_118 ? 1'h0 : _T_600; // @[Lookup.scala 11:37:@1841.4]
  assign _T_602 = _T_114 ? 1'h0 : _T_601; // @[Lookup.scala 11:37:@1842.4]
  assign _T_603 = _T_110 ? 1'h0 : _T_602; // @[Lookup.scala 11:37:@1843.4]
  assign _T_604 = _T_106 ? 1'h0 : _T_603; // @[Lookup.scala 11:37:@1844.4]
  assign _T_605 = _T_102 ? 1'h0 : _T_604; // @[Lookup.scala 11:37:@1845.4]
  assign _T_606 = _T_98 ? 1'h0 : _T_605; // @[Lookup.scala 11:37:@1846.4]
  assign _T_607 = _T_94 ? 1'h0 : _T_606; // @[Lookup.scala 11:37:@1847.4]
  assign _T_608 = _T_90 ? 1'h0 : _T_607; // @[Lookup.scala 11:37:@1848.4]
  assign _T_609 = _T_86 ? 1'h0 : _T_608; // @[Lookup.scala 11:37:@1849.4]
  assign _T_610 = _T_82 ? 1'h0 : _T_609; // @[Lookup.scala 11:37:@1850.4]
  assign _T_611 = _T_78 ? 1'h0 : _T_610; // @[Lookup.scala 11:37:@1851.4]
  assign _T_612 = _T_74 ? 1'h0 : _T_611; // @[Lookup.scala 11:37:@1852.4]
  assign _T_613 = _T_70 ? 1'h0 : _T_612; // @[Lookup.scala 11:37:@1853.4]
  assign _T_614 = _T_66 ? 1'h0 : _T_613; // @[Lookup.scala 11:37:@1854.4]
  assign _T_615 = _T_62 ? 1'h0 : _T_614; // @[Lookup.scala 11:37:@1855.4]
  assign _T_616 = _T_58 ? 1'h0 : _T_615; // @[Lookup.scala 11:37:@1856.4]
  assign _T_617 = _T_54 ? 1'h0 : _T_616; // @[Lookup.scala 11:37:@1857.4]
  assign _T_618 = _T_50 ? 1'h0 : _T_617; // @[Lookup.scala 11:37:@1858.4]
  assign _T_619 = _T_46 ? 1'h0 : _T_618; // @[Lookup.scala 11:37:@1859.4]
  assign _T_620 = _T_42 ? 1'h0 : _T_619; // @[Lookup.scala 11:37:@1860.4]
  assign _T_621 = _T_38 ? 1'h0 : _T_620; // @[Lookup.scala 11:37:@1861.4]
  assign _T_622 = _T_34 ? 1'h0 : _T_621; // @[Lookup.scala 11:37:@1862.4]
  assign current_inst_ctrl_11 = _T_30 ? 1'h0 : _T_622; // @[Lookup.scala 11:37:@1863.4]
  assign _T_626 = io_pc + 32'h4; // @[Branch_Predict.scala 60:20:@1865.4]
  assign _T_630 = current_inst_ctrl_11 == 1'h0; // @[Branch_Predict.scala 65:89:@1871.4]
  assign is_conditional_jump = current_inst_ctrl_4 & _T_630; // @[Branch_Predict.scala 65:63:@1872.4]
  assign noncon_addr_is_resolved = io_ex_Branch & io_ex_Jump_Type; // @[Branch_Predict.scala 66:55:@1875.4]
  assign _T_634 = io_ex_Jump_Type == 1'h0; // @[Branch_Predict.scala 67:75:@1877.4]
  assign con_addr_is_resolved = io_ex_Branch & _T_634; // @[Branch_Predict.scala 67:55:@1878.4]
  assign _T_635 = dynamic_counter_status == 2'h2; // @[Branch_Predict.scala 69:81:@1879.4]
  assign _T_636 = dynamic_counter_status == 2'h3; // @[Branch_Predict.scala 69:125:@1880.4]
  assign _T_637 = _T_635 | _T_636; // @[Branch_Predict.scala 69:99:@1881.4]
  assign noncon_PC_Sel = noncon_addr_is_resolved ? 2'h1 : 2'h0; // @[Branch_Predict.scala 75:27:@1886.4]
  assign _T_640 = 2'h2 == dynamic_counter_status; // @[Mux.scala 46:19:@1888.4]
  assign _T_641 = _T_640 ? 2'h2 : dynamic_counter_status; // @[Mux.scala 46:16:@1889.4]
  assign _T_642 = 2'h3 == dynamic_counter_status; // @[Mux.scala 46:19:@1890.4]
  assign _T_643 = _T_642 ? 2'h2 : _T_641; // @[Mux.scala 46:16:@1891.4]
  assign _T_644 = 2'h1 == dynamic_counter_status; // @[Mux.scala 46:19:@1892.4]
  assign _T_645 = _T_644 ? 2'h3 : _T_643; // @[Mux.scala 46:16:@1893.4]
  assign _T_646 = 2'h0 == dynamic_counter_status; // @[Mux.scala 46:19:@1894.4]
  assign _T_647 = _T_646 ? 2'h1 : _T_645; // @[Mux.scala 46:16:@1895.4]
  assign _T_649 = _T_640 ? 2'h3 : dynamic_counter_status; // @[Mux.scala 46:16:@1897.4]
  assign _T_651 = _T_642 ? 2'h1 : _T_649; // @[Mux.scala 46:16:@1899.4]
  assign _T_653 = _T_644 ? 2'h0 : _T_651; // @[Mux.scala 46:16:@1901.4]
  assign _T_655 = _T_646 ? 2'h0 : _T_653; // @[Mux.scala 46:16:@1903.4]
  assign _T_656 = io_PC_Src ? _T_647 : _T_655; // @[Branch_Predict.scala 79:8:@1904.4]
  assign update_status = con_addr_is_resolved ? _T_656 : dynamic_counter_status; // @[Branch_Predict.scala 78:26:@1905.4]
  assign _T_657 = update_status == 2'h3; // @[Branch_Predict.scala 93:72:@1907.4]
  assign _T_658 = update_status == 2'h1; // @[Branch_Predict.scala 93:104:@1908.4]
  assign _T_659 = _T_657 | _T_658; // @[Branch_Predict.scala 93:87:@1909.4]
  assign predict_fail = con_addr_is_resolved & _T_659; // @[Branch_Predict.scala 93:54:@1910.4]
  assign _T_665 = _T_657 & _T_635; // @[Branch_Predict.scala 95:80:@1917.4]
  assign _T_668 = _T_658 & _T_636; // @[Branch_Predict.scala 96:83:@1920.4]
  assign _T_669 = _T_665 | _T_668; // @[Branch_Predict.scala 95:124:@1921.4]
  assign need_recover_pc = predict_fail & _T_669; // @[Branch_Predict.scala 95:46:@1922.4]
  assign _T_671 = _T_640 ? 2'h1 : 2'h0; // @[Mux.scala 46:16:@1926.4]
  assign _T_673 = _T_642 ? 2'h1 : _T_671; // @[Mux.scala 46:16:@1928.4]
  assign _T_675 = _T_644 ? 2'h0 : _T_673; // @[Mux.scala 46:16:@1930.4]
  assign predict_PC_Sel = _T_646 ? 2'h0 : _T_675; // @[Mux.scala 46:16:@1932.4]
  assign _T_677 = $signed(io_pc); // @[Branch_Predict.scala 108:35:@1933.4]
  assign _T_678 = io_inst[31]; // @[Branch_Predict.scala 108:51:@1934.4]
  assign _T_679 = io_inst[7]; // @[Branch_Predict.scala 108:64:@1935.4]
  assign _T_680 = io_inst[30:25]; // @[Branch_Predict.scala 108:76:@1936.4]
  assign _T_681 = io_inst[11:8]; // @[Branch_Predict.scala 108:93:@1937.4]
  assign _T_686 = {_T_678,_T_679,_T_680,_T_681,1'h0}; // @[Cat.scala 30:58:@1941.4]
  assign _T_687 = $signed(_T_686); // @[Branch_Predict.scala 108:118:@1942.4]
  assign _GEN_0 = {{19{_T_687[12]}},_T_687}; // @[Branch_Predict.scala 108:38:@1943.4]
  assign _T_688 = $signed(_T_677) + $signed(_GEN_0); // @[Branch_Predict.scala 108:38:@1943.4]
  assign _T_689 = $signed(_T_677) + $signed(_GEN_0); // @[Branch_Predict.scala 108:38:@1944.4]
  assign _T_690 = $signed(_T_689); // @[Branch_Predict.scala 108:38:@1945.4]
  assign predict_addr = $unsigned(_T_690); // @[Branch_Predict.scala 108:128:@1946.4]
  assign _T_691 = need_recover_pc ? 2'h2 : 2'h1; // @[Branch_Predict.scala 111:8:@1947.4]
  assign con_PC_Sel = predict_fail ? _T_691 : 2'h0; // @[Branch_Predict.scala 110:23:@1948.4]
  assign _T_692 = con_addr_is_resolved & predict_fail; // @[Branch_Predict.scala 116:30:@1949.4]
  assign _T_693 = is_conditional_jump ? predict_PC_Sel : 2'h0; // @[Branch_Predict.scala 117:10:@1950.4]
  assign _T_694 = _T_692 ? con_PC_Sel : _T_693; // @[Branch_Predict.scala 116:8:@1951.4]
  assign _T_697 = is_conditional_jump ? predict_addr : 32'h0; // @[Branch_Predict.scala 120:8:@1954.4]
  assign _T_698 = con_addr_is_resolved ? io_branch_addr : _T_697; // @[Branch_Predict.scala 119:68:@1955.4]
  assign io_PC_Sel = noncon_addr_is_resolved ? noncon_PC_Sel : _T_694; // @[Branch_Predict.scala 115:13:@1953.4]
  assign io_new_addr = noncon_addr_is_resolved ? io_branch_addr : _T_698; // @[Branch_Predict.scala 119:17:@1957.4]
  assign io_pc_recover = addr_buffer_io_front; // @[Branch_Predict.scala 121:17:@1958.4]
  assign io_IF_ID_Flush = noncon_addr_is_resolved | predict_fail; // @[Branch_Predict.scala 124:18:@1960.4]
  assign io_ID_EX_Flush = noncon_addr_is_resolved | predict_fail; // @[Branch_Predict.scala 125:18:@1962.4]
  assign addr_buffer_clock = clock; // @[:@1330.4]
  assign addr_buffer_io_addr_input = io_pc + 32'h4; // @[Branch_Predict.scala 71:29:@1884.4]
  assign addr_buffer_io_flush = noncon_addr_is_resolved | predict_fail; // @[Branch_Predict.scala 100:24:@1924.4]
  assign addr_buffer_io_record = is_conditional_jump & _T_637; // @[Branch_Predict.scala 70:25:@1883.4]
`ifdef RANDOMIZE_GARBAGE_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_INVALID_ASSIGN
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_REG_INIT
`define RANDOMIZE
`endif
`ifdef RANDOMIZE_MEM_INIT
`define RANDOMIZE
`endif
`ifndef RANDOM
`define RANDOM $random
`endif
`ifdef RANDOMIZE
  integer initvar;
  initial begin
    `ifdef INIT_RANDOM
      `INIT_RANDOM
    `endif
    `ifndef VERILATOR
      #0.002 begin end
    `endif
  `ifdef RANDOMIZE_REG_INIT
  _RAND_0 = {1{`RANDOM}};
  dynamic_counter_status = _RAND_0[1:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      dynamic_counter_status <= 2'h0;
    end else begin
      if (con_addr_is_resolved) begin
        if (io_PC_Src) begin
          if (_T_646) begin
            dynamic_counter_status <= 2'h1;
          end else begin
            if (_T_644) begin
              dynamic_counter_status <= 2'h3;
            end else begin
              if (_T_642) begin
                dynamic_counter_status <= 2'h2;
              end else begin
                if (_T_640) begin
                  dynamic_counter_status <= 2'h2;
                end
              end
            end
          end
        end else begin
          if (_T_646) begin
            dynamic_counter_status <= 2'h0;
          end else begin
            if (_T_644) begin
              dynamic_counter_status <= 2'h0;
            end else begin
              if (_T_642) begin
                dynamic_counter_status <= 2'h1;
              end else begin
                if (_T_640) begin
                  dynamic_counter_status <= 2'h3;
                end
              end
            end
          end
        end
      end
    end
  end
endmodule
module Tile( // @[:@1964.2]
  input         clock, // @[:@1965.4]
  input         reset, // @[:@1966.4]
  output [31:0] io_if_pc_out, // @[:@1967.4]
  output [31:0] io_if_next_pc, // @[:@1967.4]
  output [4:0]  io_id_rs1, // @[:@1967.4]
  output [4:0]  io_id_rs2, // @[:@1967.4]
  output [31:0] io_id_rs1_out, // @[:@1967.4]
  output [31:0] io_id_rs2_out, // @[:@1967.4]
  output [31:0] io_ex_rs1_out, // @[:@1967.4]
  output [31:0] io_ex_rs2_out, // @[:@1967.4]
  output [31:0] io_ex_alu_sum, // @[:@1967.4]
  output        io_ex_alu_conflag, // @[:@1967.4]
  output [4:0]  io_ex_rd, // @[:@1967.4]
  output [4:0]  io_mem_rd, // @[:@1967.4]
  output [31:0] io_mem_alu_sum, // @[:@1967.4]
  output [31:0] io_mem_writedata, // @[:@1967.4]
  output [31:0] io_mem_dataout, // @[:@1967.4]
  output [4:0]  io_wb_rd, // @[:@1967.4]
  output [31:0] io_wb_registerwrite, // @[:@1967.4]
  output [1:0]  io_Forward_A, // @[:@1967.4]
  output [1:0]  io_Forward_B, // @[:@1967.4]
  output        io_MemWrite_Src // @[:@1967.4]
);
  wire  pc_clock; // @[Tile.scala 48:33:@1969.4]
  wire  pc_reset; // @[Tile.scala 48:33:@1969.4]
  wire [31:0] pc_io_addr_input; // @[Tile.scala 48:33:@1969.4]
  wire  pc_io_pc_write; // @[Tile.scala 48:33:@1969.4]
  wire [31:0] pc_io_pc_out; // @[Tile.scala 48:33:@1969.4]
  wire  instcache_clock; // @[Tile.scala 49:33:@1972.4]
  wire [31:0] instcache_io_addr; // @[Tile.scala 49:33:@1972.4]
  wire [31:0] instcache_io_inst; // @[Tile.scala 49:33:@1972.4]
  wire  if_id_register_clock; // @[Tile.scala 50:33:@1975.4]
  wire  if_id_register_reset; // @[Tile.scala 50:33:@1975.4]
  wire [31:0] if_id_register_io_if_pc; // @[Tile.scala 50:33:@1975.4]
  wire [31:0] if_id_register_io_if_inst; // @[Tile.scala 50:33:@1975.4]
  wire  if_id_register_io_if_id_write; // @[Tile.scala 50:33:@1975.4]
  wire  if_id_register_io_if_flush; // @[Tile.scala 50:33:@1975.4]
  wire [31:0] if_id_register_io_if_pc_4; // @[Tile.scala 50:33:@1975.4]
  wire [4:0] if_id_register_io_id_rs1; // @[Tile.scala 50:33:@1975.4]
  wire [4:0] if_id_register_io_id_rs2; // @[Tile.scala 50:33:@1975.4]
  wire [31:0] if_id_register_io_id_pc; // @[Tile.scala 50:33:@1975.4]
  wire [31:0] if_id_register_io_id_pc_4; // @[Tile.scala 50:33:@1975.4]
  wire [31:0] if_id_register_io_id_inst; // @[Tile.scala 50:33:@1975.4]
  wire  regfile_clock; // @[Tile.scala 51:33:@1978.4]
  wire [4:0] regfile_io_rs1; // @[Tile.scala 51:33:@1978.4]
  wire [4:0] regfile_io_rs2; // @[Tile.scala 51:33:@1978.4]
  wire [4:0] regfile_io_rd; // @[Tile.scala 51:33:@1978.4]
  wire [31:0] regfile_io_wdata; // @[Tile.scala 51:33:@1978.4]
  wire  regfile_io_regwrite; // @[Tile.scala 51:33:@1978.4]
  wire [31:0] regfile_io_rs1_out; // @[Tile.scala 51:33:@1978.4]
  wire [31:0] regfile_io_rs2_out; // @[Tile.scala 51:33:@1978.4]
  wire [31:0] immgen_io_inst_in; // @[Tile.scala 52:33:@1981.4]
  wire [2:0] immgen_io_imm_sel; // @[Tile.scala 52:33:@1981.4]
  wire [31:0] immgen_io_imm; // @[Tile.scala 52:33:@1981.4]
  wire [31:0] control_io_inst; // @[Tile.scala 53:33:@1984.4]
  wire  control_io_Reg_Write; // @[Tile.scala 53:33:@1984.4]
  wire [2:0] control_io_Imm_Sel; // @[Tile.scala 53:33:@1984.4]
  wire  control_io_ALU_Src; // @[Tile.scala 53:33:@1984.4]
  wire [4:0] control_io_ALUOp; // @[Tile.scala 53:33:@1984.4]
  wire  control_io_Branch; // @[Tile.scala 53:33:@1984.4]
  wire  control_io_Branch_Src; // @[Tile.scala 53:33:@1984.4]
  wire  control_io_Mem_Read; // @[Tile.scala 53:33:@1984.4]
  wire  control_io_Mem_Write; // @[Tile.scala 53:33:@1984.4]
  wire [1:0] control_io_Data_Size; // @[Tile.scala 53:33:@1984.4]
  wire  control_io_Load_Type; // @[Tile.scala 53:33:@1984.4]
  wire [2:0] control_io_Mem_to_Reg; // @[Tile.scala 53:33:@1984.4]
  wire  control_io_Jump_Type; // @[Tile.scala 53:33:@1984.4]
  wire  id_ex_register_clock; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_reset; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_id_pc; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_id_pc_4; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_id_rs1_out; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_id_rs2_out; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_id_imm; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_id_inst; // @[Tile.scala 54:33:@1987.4]
  wire [4:0] id_ex_register_io_id_rs1; // @[Tile.scala 54:33:@1987.4]
  wire [4:0] id_ex_register_io_id_rs2; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_ID_EX_Flush; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_ALU_Src; // @[Tile.scala 54:33:@1987.4]
  wire [4:0] id_ex_register_io_ALUOp; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_Branch; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_Branch_Src; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_Jump_Type; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_Mem_Read; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_Mem_Write; // @[Tile.scala 54:33:@1987.4]
  wire [1:0] id_ex_register_io_Data_Size; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_Load_Type; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_Reg_Write; // @[Tile.scala 54:33:@1987.4]
  wire [2:0] id_ex_register_io_Mem_to_Reg; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_ex_ALU_Src; // @[Tile.scala 54:33:@1987.4]
  wire [4:0] id_ex_register_io_ex_ALUOp; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_ex_Branch; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_ex_Branch_Src; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_ex_Jump_Type; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_ex_Mem_Read; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_ex_Mem_Write; // @[Tile.scala 54:33:@1987.4]
  wire [1:0] id_ex_register_io_ex_Data_Size; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_ex_Load_Type; // @[Tile.scala 54:33:@1987.4]
  wire  id_ex_register_io_ex_Reg_Write; // @[Tile.scala 54:33:@1987.4]
  wire [2:0] id_ex_register_io_ex_Mem_to_Reg; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_ex_pc; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_ex_pc_4; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_ex_rs1_out; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_ex_rs2_out; // @[Tile.scala 54:33:@1987.4]
  wire [4:0] id_ex_register_io_ex_rd; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] id_ex_register_io_ex_imm; // @[Tile.scala 54:33:@1987.4]
  wire [4:0] id_ex_register_io_ex_rs1; // @[Tile.scala 54:33:@1987.4]
  wire [4:0] id_ex_register_io_ex_rs2; // @[Tile.scala 54:33:@1987.4]
  wire [31:0] alu_io_Src_A; // @[Tile.scala 55:33:@1990.4]
  wire [31:0] alu_io_Src_B; // @[Tile.scala 55:33:@1990.4]
  wire [4:0] alu_io_ALUOp; // @[Tile.scala 55:33:@1990.4]
  wire [31:0] alu_io_Sum; // @[Tile.scala 55:33:@1990.4]
  wire  alu_io_Conflag; // @[Tile.scala 55:33:@1990.4]
  wire [31:0] datapath_io_if_datapathio_if_pc; // @[Tile.scala 56:33:@1993.4]
  wire [1:0] datapath_io_if_datapathio_PC_Sel; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_if_datapathio_new_addr; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_if_datapathio_pc_recover; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_if_datapathio_if_new_pc; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_if_datapathio_if_pc_4; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_Bubble; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_Reg_Write; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_ALU_Src; // @[Tile.scala 56:33:@1993.4]
  wire [4:0] datapath_io_id_datapathio_ALUOp; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_Branch; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_Branch_Src; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_Mem_Read; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_Mem_Write; // @[Tile.scala 56:33:@1993.4]
  wire [1:0] datapath_io_id_datapathio_Data_Size; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_Load_Type; // @[Tile.scala 56:33:@1993.4]
  wire [2:0] datapath_io_id_datapathio_Mem_to_Reg; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_Jump_Type; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_id_Reg_Write; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_id_ALU_Src; // @[Tile.scala 56:33:@1993.4]
  wire [4:0] datapath_io_id_datapathio_id_ALUOp; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_id_Branch; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_id_Branch_Src; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_id_Mem_Read; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_id_Mem_Write; // @[Tile.scala 56:33:@1993.4]
  wire [1:0] datapath_io_id_datapathio_id_Data_Size; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_id_Load_Type; // @[Tile.scala 56:33:@1993.4]
  wire [2:0] datapath_io_id_datapathio_id_Mem_to_Reg; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_id_datapathio_id_Jump_Type; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_ex_datapathio_ex_rs1_out; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_ex_datapathio_ex_rs2_out; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_ex_datapathio_ex_imm; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_ex_datapathio_ex_pc; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_ex_datapathio_ex_ALU_Src; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_ex_datapathio_ex_Branch; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_ex_datapathio_ex_alu_conflag; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_ex_datapathio_ex_Branch_Src; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_ex_datapathio_ex_Jump_Type; // @[Tile.scala 56:33:@1993.4]
  wire [1:0] datapath_io_ex_datapathio_Forward_A; // @[Tile.scala 56:33:@1993.4]
  wire [1:0] datapath_io_ex_datapathio_Forward_B; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_ex_datapathio_alu_b_src; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_ex_datapathio_ex_aui_pc; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_ex_datapathio_forward_rs2_out; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_ex_datapathio_alu_a_src; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_ex_datapathio_PC_Src; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_ex_datapathio_branch_addr; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_mem_datapathio_mem_rs2_out; // @[Tile.scala 56:33:@1993.4]
  wire  datapath_io_mem_datapathio_MemWrite_Src; // @[Tile.scala 56:33:@1993.4]
  wire [2:0] datapath_io_mem_datapathio_mem_Mem_to_Reg; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_mem_datapathio_mem_alu_sum; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_mem_datapathio_mem_pc_4; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_mem_datapathio_mem_imm; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_mem_datapathio_mem_aui_pc; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_mem_datapathio_mem_writedata; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_wb_datapathio_wb_alu_sum; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_wb_datapathio_wb_dataout; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_wb_datapathio_wb_pc_4; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_wb_datapathio_wb_imm; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_wb_datapathio_wb_aui_pc; // @[Tile.scala 56:33:@1993.4]
  wire [2:0] datapath_io_wb_datapathio_wb_Mem_to_Reg; // @[Tile.scala 56:33:@1993.4]
  wire [31:0] datapath_io_wb_datapathio_wb_reg_writedata; // @[Tile.scala 56:33:@1993.4]
  wire  ex_mem_register_clock; // @[Tile.scala 57:33:@1996.4]
  wire  ex_mem_register_reset; // @[Tile.scala 57:33:@1996.4]
  wire [31:0] ex_mem_register_io_ex_alu_sum; // @[Tile.scala 57:33:@1996.4]
  wire [31:0] ex_mem_register_io_ex_rs2_out; // @[Tile.scala 57:33:@1996.4]
  wire [4:0] ex_mem_register_io_ex_rd; // @[Tile.scala 57:33:@1996.4]
  wire [31:0] ex_mem_register_io_ex_pc_4; // @[Tile.scala 57:33:@1996.4]
  wire [31:0] ex_mem_register_io_ex_imm; // @[Tile.scala 57:33:@1996.4]
  wire [31:0] ex_mem_register_io_ex_aui_pc; // @[Tile.scala 57:33:@1996.4]
  wire [4:0] ex_mem_register_io_ex_rs2; // @[Tile.scala 57:33:@1996.4]
  wire  ex_mem_register_io_ex_Mem_Read; // @[Tile.scala 57:33:@1996.4]
  wire  ex_mem_register_io_ex_Mem_Write; // @[Tile.scala 57:33:@1996.4]
  wire [1:0] ex_mem_register_io_ex_Data_Size; // @[Tile.scala 57:33:@1996.4]
  wire  ex_mem_register_io_ex_Load_Type; // @[Tile.scala 57:33:@1996.4]
  wire  ex_mem_register_io_ex_Reg_Write; // @[Tile.scala 57:33:@1996.4]
  wire [2:0] ex_mem_register_io_ex_Mem_to_Reg; // @[Tile.scala 57:33:@1996.4]
  wire  ex_mem_register_io_mem_Mem_Read; // @[Tile.scala 57:33:@1996.4]
  wire  ex_mem_register_io_mem_Mem_Write; // @[Tile.scala 57:33:@1996.4]
  wire [1:0] ex_mem_register_io_mem_Data_Size; // @[Tile.scala 57:33:@1996.4]
  wire  ex_mem_register_io_mem_Load_Type; // @[Tile.scala 57:33:@1996.4]
  wire  ex_mem_register_io_mem_Reg_Write; // @[Tile.scala 57:33:@1996.4]
  wire [2:0] ex_mem_register_io_mem_Mem_to_Reg; // @[Tile.scala 57:33:@1996.4]
  wire [31:0] ex_mem_register_io_mem_alu_sum; // @[Tile.scala 57:33:@1996.4]
  wire [31:0] ex_mem_register_io_mem_rs2_out; // @[Tile.scala 57:33:@1996.4]
  wire [4:0] ex_mem_register_io_mem_rd; // @[Tile.scala 57:33:@1996.4]
  wire [31:0] ex_mem_register_io_mem_pc_4; // @[Tile.scala 57:33:@1996.4]
  wire [31:0] ex_mem_register_io_mem_imm; // @[Tile.scala 57:33:@1996.4]
  wire [31:0] ex_mem_register_io_mem_aui_pc; // @[Tile.scala 57:33:@1996.4]
  wire [4:0] ex_mem_register_io_mem_rs2; // @[Tile.scala 57:33:@1996.4]
  wire  datacache_clock; // @[Tile.scala 58:33:@1999.4]
  wire [31:0] datacache_io_addr; // @[Tile.scala 58:33:@1999.4]
  wire [31:0] datacache_io_write_data; // @[Tile.scala 58:33:@1999.4]
  wire  datacache_io_Mem_Read; // @[Tile.scala 58:33:@1999.4]
  wire  datacache_io_Mem_Write; // @[Tile.scala 58:33:@1999.4]
  wire [1:0] datacache_io_Data_Size; // @[Tile.scala 58:33:@1999.4]
  wire  datacache_io_Load_Type; // @[Tile.scala 58:33:@1999.4]
  wire [31:0] datacache_io_data_out; // @[Tile.scala 58:33:@1999.4]
  wire  mem_wb_register_clock; // @[Tile.scala 59:33:@2002.4]
  wire  mem_wb_register_reset; // @[Tile.scala 59:33:@2002.4]
  wire [31:0] mem_wb_register_io_mem_dataout; // @[Tile.scala 59:33:@2002.4]
  wire [31:0] mem_wb_register_io_mem_alu_sum; // @[Tile.scala 59:33:@2002.4]
  wire [4:0] mem_wb_register_io_mem_rd; // @[Tile.scala 59:33:@2002.4]
  wire [31:0] mem_wb_register_io_mem_pc_4; // @[Tile.scala 59:33:@2002.4]
  wire [31:0] mem_wb_register_io_mem_imm; // @[Tile.scala 59:33:@2002.4]
  wire [31:0] mem_wb_register_io_mem_aui_pc; // @[Tile.scala 59:33:@2002.4]
  wire [2:0] mem_wb_register_io_mem_Mem_to_Reg; // @[Tile.scala 59:33:@2002.4]
  wire  mem_wb_register_io_mem_Reg_Write; // @[Tile.scala 59:33:@2002.4]
  wire [2:0] mem_wb_register_io_wb_Mem_to_Reg; // @[Tile.scala 59:33:@2002.4]
  wire  mem_wb_register_io_wb_Reg_Write; // @[Tile.scala 59:33:@2002.4]
  wire [31:0] mem_wb_register_io_wb_dataout; // @[Tile.scala 59:33:@2002.4]
  wire [31:0] mem_wb_register_io_wb_alu_sum; // @[Tile.scala 59:33:@2002.4]
  wire [4:0] mem_wb_register_io_wb_rd; // @[Tile.scala 59:33:@2002.4]
  wire [31:0] mem_wb_register_io_wb_pc_4; // @[Tile.scala 59:33:@2002.4]
  wire [31:0] mem_wb_register_io_wb_imm; // @[Tile.scala 59:33:@2002.4]
  wire [31:0] mem_wb_register_io_wb_aui_pc; // @[Tile.scala 59:33:@2002.4]
  wire  forward_io_ex_mem_Reg_Write; // @[Tile.scala 60:33:@2005.4]
  wire [4:0] forward_io_ex_mem_rd; // @[Tile.scala 60:33:@2005.4]
  wire  forward_io_ex_mem_Mem_Write; // @[Tile.scala 60:33:@2005.4]
  wire [4:0] forward_io_ex_mem_rs2; // @[Tile.scala 60:33:@2005.4]
  wire  forward_io_mem_wb_Reg_Write; // @[Tile.scala 60:33:@2005.4]
  wire [4:0] forward_io_mem_wb_rd; // @[Tile.scala 60:33:@2005.4]
  wire [4:0] forward_io_id_ex_rs1; // @[Tile.scala 60:33:@2005.4]
  wire [4:0] forward_io_id_ex_rs2; // @[Tile.scala 60:33:@2005.4]
  wire [1:0] forward_io_Forward_A; // @[Tile.scala 60:33:@2005.4]
  wire [1:0] forward_io_Forward_B; // @[Tile.scala 60:33:@2005.4]
  wire  forward_io_MemWrite_Src; // @[Tile.scala 60:33:@2005.4]
  wire [4:0] hazard_detection_io_rs1; // @[Tile.scala 61:33:@2008.4]
  wire [4:0] hazard_detection_io_rs2; // @[Tile.scala 61:33:@2008.4]
  wire [4:0] hazard_detection_io_ex_rd; // @[Tile.scala 61:33:@2008.4]
  wire [2:0] hazard_detection_io_Imm_Sel; // @[Tile.scala 61:33:@2008.4]
  wire  hazard_detection_io_ex_Mem_Read; // @[Tile.scala 61:33:@2008.4]
  wire  hazard_detection_io_Bubble; // @[Tile.scala 61:33:@2008.4]
  wire  hazard_detection_io_IF_ID_Write; // @[Tile.scala 61:33:@2008.4]
  wire  hazard_detection_io_PC_Write; // @[Tile.scala 61:33:@2008.4]
  wire  branch_predict_clock; // @[Tile.scala 62:33:@2011.4]
  wire  branch_predict_reset; // @[Tile.scala 62:33:@2011.4]
  wire [31:0] branch_predict_io_inst; // @[Tile.scala 62:33:@2011.4]
  wire [31:0] branch_predict_io_branch_addr; // @[Tile.scala 62:33:@2011.4]
  wire  branch_predict_io_PC_Src; // @[Tile.scala 62:33:@2011.4]
  wire [31:0] branch_predict_io_pc; // @[Tile.scala 62:33:@2011.4]
  wire  branch_predict_io_ex_Branch; // @[Tile.scala 62:33:@2011.4]
  wire  branch_predict_io_ex_Jump_Type; // @[Tile.scala 62:33:@2011.4]
  wire [1:0] branch_predict_io_PC_Sel; // @[Tile.scala 62:33:@2011.4]
  wire [31:0] branch_predict_io_new_addr; // @[Tile.scala 62:33:@2011.4]
  wire [31:0] branch_predict_io_pc_recover; // @[Tile.scala 62:33:@2011.4]
  wire  branch_predict_io_IF_ID_Flush; // @[Tile.scala 62:33:@2011.4]
  wire  branch_predict_io_ID_EX_Flush; // @[Tile.scala 62:33:@2011.4]
  PC pc ( // @[Tile.scala 48:33:@1969.4]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_addr_input(pc_io_addr_input),
    .io_pc_write(pc_io_pc_write),
    .io_pc_out(pc_io_pc_out)
  );
  InstCache instcache ( // @[Tile.scala 49:33:@1972.4]
    .clock(instcache_clock),
    .io_addr(instcache_io_addr),
    .io_inst(instcache_io_inst)
  );
  IF_ID_Register if_id_register ( // @[Tile.scala 50:33:@1975.4]
    .clock(if_id_register_clock),
    .reset(if_id_register_reset),
    .io_if_pc(if_id_register_io_if_pc),
    .io_if_inst(if_id_register_io_if_inst),
    .io_if_id_write(if_id_register_io_if_id_write),
    .io_if_flush(if_id_register_io_if_flush),
    .io_if_pc_4(if_id_register_io_if_pc_4),
    .io_id_rs1(if_id_register_io_id_rs1),
    .io_id_rs2(if_id_register_io_id_rs2),
    .io_id_pc(if_id_register_io_id_pc),
    .io_id_pc_4(if_id_register_io_id_pc_4),
    .io_id_inst(if_id_register_io_id_inst)
  );
  RegFile regfile ( // @[Tile.scala 51:33:@1978.4]
    .clock(regfile_clock),
    .io_rs1(regfile_io_rs1),
    .io_rs2(regfile_io_rs2),
    .io_rd(regfile_io_rd),
    .io_wdata(regfile_io_wdata),
    .io_regwrite(regfile_io_regwrite),
    .io_rs1_out(regfile_io_rs1_out),
    .io_rs2_out(regfile_io_rs2_out)
  );
  ImmGen immgen ( // @[Tile.scala 52:33:@1981.4]
    .io_inst_in(immgen_io_inst_in),
    .io_imm_sel(immgen_io_imm_sel),
    .io_imm(immgen_io_imm)
  );
  Control control ( // @[Tile.scala 53:33:@1984.4]
    .io_inst(control_io_inst),
    .io_Reg_Write(control_io_Reg_Write),
    .io_Imm_Sel(control_io_Imm_Sel),
    .io_ALU_Src(control_io_ALU_Src),
    .io_ALUOp(control_io_ALUOp),
    .io_Branch(control_io_Branch),
    .io_Branch_Src(control_io_Branch_Src),
    .io_Mem_Read(control_io_Mem_Read),
    .io_Mem_Write(control_io_Mem_Write),
    .io_Data_Size(control_io_Data_Size),
    .io_Load_Type(control_io_Load_Type),
    .io_Mem_to_Reg(control_io_Mem_to_Reg),
    .io_Jump_Type(control_io_Jump_Type)
  );
  ID_EX_Register id_ex_register ( // @[Tile.scala 54:33:@1987.4]
    .clock(id_ex_register_clock),
    .reset(id_ex_register_reset),
    .io_id_pc(id_ex_register_io_id_pc),
    .io_id_pc_4(id_ex_register_io_id_pc_4),
    .io_id_rs1_out(id_ex_register_io_id_rs1_out),
    .io_id_rs2_out(id_ex_register_io_id_rs2_out),
    .io_id_imm(id_ex_register_io_id_imm),
    .io_id_inst(id_ex_register_io_id_inst),
    .io_id_rs1(id_ex_register_io_id_rs1),
    .io_id_rs2(id_ex_register_io_id_rs2),
    .io_ID_EX_Flush(id_ex_register_io_ID_EX_Flush),
    .io_ALU_Src(id_ex_register_io_ALU_Src),
    .io_ALUOp(id_ex_register_io_ALUOp),
    .io_Branch(id_ex_register_io_Branch),
    .io_Branch_Src(id_ex_register_io_Branch_Src),
    .io_Jump_Type(id_ex_register_io_Jump_Type),
    .io_Mem_Read(id_ex_register_io_Mem_Read),
    .io_Mem_Write(id_ex_register_io_Mem_Write),
    .io_Data_Size(id_ex_register_io_Data_Size),
    .io_Load_Type(id_ex_register_io_Load_Type),
    .io_Reg_Write(id_ex_register_io_Reg_Write),
    .io_Mem_to_Reg(id_ex_register_io_Mem_to_Reg),
    .io_ex_ALU_Src(id_ex_register_io_ex_ALU_Src),
    .io_ex_ALUOp(id_ex_register_io_ex_ALUOp),
    .io_ex_Branch(id_ex_register_io_ex_Branch),
    .io_ex_Branch_Src(id_ex_register_io_ex_Branch_Src),
    .io_ex_Jump_Type(id_ex_register_io_ex_Jump_Type),
    .io_ex_Mem_Read(id_ex_register_io_ex_Mem_Read),
    .io_ex_Mem_Write(id_ex_register_io_ex_Mem_Write),
    .io_ex_Data_Size(id_ex_register_io_ex_Data_Size),
    .io_ex_Load_Type(id_ex_register_io_ex_Load_Type),
    .io_ex_Reg_Write(id_ex_register_io_ex_Reg_Write),
    .io_ex_Mem_to_Reg(id_ex_register_io_ex_Mem_to_Reg),
    .io_ex_pc(id_ex_register_io_ex_pc),
    .io_ex_pc_4(id_ex_register_io_ex_pc_4),
    .io_ex_rs1_out(id_ex_register_io_ex_rs1_out),
    .io_ex_rs2_out(id_ex_register_io_ex_rs2_out),
    .io_ex_rd(id_ex_register_io_ex_rd),
    .io_ex_imm(id_ex_register_io_ex_imm),
    .io_ex_rs1(id_ex_register_io_ex_rs1),
    .io_ex_rs2(id_ex_register_io_ex_rs2)
  );
  ALU alu ( // @[Tile.scala 55:33:@1990.4]
    .io_Src_A(alu_io_Src_A),
    .io_Src_B(alu_io_Src_B),
    .io_ALUOp(alu_io_ALUOp),
    .io_Sum(alu_io_Sum),
    .io_Conflag(alu_io_Conflag)
  );
  Datapath datapath ( // @[Tile.scala 56:33:@1993.4]
    .io_if_datapathio_if_pc(datapath_io_if_datapathio_if_pc),
    .io_if_datapathio_PC_Sel(datapath_io_if_datapathio_PC_Sel),
    .io_if_datapathio_new_addr(datapath_io_if_datapathio_new_addr),
    .io_if_datapathio_pc_recover(datapath_io_if_datapathio_pc_recover),
    .io_if_datapathio_if_new_pc(datapath_io_if_datapathio_if_new_pc),
    .io_if_datapathio_if_pc_4(datapath_io_if_datapathio_if_pc_4),
    .io_id_datapathio_Bubble(datapath_io_id_datapathio_Bubble),
    .io_id_datapathio_Reg_Write(datapath_io_id_datapathio_Reg_Write),
    .io_id_datapathio_ALU_Src(datapath_io_id_datapathio_ALU_Src),
    .io_id_datapathio_ALUOp(datapath_io_id_datapathio_ALUOp),
    .io_id_datapathio_Branch(datapath_io_id_datapathio_Branch),
    .io_id_datapathio_Branch_Src(datapath_io_id_datapathio_Branch_Src),
    .io_id_datapathio_Mem_Read(datapath_io_id_datapathio_Mem_Read),
    .io_id_datapathio_Mem_Write(datapath_io_id_datapathio_Mem_Write),
    .io_id_datapathio_Data_Size(datapath_io_id_datapathio_Data_Size),
    .io_id_datapathio_Load_Type(datapath_io_id_datapathio_Load_Type),
    .io_id_datapathio_Mem_to_Reg(datapath_io_id_datapathio_Mem_to_Reg),
    .io_id_datapathio_Jump_Type(datapath_io_id_datapathio_Jump_Type),
    .io_id_datapathio_id_Reg_Write(datapath_io_id_datapathio_id_Reg_Write),
    .io_id_datapathio_id_ALU_Src(datapath_io_id_datapathio_id_ALU_Src),
    .io_id_datapathio_id_ALUOp(datapath_io_id_datapathio_id_ALUOp),
    .io_id_datapathio_id_Branch(datapath_io_id_datapathio_id_Branch),
    .io_id_datapathio_id_Branch_Src(datapath_io_id_datapathio_id_Branch_Src),
    .io_id_datapathio_id_Mem_Read(datapath_io_id_datapathio_id_Mem_Read),
    .io_id_datapathio_id_Mem_Write(datapath_io_id_datapathio_id_Mem_Write),
    .io_id_datapathio_id_Data_Size(datapath_io_id_datapathio_id_Data_Size),
    .io_id_datapathio_id_Load_Type(datapath_io_id_datapathio_id_Load_Type),
    .io_id_datapathio_id_Mem_to_Reg(datapath_io_id_datapathio_id_Mem_to_Reg),
    .io_id_datapathio_id_Jump_Type(datapath_io_id_datapathio_id_Jump_Type),
    .io_ex_datapathio_ex_rs1_out(datapath_io_ex_datapathio_ex_rs1_out),
    .io_ex_datapathio_ex_rs2_out(datapath_io_ex_datapathio_ex_rs2_out),
    .io_ex_datapathio_ex_imm(datapath_io_ex_datapathio_ex_imm),
    .io_ex_datapathio_ex_pc(datapath_io_ex_datapathio_ex_pc),
    .io_ex_datapathio_ex_ALU_Src(datapath_io_ex_datapathio_ex_ALU_Src),
    .io_ex_datapathio_ex_Branch(datapath_io_ex_datapathio_ex_Branch),
    .io_ex_datapathio_ex_alu_conflag(datapath_io_ex_datapathio_ex_alu_conflag),
    .io_ex_datapathio_ex_Branch_Src(datapath_io_ex_datapathio_ex_Branch_Src),
    .io_ex_datapathio_ex_Jump_Type(datapath_io_ex_datapathio_ex_Jump_Type),
    .io_ex_datapathio_Forward_A(datapath_io_ex_datapathio_Forward_A),
    .io_ex_datapathio_Forward_B(datapath_io_ex_datapathio_Forward_B),
    .io_ex_datapathio_alu_b_src(datapath_io_ex_datapathio_alu_b_src),
    .io_ex_datapathio_ex_aui_pc(datapath_io_ex_datapathio_ex_aui_pc),
    .io_ex_datapathio_forward_rs2_out(datapath_io_ex_datapathio_forward_rs2_out),
    .io_ex_datapathio_alu_a_src(datapath_io_ex_datapathio_alu_a_src),
    .io_ex_datapathio_PC_Src(datapath_io_ex_datapathio_PC_Src),
    .io_ex_datapathio_branch_addr(datapath_io_ex_datapathio_branch_addr),
    .io_mem_datapathio_mem_rs2_out(datapath_io_mem_datapathio_mem_rs2_out),
    .io_mem_datapathio_MemWrite_Src(datapath_io_mem_datapathio_MemWrite_Src),
    .io_mem_datapathio_mem_Mem_to_Reg(datapath_io_mem_datapathio_mem_Mem_to_Reg),
    .io_mem_datapathio_mem_alu_sum(datapath_io_mem_datapathio_mem_alu_sum),
    .io_mem_datapathio_mem_pc_4(datapath_io_mem_datapathio_mem_pc_4),
    .io_mem_datapathio_mem_imm(datapath_io_mem_datapathio_mem_imm),
    .io_mem_datapathio_mem_aui_pc(datapath_io_mem_datapathio_mem_aui_pc),
    .io_mem_datapathio_mem_writedata(datapath_io_mem_datapathio_mem_writedata),
    .io_wb_datapathio_wb_alu_sum(datapath_io_wb_datapathio_wb_alu_sum),
    .io_wb_datapathio_wb_dataout(datapath_io_wb_datapathio_wb_dataout),
    .io_wb_datapathio_wb_pc_4(datapath_io_wb_datapathio_wb_pc_4),
    .io_wb_datapathio_wb_imm(datapath_io_wb_datapathio_wb_imm),
    .io_wb_datapathio_wb_aui_pc(datapath_io_wb_datapathio_wb_aui_pc),
    .io_wb_datapathio_wb_Mem_to_Reg(datapath_io_wb_datapathio_wb_Mem_to_Reg),
    .io_wb_datapathio_wb_reg_writedata(datapath_io_wb_datapathio_wb_reg_writedata)
  );
  EX_MEM_Register ex_mem_register ( // @[Tile.scala 57:33:@1996.4]
    .clock(ex_mem_register_clock),
    .reset(ex_mem_register_reset),
    .io_ex_alu_sum(ex_mem_register_io_ex_alu_sum),
    .io_ex_rs2_out(ex_mem_register_io_ex_rs2_out),
    .io_ex_rd(ex_mem_register_io_ex_rd),
    .io_ex_pc_4(ex_mem_register_io_ex_pc_4),
    .io_ex_imm(ex_mem_register_io_ex_imm),
    .io_ex_aui_pc(ex_mem_register_io_ex_aui_pc),
    .io_ex_rs2(ex_mem_register_io_ex_rs2),
    .io_ex_Mem_Read(ex_mem_register_io_ex_Mem_Read),
    .io_ex_Mem_Write(ex_mem_register_io_ex_Mem_Write),
    .io_ex_Data_Size(ex_mem_register_io_ex_Data_Size),
    .io_ex_Load_Type(ex_mem_register_io_ex_Load_Type),
    .io_ex_Reg_Write(ex_mem_register_io_ex_Reg_Write),
    .io_ex_Mem_to_Reg(ex_mem_register_io_ex_Mem_to_Reg),
    .io_mem_Mem_Read(ex_mem_register_io_mem_Mem_Read),
    .io_mem_Mem_Write(ex_mem_register_io_mem_Mem_Write),
    .io_mem_Data_Size(ex_mem_register_io_mem_Data_Size),
    .io_mem_Load_Type(ex_mem_register_io_mem_Load_Type),
    .io_mem_Reg_Write(ex_mem_register_io_mem_Reg_Write),
    .io_mem_Mem_to_Reg(ex_mem_register_io_mem_Mem_to_Reg),
    .io_mem_alu_sum(ex_mem_register_io_mem_alu_sum),
    .io_mem_rs2_out(ex_mem_register_io_mem_rs2_out),
    .io_mem_rd(ex_mem_register_io_mem_rd),
    .io_mem_pc_4(ex_mem_register_io_mem_pc_4),
    .io_mem_imm(ex_mem_register_io_mem_imm),
    .io_mem_aui_pc(ex_mem_register_io_mem_aui_pc),
    .io_mem_rs2(ex_mem_register_io_mem_rs2)
  );
  DataCache datacache ( // @[Tile.scala 58:33:@1999.4]
    .clock(datacache_clock),
    .io_addr(datacache_io_addr),
    .io_write_data(datacache_io_write_data),
    .io_Mem_Read(datacache_io_Mem_Read),
    .io_Mem_Write(datacache_io_Mem_Write),
    .io_Data_Size(datacache_io_Data_Size),
    .io_Load_Type(datacache_io_Load_Type),
    .io_data_out(datacache_io_data_out)
  );
  MEM_WB_Register mem_wb_register ( // @[Tile.scala 59:33:@2002.4]
    .clock(mem_wb_register_clock),
    .reset(mem_wb_register_reset),
    .io_mem_dataout(mem_wb_register_io_mem_dataout),
    .io_mem_alu_sum(mem_wb_register_io_mem_alu_sum),
    .io_mem_rd(mem_wb_register_io_mem_rd),
    .io_mem_pc_4(mem_wb_register_io_mem_pc_4),
    .io_mem_imm(mem_wb_register_io_mem_imm),
    .io_mem_aui_pc(mem_wb_register_io_mem_aui_pc),
    .io_mem_Mem_to_Reg(mem_wb_register_io_mem_Mem_to_Reg),
    .io_mem_Reg_Write(mem_wb_register_io_mem_Reg_Write),
    .io_wb_Mem_to_Reg(mem_wb_register_io_wb_Mem_to_Reg),
    .io_wb_Reg_Write(mem_wb_register_io_wb_Reg_Write),
    .io_wb_dataout(mem_wb_register_io_wb_dataout),
    .io_wb_alu_sum(mem_wb_register_io_wb_alu_sum),
    .io_wb_rd(mem_wb_register_io_wb_rd),
    .io_wb_pc_4(mem_wb_register_io_wb_pc_4),
    .io_wb_imm(mem_wb_register_io_wb_imm),
    .io_wb_aui_pc(mem_wb_register_io_wb_aui_pc)
  );
  Forward forward ( // @[Tile.scala 60:33:@2005.4]
    .io_ex_mem_Reg_Write(forward_io_ex_mem_Reg_Write),
    .io_ex_mem_rd(forward_io_ex_mem_rd),
    .io_ex_mem_Mem_Write(forward_io_ex_mem_Mem_Write),
    .io_ex_mem_rs2(forward_io_ex_mem_rs2),
    .io_mem_wb_Reg_Write(forward_io_mem_wb_Reg_Write),
    .io_mem_wb_rd(forward_io_mem_wb_rd),
    .io_id_ex_rs1(forward_io_id_ex_rs1),
    .io_id_ex_rs2(forward_io_id_ex_rs2),
    .io_Forward_A(forward_io_Forward_A),
    .io_Forward_B(forward_io_Forward_B),
    .io_MemWrite_Src(forward_io_MemWrite_Src)
  );
  Hazard_Detection hazard_detection ( // @[Tile.scala 61:33:@2008.4]
    .io_rs1(hazard_detection_io_rs1),
    .io_rs2(hazard_detection_io_rs2),
    .io_ex_rd(hazard_detection_io_ex_rd),
    .io_Imm_Sel(hazard_detection_io_Imm_Sel),
    .io_ex_Mem_Read(hazard_detection_io_ex_Mem_Read),
    .io_Bubble(hazard_detection_io_Bubble),
    .io_IF_ID_Write(hazard_detection_io_IF_ID_Write),
    .io_PC_Write(hazard_detection_io_PC_Write)
  );
  Branch_Predict branch_predict ( // @[Tile.scala 62:33:@2011.4]
    .clock(branch_predict_clock),
    .reset(branch_predict_reset),
    .io_inst(branch_predict_io_inst),
    .io_branch_addr(branch_predict_io_branch_addr),
    .io_PC_Src(branch_predict_io_PC_Src),
    .io_pc(branch_predict_io_pc),
    .io_ex_Branch(branch_predict_io_ex_Branch),
    .io_ex_Jump_Type(branch_predict_io_ex_Jump_Type),
    .io_PC_Sel(branch_predict_io_PC_Sel),
    .io_new_addr(branch_predict_io_new_addr),
    .io_pc_recover(branch_predict_io_pc_recover),
    .io_IF_ID_Flush(branch_predict_io_IF_ID_Flush),
    .io_ID_EX_Flush(branch_predict_io_ID_EX_Flush)
  );
  assign io_if_pc_out = pc_io_pc_out; // @[Tile.scala 79:17:@2022.4]
  assign io_if_next_pc = datapath_io_if_datapathio_if_new_pc; // @[Tile.scala 80:17:@2023.4]
  assign io_id_rs1 = if_id_register_io_id_rs1; // @[Tile.scala 127:17:@2054.4]
  assign io_id_rs2 = if_id_register_io_id_rs2; // @[Tile.scala 128:17:@2055.4]
  assign io_id_rs1_out = regfile_io_rs1_out; // @[Tile.scala 129:17:@2056.4]
  assign io_id_rs2_out = regfile_io_rs2_out; // @[Tile.scala 130:17:@2057.4]
  assign io_ex_rs1_out = id_ex_register_io_ex_rs1_out; // @[Tile.scala 190:21:@2097.4]
  assign io_ex_rs2_out = id_ex_register_io_ex_rs2_out; // @[Tile.scala 191:21:@2098.4]
  assign io_ex_alu_sum = alu_io_Sum; // @[Tile.scala 192:21:@2099.4]
  assign io_ex_alu_conflag = alu_io_Conflag; // @[Tile.scala 193:21:@2100.4]
  assign io_ex_rd = id_ex_register_io_ex_rd; // @[Tile.scala 194:21:@2101.4]
  assign io_mem_rd = ex_mem_register_io_mem_rd; // @[Tile.scala 226:23:@2123.4]
  assign io_mem_alu_sum = ex_mem_register_io_mem_alu_sum; // @[Tile.scala 227:23:@2124.4]
  assign io_mem_writedata = ex_mem_register_io_mem_rs2_out; // @[Tile.scala 228:23:@2125.4]
  assign io_mem_dataout = datacache_io_data_out; // @[Tile.scala 229:23:@2126.4]
  assign io_wb_rd = mem_wb_register_io_wb_rd; // @[Tile.scala 251:23:@2141.4]
  assign io_wb_registerwrite = datapath_io_wb_datapathio_wb_reg_writedata; // @[Tile.scala 252:23:@2142.4]
  assign io_Forward_A = forward_io_Forward_A; // @[Tile.scala 274:19:@2157.4]
  assign io_Forward_B = forward_io_Forward_B; // @[Tile.scala 275:19:@2158.4]
  assign io_MemWrite_Src = forward_io_MemWrite_Src; // @[Tile.scala 276:19:@2159.4]
  assign pc_clock = clock; // @[:@1970.4]
  assign pc_reset = reset; // @[:@1971.4]
  assign pc_io_addr_input = datapath_io_if_datapathio_if_new_pc; // @[Tile.scala 72:20:@2018.4]
  assign pc_io_pc_write = hazard_detection_io_PC_Write; // @[Tile.scala 73:20:@2020.4]
  assign instcache_clock = clock; // @[:@1973.4]
  assign instcache_io_addr = pc_io_pc_out; // @[Tile.scala 76:21:@2021.4]
  assign if_id_register_clock = clock; // @[:@1976.4]
  assign if_id_register_reset = reset; // @[:@1977.4]
  assign if_id_register_io_if_pc = pc_io_pc_out; // @[Tile.scala 87:33:@2027.4]
  assign if_id_register_io_if_inst = instcache_io_inst; // @[Tile.scala 86:33:@2026.4]
  assign if_id_register_io_if_id_write = hazard_detection_io_IF_ID_Write; // @[Tile.scala 84:33:@2024.4]
  assign if_id_register_io_if_flush = branch_predict_io_IF_ID_Flush; // @[Tile.scala 85:33:@2025.4]
  assign if_id_register_io_if_pc_4 = datapath_io_if_datapathio_if_pc_4; // @[Tile.scala 88:33:@2028.4]
  assign regfile_clock = clock; // @[:@1979.4]
  assign regfile_io_rs1 = if_id_register_io_id_rs1; // @[Tile.scala 116:23:@2047.4]
  assign regfile_io_rs2 = if_id_register_io_id_rs2; // @[Tile.scala 117:23:@2048.4]
  assign regfile_io_rd = mem_wb_register_io_wb_rd; // @[Tile.scala 118:23:@2049.4]
  assign regfile_io_wdata = datapath_io_wb_datapathio_wb_reg_writedata; // @[Tile.scala 119:23:@2050.4]
  assign regfile_io_regwrite = mem_wb_register_io_wb_Reg_Write; // @[Tile.scala 120:23:@2051.4]
  assign immgen_io_inst_in = if_id_register_io_id_inst; // @[Tile.scala 123:23:@2052.4]
  assign immgen_io_imm_sel = control_io_Imm_Sel; // @[Tile.scala 124:23:@2053.4]
  assign control_io_inst = if_id_register_io_id_inst; // @[Tile.scala 92:23:@2029.4]
  assign id_ex_register_clock = clock; // @[:@1988.4]
  assign id_ex_register_reset = reset; // @[:@1989.4]
  assign id_ex_register_io_id_pc = if_id_register_io_id_pc; // @[Tile.scala 153:32:@2074.4]
  assign id_ex_register_io_id_pc_4 = if_id_register_io_id_pc_4; // @[Tile.scala 154:32:@2075.4]
  assign id_ex_register_io_id_rs1_out = regfile_io_rs1_out; // @[Tile.scala 149:32:@2070.4]
  assign id_ex_register_io_id_rs2_out = regfile_io_rs2_out; // @[Tile.scala 150:32:@2071.4]
  assign id_ex_register_io_id_imm = immgen_io_imm; // @[Tile.scala 156:32:@2077.4]
  assign id_ex_register_io_id_inst = if_id_register_io_id_inst; // @[Tile.scala 155:32:@2076.4]
  assign id_ex_register_io_id_rs1 = if_id_register_io_id_rs1; // @[Tile.scala 151:32:@2072.4]
  assign id_ex_register_io_id_rs2 = if_id_register_io_id_rs2; // @[Tile.scala 152:32:@2073.4]
  assign id_ex_register_io_ID_EX_Flush = branch_predict_io_ID_EX_Flush; // @[Tile.scala 135:33:@2058.4]
  assign id_ex_register_io_ALU_Src = datapath_io_id_datapathio_id_ALU_Src; // @[Tile.scala 136:33:@2059.4]
  assign id_ex_register_io_ALUOp = datapath_io_id_datapathio_id_ALUOp; // @[Tile.scala 137:33:@2060.4]
  assign id_ex_register_io_Branch = datapath_io_id_datapathio_id_Branch; // @[Tile.scala 138:33:@2061.4]
  assign id_ex_register_io_Branch_Src = datapath_io_id_datapathio_id_Branch_Src; // @[Tile.scala 139:33:@2062.4]
  assign id_ex_register_io_Jump_Type = datapath_io_id_datapathio_id_Jump_Type; // @[Tile.scala 140:33:@2063.4]
  assign id_ex_register_io_Mem_Read = datapath_io_id_datapathio_id_Mem_Read; // @[Tile.scala 141:33:@2064.4]
  assign id_ex_register_io_Mem_Write = datapath_io_id_datapathio_id_Mem_Write; // @[Tile.scala 142:33:@2065.4]
  assign id_ex_register_io_Data_Size = datapath_io_id_datapathio_id_Data_Size; // @[Tile.scala 143:33:@2066.4]
  assign id_ex_register_io_Load_Type = datapath_io_id_datapathio_id_Load_Type; // @[Tile.scala 144:33:@2067.4]
  assign id_ex_register_io_Reg_Write = datapath_io_id_datapathio_id_Reg_Write; // @[Tile.scala 145:33:@2068.4]
  assign id_ex_register_io_Mem_to_Reg = datapath_io_id_datapathio_id_Mem_to_Reg; // @[Tile.scala 146:33:@2069.4]
  assign alu_io_Src_A = datapath_io_ex_datapathio_alu_a_src; // @[Tile.scala 185:16:@2094.4]
  assign alu_io_Src_B = datapath_io_ex_datapathio_alu_b_src; // @[Tile.scala 186:16:@2095.4]
  assign alu_io_ALUOp = id_ex_register_io_ex_ALUOp; // @[Tile.scala 187:16:@2096.4]
  assign datapath_io_if_datapathio_if_pc = pc_io_pc_out; // @[Tile.scala 66:47:@2014.4]
  assign datapath_io_if_datapathio_PC_Sel = branch_predict_io_PC_Sel; // @[Tile.scala 68:47:@2016.4]
  assign datapath_io_if_datapathio_new_addr = branch_predict_io_new_addr; // @[Tile.scala 67:47:@2015.4]
  assign datapath_io_if_datapathio_pc_recover = branch_predict_io_pc_recover; // @[Tile.scala 69:47:@2017.4]
  assign datapath_io_id_datapathio_Bubble = hazard_detection_io_Bubble; // @[Tile.scala 102:43:@2035.4]
  assign datapath_io_id_datapathio_Reg_Write = control_io_Reg_Write; // @[Tile.scala 103:43:@2036.4]
  assign datapath_io_id_datapathio_ALU_Src = control_io_ALU_Src; // @[Tile.scala 104:43:@2037.4]
  assign datapath_io_id_datapathio_ALUOp = control_io_ALUOp; // @[Tile.scala 105:43:@2038.4]
  assign datapath_io_id_datapathio_Branch = control_io_Branch; // @[Tile.scala 106:43:@2039.4]
  assign datapath_io_id_datapathio_Branch_Src = control_io_Branch_Src; // @[Tile.scala 107:43:@2040.4]
  assign datapath_io_id_datapathio_Mem_Read = control_io_Mem_Read; // @[Tile.scala 108:43:@2041.4]
  assign datapath_io_id_datapathio_Mem_Write = control_io_Mem_Write; // @[Tile.scala 109:43:@2042.4]
  assign datapath_io_id_datapathio_Data_Size = control_io_Data_Size; // @[Tile.scala 110:43:@2043.4]
  assign datapath_io_id_datapathio_Load_Type = control_io_Load_Type; // @[Tile.scala 111:43:@2044.4]
  assign datapath_io_id_datapathio_Mem_to_Reg = control_io_Mem_to_Reg; // @[Tile.scala 112:43:@2045.4]
  assign datapath_io_id_datapathio_Jump_Type = control_io_Jump_Type; // @[Tile.scala 113:43:@2046.4]
  assign datapath_io_ex_datapathio_ex_rs1_out = id_ex_register_io_ex_rs1_out; // @[Tile.scala 162:43:@2080.4]
  assign datapath_io_ex_datapathio_ex_rs2_out = id_ex_register_io_ex_rs2_out; // @[Tile.scala 181:40:@2092.4]
  assign datapath_io_ex_datapathio_ex_imm = id_ex_register_io_ex_imm; // @[Tile.scala 161:43:@2079.4]
  assign datapath_io_ex_datapathio_ex_pc = id_ex_register_io_ex_pc; // @[Tile.scala 160:43:@2078.4]
  assign datapath_io_ex_datapathio_ex_ALU_Src = id_ex_register_io_ex_ALU_Src; // @[Tile.scala 182:40:@2093.4]
  assign datapath_io_ex_datapathio_ex_Branch = id_ex_register_io_ex_Branch; // @[Tile.scala 166:45:@2082.4]
  assign datapath_io_ex_datapathio_ex_alu_conflag = alu_io_Conflag; // @[Tile.scala 167:45:@2083.4]
  assign datapath_io_ex_datapathio_ex_Branch_Src = id_ex_register_io_ex_Branch_Src; // @[Tile.scala 163:43:@2081.4]
  assign datapath_io_ex_datapathio_ex_Jump_Type = id_ex_register_io_ex_Jump_Type; // @[Tile.scala 168:45:@2084.4]
  assign datapath_io_ex_datapathio_Forward_A = forward_io_Forward_A; // @[Tile.scala 177:45:@2090.4]
  assign datapath_io_ex_datapathio_Forward_B = forward_io_Forward_B; // @[Tile.scala 178:45:@2091.4]
  assign datapath_io_mem_datapathio_mem_rs2_out = ex_mem_register_io_mem_rs2_out; // @[Tile.scala 214:43:@2115.4]
  assign datapath_io_mem_datapathio_MemWrite_Src = forward_io_MemWrite_Src; // @[Tile.scala 215:43:@2116.4]
  assign datapath_io_mem_datapathio_mem_Mem_to_Reg = ex_mem_register_io_mem_Mem_to_Reg; // @[Tile.scala 175:45:@2089.4]
  assign datapath_io_mem_datapathio_mem_alu_sum = ex_mem_register_io_mem_alu_sum; // @[Tile.scala 171:45:@2085.4]
  assign datapath_io_mem_datapathio_mem_pc_4 = ex_mem_register_io_mem_pc_4; // @[Tile.scala 172:45:@2086.4]
  assign datapath_io_mem_datapathio_mem_imm = ex_mem_register_io_mem_imm; // @[Tile.scala 173:45:@2087.4]
  assign datapath_io_mem_datapathio_mem_aui_pc = ex_mem_register_io_mem_aui_pc; // @[Tile.scala 174:45:@2088.4]
  assign datapath_io_wb_datapathio_wb_alu_sum = mem_wb_register_io_wb_alu_sum; // @[Tile.scala 243:45:@2135.4]
  assign datapath_io_wb_datapathio_wb_dataout = mem_wb_register_io_wb_dataout; // @[Tile.scala 244:45:@2136.4]
  assign datapath_io_wb_datapathio_wb_pc_4 = mem_wb_register_io_wb_pc_4; // @[Tile.scala 245:45:@2137.4]
  assign datapath_io_wb_datapathio_wb_imm = mem_wb_register_io_wb_imm; // @[Tile.scala 246:45:@2138.4]
  assign datapath_io_wb_datapathio_wb_aui_pc = mem_wb_register_io_wb_aui_pc; // @[Tile.scala 247:45:@2139.4]
  assign datapath_io_wb_datapathio_wb_Mem_to_Reg = mem_wb_register_io_wb_Mem_to_Reg; // @[Tile.scala 248:45:@2140.4]
  assign ex_mem_register_clock = clock; // @[:@1997.4]
  assign ex_mem_register_reset = reset; // @[:@1998.4]
  assign ex_mem_register_io_ex_alu_sum = alu_io_Sum; // @[Tile.scala 198:37:@2102.4]
  assign ex_mem_register_io_ex_rs2_out = datapath_io_ex_datapathio_forward_rs2_out; // @[Tile.scala 199:37:@2103.4]
  assign ex_mem_register_io_ex_rd = id_ex_register_io_ex_rd; // @[Tile.scala 200:37:@2104.4]
  assign ex_mem_register_io_ex_pc_4 = id_ex_register_io_ex_pc_4; // @[Tile.scala 201:37:@2105.4]
  assign ex_mem_register_io_ex_imm = id_ex_register_io_ex_imm; // @[Tile.scala 202:37:@2106.4]
  assign ex_mem_register_io_ex_aui_pc = datapath_io_ex_datapathio_ex_aui_pc; // @[Tile.scala 203:37:@2107.4]
  assign ex_mem_register_io_ex_rs2 = id_ex_register_io_ex_rs2; // @[Tile.scala 204:37:@2108.4]
  assign ex_mem_register_io_ex_Mem_Read = id_ex_register_io_ex_Mem_Read; // @[Tile.scala 205:37:@2109.4]
  assign ex_mem_register_io_ex_Mem_Write = id_ex_register_io_ex_Mem_Write; // @[Tile.scala 206:37:@2110.4]
  assign ex_mem_register_io_ex_Data_Size = id_ex_register_io_ex_Data_Size; // @[Tile.scala 207:37:@2111.4]
  assign ex_mem_register_io_ex_Load_Type = id_ex_register_io_ex_Load_Type; // @[Tile.scala 208:37:@2112.4]
  assign ex_mem_register_io_ex_Reg_Write = id_ex_register_io_ex_Reg_Write; // @[Tile.scala 209:37:@2113.4]
  assign ex_mem_register_io_ex_Mem_to_Reg = id_ex_register_io_ex_Mem_to_Reg; // @[Tile.scala 210:37:@2114.4]
  assign datacache_clock = clock; // @[:@2000.4]
  assign datacache_io_addr = ex_mem_register_io_mem_alu_sum; // @[Tile.scala 218:27:@2117.4]
  assign datacache_io_write_data = datapath_io_mem_datapathio_mem_writedata; // @[Tile.scala 219:27:@2118.4]
  assign datacache_io_Mem_Read = ex_mem_register_io_mem_Mem_Read; // @[Tile.scala 220:27:@2119.4]
  assign datacache_io_Mem_Write = ex_mem_register_io_mem_Mem_Write; // @[Tile.scala 221:27:@2120.4]
  assign datacache_io_Data_Size = ex_mem_register_io_mem_Data_Size; // @[Tile.scala 222:27:@2121.4]
  assign datacache_io_Load_Type = ex_mem_register_io_mem_Load_Type; // @[Tile.scala 223:27:@2122.4]
  assign mem_wb_register_clock = clock; // @[:@2003.4]
  assign mem_wb_register_reset = reset; // @[:@2004.4]
  assign mem_wb_register_io_mem_dataout = datacache_io_data_out; // @[Tile.scala 235:39:@2129.4]
  assign mem_wb_register_io_mem_alu_sum = ex_mem_register_io_mem_alu_sum; // @[Tile.scala 236:39:@2130.4]
  assign mem_wb_register_io_mem_rd = ex_mem_register_io_mem_rd; // @[Tile.scala 237:39:@2131.4]
  assign mem_wb_register_io_mem_pc_4 = ex_mem_register_io_mem_pc_4; // @[Tile.scala 238:39:@2132.4]
  assign mem_wb_register_io_mem_imm = ex_mem_register_io_mem_imm; // @[Tile.scala 239:39:@2133.4]
  assign mem_wb_register_io_mem_aui_pc = ex_mem_register_io_mem_aui_pc; // @[Tile.scala 240:39:@2134.4]
  assign mem_wb_register_io_mem_Mem_to_Reg = ex_mem_register_io_mem_Mem_to_Reg; // @[Tile.scala 234:39:@2128.4]
  assign mem_wb_register_io_mem_Reg_Write = ex_mem_register_io_mem_Reg_Write; // @[Tile.scala 233:39:@2127.4]
  assign forward_io_ex_mem_Reg_Write = ex_mem_register_io_mem_Reg_Write; // @[Tile.scala 256:31:@2143.4]
  assign forward_io_ex_mem_rd = ex_mem_register_io_mem_rd; // @[Tile.scala 257:31:@2144.4]
  assign forward_io_ex_mem_Mem_Write = ex_mem_register_io_mem_Mem_Write; // @[Tile.scala 263:31:@2150.4]
  assign forward_io_ex_mem_rs2 = ex_mem_register_io_mem_rs2; // @[Tile.scala 262:31:@2149.4]
  assign forward_io_mem_wb_Reg_Write = mem_wb_register_io_wb_Reg_Write; // @[Tile.scala 258:31:@2145.4]
  assign forward_io_mem_wb_rd = mem_wb_register_io_wb_rd; // @[Tile.scala 259:31:@2146.4]
  assign forward_io_id_ex_rs1 = id_ex_register_io_ex_rs1; // @[Tile.scala 260:31:@2147.4]
  assign forward_io_id_ex_rs2 = id_ex_register_io_ex_rs2; // @[Tile.scala 261:31:@2148.4]
  assign hazard_detection_io_rs1 = if_id_register_io_id_rs1; // @[Tile.scala 95:35:@2030.4]
  assign hazard_detection_io_rs2 = if_id_register_io_id_rs2; // @[Tile.scala 96:35:@2031.4]
  assign hazard_detection_io_ex_rd = id_ex_register_io_ex_rd; // @[Tile.scala 97:35:@2032.4]
  assign hazard_detection_io_Imm_Sel = control_io_Imm_Sel; // @[Tile.scala 99:35:@2034.4]
  assign hazard_detection_io_ex_Mem_Read = id_ex_register_io_ex_Mem_Read; // @[Tile.scala 98:35:@2033.4]
  assign branch_predict_clock = clock; // @[:@2012.4]
  assign branch_predict_reset = reset; // @[:@2013.4]
  assign branch_predict_io_inst = instcache_io_inst; // @[Tile.scala 266:35:@2151.4]
  assign branch_predict_io_branch_addr = datapath_io_ex_datapathio_branch_addr; // @[Tile.scala 267:35:@2152.4]
  assign branch_predict_io_PC_Src = datapath_io_ex_datapathio_PC_Src; // @[Tile.scala 268:35:@2153.4]
  assign branch_predict_io_pc = pc_io_pc_out; // @[Tile.scala 269:35:@2154.4]
  assign branch_predict_io_ex_Branch = id_ex_register_io_ex_Branch; // @[Tile.scala 270:35:@2155.4]
  assign branch_predict_io_ex_Jump_Type = id_ex_register_io_ex_Jump_Type; // @[Tile.scala 271:35:@2156.4]
endmodule
