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
  reg [7:0] cache [0:127]; // @[InstCache.scala 30:18:@19.4]
  reg [31:0] _RAND_0;
  wire [7:0] cache__T_12_data; // @[InstCache.scala 30:18:@19.4]
  wire [6:0] cache__T_12_addr; // @[InstCache.scala 30:18:@19.4]
  wire [7:0] cache__T_17_data; // @[InstCache.scala 30:18:@19.4]
  wire [6:0] cache__T_17_addr; // @[InstCache.scala 30:18:@19.4]
  wire [7:0] cache__T_22_data; // @[InstCache.scala 30:18:@19.4]
  wire [6:0] cache__T_22_addr; // @[InstCache.scala 30:18:@19.4]
  wire [7:0] cache__T_27_data; // @[InstCache.scala 30:18:@19.4]
  wire [6:0] cache__T_27_addr; // @[InstCache.scala 30:18:@19.4]
  wire [32:0] _T_14; // @[InstCache.scala 56:48:@22.4]
  wire [31:0] _T_15; // @[InstCache.scala 56:48:@23.4]
  wire [32:0] _T_19; // @[InstCache.scala 56:70:@26.4]
  wire [31:0] _T_20; // @[InstCache.scala 56:70:@27.4]
  wire [32:0] _T_24; // @[InstCache.scala 56:92:@30.4]
  wire [31:0] _T_25; // @[InstCache.scala 56:92:@31.4]
  wire [15:0] _T_28; // @[Cat.scala 30:58:@34.4]
  wire [15:0] _T_29; // @[Cat.scala 30:58:@35.4]
  assign cache__T_12_addr = io_addr[6:0];
  assign cache__T_12_data = cache[cache__T_12_addr]; // @[InstCache.scala 30:18:@19.4]
  assign cache__T_17_addr = _T_15[6:0];
  assign cache__T_17_data = cache[cache__T_17_addr]; // @[InstCache.scala 30:18:@19.4]
  assign cache__T_22_addr = _T_20[6:0];
  assign cache__T_22_data = cache[cache__T_22_addr]; // @[InstCache.scala 30:18:@19.4]
  assign cache__T_27_addr = _T_25[6:0];
  assign cache__T_27_data = cache[cache__T_27_addr]; // @[InstCache.scala 30:18:@19.4]
  assign _T_14 = io_addr + 32'h1; // @[InstCache.scala 56:48:@22.4]
  assign _T_15 = io_addr + 32'h1; // @[InstCache.scala 56:48:@23.4]
  assign _T_19 = io_addr + 32'h2; // @[InstCache.scala 56:70:@26.4]
  assign _T_20 = io_addr + 32'h2; // @[InstCache.scala 56:70:@27.4]
  assign _T_24 = io_addr + 32'h3; // @[InstCache.scala 56:92:@30.4]
  assign _T_25 = io_addr + 32'h3; // @[InstCache.scala 56:92:@31.4]
  assign _T_28 = {cache__T_22_data,cache__T_27_data}; // @[Cat.scala 30:58:@34.4]
  assign _T_29 = {cache__T_12_data,cache__T_17_data}; // @[Cat.scala 30:58:@35.4]
  assign io_inst = {_T_29,_T_28}; // @[InstCache.scala 56:11:@37.4]
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
  output [4:0]  io_id_rs1, // @[:@42.4]
  output [4:0]  io_id_rs2, // @[:@42.4]
  output [31:0] io_id_pc, // @[:@42.4]
  output [31:0] io_id_inst // @[:@42.4]
);
  reg [31:0] pc_reg; // @[IF_ID_Register.scala 27:23:@44.4]
  reg [31:0] _RAND_0;
  reg [31:0] inst_reg; // @[IF_ID_Register.scala 28:25:@45.4]
  reg [31:0] _RAND_1;
  wire [31:0] _T_28; // @[IF_ID_Register.scala 31:8:@48.4]
  wire [31:0] _T_29; // @[IF_ID_Register.scala 30:16:@49.4]
  wire [31:0] _T_33; // @[IF_ID_Register.scala 34:8:@53.4]
  wire [31:0] _T_34; // @[IF_ID_Register.scala 33:18:@54.4]
  assign _T_28 = io_if_id_write ? io_if_pc : pc_reg; // @[IF_ID_Register.scala 31:8:@48.4]
  assign _T_29 = io_if_flush ? 32'h0 : _T_28; // @[IF_ID_Register.scala 30:16:@49.4]
  assign _T_33 = io_if_id_write ? io_if_inst : inst_reg; // @[IF_ID_Register.scala 34:8:@53.4]
  assign _T_34 = io_if_flush ? 32'h0 : _T_33; // @[IF_ID_Register.scala 33:18:@54.4]
  assign io_id_rs1 = inst_reg[19:15]; // @[IF_ID_Register.scala 38:13:@59.4]
  assign io_id_rs2 = inst_reg[24:20]; // @[IF_ID_Register.scala 39:13:@61.4]
  assign io_id_pc = pc_reg; // @[IF_ID_Register.scala 36:12:@56.4]
  assign io_id_inst = inst_reg; // @[IF_ID_Register.scala 37:14:@57.4]
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
  end
endmodule
module RegFile( // @[:@63.2]
  input         clock, // @[:@64.4]
  input  [4:0]  io_rs1, // @[:@66.4]
  input  [4:0]  io_rs2, // @[:@66.4]
  input  [4:0]  io_rd, // @[:@66.4]
  input  [31:0] io_wdata, // @[:@66.4]
  input         io_regwrite, // @[:@66.4]
  output [31:0] io_rs1_out, // @[:@66.4]
  output [31:0] io_rs2_out // @[:@66.4]
);
  reg [31:0] regfile [0:31]; // @[RegFile.scala 26:20:@68.4]
  reg [31:0] _RAND_0;
  wire [31:0] regfile__T_36_data; // @[RegFile.scala 26:20:@68.4]
  wire [4:0] regfile__T_36_addr; // @[RegFile.scala 26:20:@68.4]
  wire [31:0] regfile__T_37_data; // @[RegFile.scala 26:20:@68.4]
  wire [4:0] regfile__T_37_addr; // @[RegFile.scala 26:20:@68.4]
  wire [31:0] regfile__T_44_data; // @[RegFile.scala 26:20:@68.4]
  wire [4:0] regfile__T_44_addr; // @[RegFile.scala 26:20:@68.4]
  wire [31:0] regfile__T_22_data; // @[RegFile.scala 26:20:@68.4]
  wire [4:0] regfile__T_22_addr; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_22_mask; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_22_en; // @[RegFile.scala 26:20:@68.4]
  wire [31:0] regfile__T_25_data; // @[RegFile.scala 26:20:@68.4]
  wire [4:0] regfile__T_25_addr; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_25_mask; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_25_en; // @[RegFile.scala 26:20:@68.4]
  wire [31:0] regfile__T_28_data; // @[RegFile.scala 26:20:@68.4]
  wire [4:0] regfile__T_28_addr; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_28_mask; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_28_en; // @[RegFile.scala 26:20:@68.4]
  wire [31:0] regfile__T_31_data; // @[RegFile.scala 26:20:@68.4]
  wire [4:0] regfile__T_31_addr; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_31_mask; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_31_en; // @[RegFile.scala 26:20:@68.4]
  wire [31:0] regfile__T_34_data; // @[RegFile.scala 26:20:@68.4]
  wire [4:0] regfile__T_34_addr; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_34_mask; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_34_en; // @[RegFile.scala 26:20:@68.4]
  wire [31:0] regfile__T_38_data; // @[RegFile.scala 26:20:@68.4]
  wire [4:0] regfile__T_38_addr; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_38_mask; // @[RegFile.scala 26:20:@68.4]
  wire  regfile__T_38_en; // @[RegFile.scala 26:20:@68.4]
  wire  _T_41; // @[RegFile.scala 40:57:@85.4]
  wire [31:0] _T_43; // @[RegFile.scala 40:50:@86.4]
  assign regfile__T_36_addr = io_rs1;
  assign regfile__T_36_data = regfile[regfile__T_36_addr]; // @[RegFile.scala 26:20:@68.4]
  assign regfile__T_37_addr = io_rs2;
  assign regfile__T_37_data = regfile[regfile__T_37_addr]; // @[RegFile.scala 26:20:@68.4]
  assign regfile__T_44_addr = io_rd;
  assign regfile__T_44_data = regfile[regfile__T_44_addr]; // @[RegFile.scala 26:20:@68.4]
  assign regfile__T_22_data = 32'ha;
  assign regfile__T_22_addr = 5'h1;
  assign regfile__T_22_mask = 1'h1;
  assign regfile__T_22_en = 1'h1;
  assign regfile__T_25_data = 32'hb;
  assign regfile__T_25_addr = 5'h2;
  assign regfile__T_25_mask = 1'h1;
  assign regfile__T_25_en = 1'h1;
  assign regfile__T_28_data = 32'hc;
  assign regfile__T_28_addr = 5'h3;
  assign regfile__T_28_mask = 1'h1;
  assign regfile__T_28_en = 1'h1;
  assign regfile__T_31_data = 32'hf;
  assign regfile__T_31_addr = 5'h4;
  assign regfile__T_31_mask = 1'h1;
  assign regfile__T_31_en = 1'h1;
  assign regfile__T_34_data = 32'hf;
  assign regfile__T_34_addr = 5'h5;
  assign regfile__T_34_mask = 1'h1;
  assign regfile__T_34_en = 1'h1;
  assign regfile__T_38_data = io_regwrite ? _T_43 : regfile__T_44_data;
  assign regfile__T_38_addr = io_rd;
  assign regfile__T_38_mask = 1'h1;
  assign regfile__T_38_en = 1'h1;
  assign _T_41 = io_rd == 5'h0; // @[RegFile.scala 40:57:@85.4]
  assign _T_43 = _T_41 ? 32'h0 : io_wdata; // @[RegFile.scala 40:50:@86.4]
  assign io_rs1_out = regfile__T_36_data; // @[RegFile.scala 37:14:@80.4]
  assign io_rs2_out = regfile__T_37_data; // @[RegFile.scala 38:14:@82.4]
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
    if(regfile__T_22_en & regfile__T_22_mask) begin
      regfile[regfile__T_22_addr] <= regfile__T_22_data; // @[RegFile.scala 26:20:@68.4]
    end
    if(regfile__T_25_en & regfile__T_25_mask) begin
      regfile[regfile__T_25_addr] <= regfile__T_25_data; // @[RegFile.scala 26:20:@68.4]
    end
    if(regfile__T_28_en & regfile__T_28_mask) begin
      regfile[regfile__T_28_addr] <= regfile__T_28_data; // @[RegFile.scala 26:20:@68.4]
    end
    if(regfile__T_31_en & regfile__T_31_mask) begin
      regfile[regfile__T_31_addr] <= regfile__T_31_data; // @[RegFile.scala 26:20:@68.4]
    end
    if(regfile__T_34_en & regfile__T_34_mask) begin
      regfile[regfile__T_34_addr] <= regfile__T_34_data; // @[RegFile.scala 26:20:@68.4]
    end
    if(regfile__T_38_en & regfile__T_38_mask) begin
      regfile[regfile__T_38_addr] <= regfile__T_38_data; // @[RegFile.scala 26:20:@68.4]
    end
  end
endmodule
module ImmGen( // @[:@91.2]
  input  [31:0] io_inst_in, // @[:@94.4]
  input  [2:0]  io_imm_sel, // @[:@94.4]
  output [31:0] io_imm // @[:@94.4]
);
  wire [11:0] Iimm; // @[ImmGen.scala 26:24:@96.4]
  wire [6:0] _T_11; // @[ImmGen.scala 27:28:@97.4]
  wire [4:0] _T_12; // @[ImmGen.scala 27:48:@98.4]
  wire [11:0] Simm; // @[Cat.scala 30:58:@99.4]
  wire  _T_13; // @[ImmGen.scala 28:28:@100.4]
  wire  _T_14; // @[ImmGen.scala 28:44:@101.4]
  wire [5:0] _T_15; // @[ImmGen.scala 28:59:@102.4]
  wire [3:0] _T_16; // @[ImmGen.scala 28:79:@103.4]
  wire [11:0] Bimm; // @[Cat.scala 30:58:@106.4]
  wire  _T_44; // @[Mux.scala 46:19:@107.4]
  wire [11:0] _T_45; // @[Mux.scala 46:16:@108.4]
  wire  _T_46; // @[Mux.scala 46:19:@109.4]
  wire [11:0] _T_47; // @[Mux.scala 46:16:@110.4]
  wire  _T_48; // @[Mux.scala 46:19:@111.4]
  wire [11:0] _T_49; // @[Mux.scala 46:16:@112.4]
  wire  _T_50; // @[Mux.scala 46:19:@113.4]
  wire [11:0] _T_51; // @[Mux.scala 46:16:@114.4]
  assign Iimm = io_inst_in[31:20]; // @[ImmGen.scala 26:24:@96.4]
  assign _T_11 = io_inst_in[31:25]; // @[ImmGen.scala 27:28:@97.4]
  assign _T_12 = io_inst_in[11:7]; // @[ImmGen.scala 27:48:@98.4]
  assign Simm = {_T_11,_T_12}; // @[Cat.scala 30:58:@99.4]
  assign _T_13 = io_inst_in[31]; // @[ImmGen.scala 28:28:@100.4]
  assign _T_14 = io_inst_in[7]; // @[ImmGen.scala 28:44:@101.4]
  assign _T_15 = io_inst_in[30:25]; // @[ImmGen.scala 28:59:@102.4]
  assign _T_16 = io_inst_in[11:8]; // @[ImmGen.scala 28:79:@103.4]
  assign Bimm = {_T_13,_T_14,_T_15,_T_16}; // @[Cat.scala 30:58:@106.4]
  assign _T_44 = 3'h4 == io_imm_sel; // @[Mux.scala 46:19:@107.4]
  assign _T_45 = _T_44 ? Bimm : 12'h0; // @[Mux.scala 46:16:@108.4]
  assign _T_46 = 3'h3 == io_imm_sel; // @[Mux.scala 46:19:@109.4]
  assign _T_47 = _T_46 ? Simm : _T_45; // @[Mux.scala 46:16:@110.4]
  assign _T_48 = 3'h2 == io_imm_sel; // @[Mux.scala 46:19:@111.4]
  assign _T_49 = _T_48 ? Iimm : _T_47; // @[Mux.scala 46:16:@112.4]
  assign _T_50 = 3'h1 == io_imm_sel; // @[Mux.scala 46:19:@113.4]
  assign _T_51 = _T_50 ? Iimm : _T_49; // @[Mux.scala 46:16:@114.4]
  assign io_imm = {{20'd0}, _T_51}; // @[ImmGen.scala 30:10:@115.4]
endmodule
module Control( // @[:@117.2]
  input  [31:0] io_inst, // @[:@120.4]
  output        io_Reg_Write, // @[:@120.4]
  output [2:0]  io_Imm_Sel, // @[:@120.4]
  output        io_ALU_Src, // @[:@120.4]
  output [3:0]  io_ALUOp, // @[:@120.4]
  output        io_Branch, // @[:@120.4]
  output        io_Mem_Read, // @[:@120.4]
  output        io_Mem_Write, // @[:@120.4]
  output        io_Mem_to_Reg // @[:@120.4]
);
  wire [31:0] _T_25; // @[Lookup.scala 9:38:@122.4]
  wire  _T_26; // @[Lookup.scala 9:38:@123.4]
  wire  _T_30; // @[Lookup.scala 9:38:@125.4]
  wire  _T_34; // @[Lookup.scala 9:38:@127.4]
  wire  _T_38; // @[Lookup.scala 9:38:@129.4]
  wire [31:0] _T_41; // @[Lookup.scala 9:38:@130.4]
  wire  _T_42; // @[Lookup.scala 9:38:@131.4]
  wire  _T_46; // @[Lookup.scala 9:38:@133.4]
  wire  _T_50; // @[Lookup.scala 9:38:@135.4]
  wire  _T_59; // @[Lookup.scala 11:37:@142.4]
  wire  _T_60; // @[Lookup.scala 11:37:@143.4]
  wire  _T_61; // @[Lookup.scala 11:37:@144.4]
  wire [2:0] _T_63; // @[Lookup.scala 11:37:@147.4]
  wire [2:0] _T_64; // @[Lookup.scala 11:37:@148.4]
  wire [2:0] _T_65; // @[Lookup.scala 11:37:@149.4]
  wire [2:0] _T_66; // @[Lookup.scala 11:37:@150.4]
  wire [2:0] _T_67; // @[Lookup.scala 11:37:@151.4]
  wire [2:0] _T_68; // @[Lookup.scala 11:37:@152.4]
  wire  _T_72; // @[Lookup.scala 11:37:@157.4]
  wire  _T_73; // @[Lookup.scala 11:37:@158.4]
  wire  _T_74; // @[Lookup.scala 11:37:@159.4]
  wire  _T_75; // @[Lookup.scala 11:37:@160.4]
  wire [3:0] _T_77; // @[Lookup.scala 11:37:@163.4]
  wire [3:0] _T_78; // @[Lookup.scala 11:37:@164.4]
  wire [3:0] _T_79; // @[Lookup.scala 11:37:@165.4]
  wire [3:0] _T_80; // @[Lookup.scala 11:37:@166.4]
  wire [3:0] _T_81; // @[Lookup.scala 11:37:@167.4]
  wire [3:0] _T_82; // @[Lookup.scala 11:37:@168.4]
  wire  _T_85; // @[Lookup.scala 11:37:@172.4]
  wire  _T_86; // @[Lookup.scala 11:37:@173.4]
  wire  _T_87; // @[Lookup.scala 11:37:@174.4]
  wire  _T_88; // @[Lookup.scala 11:37:@175.4]
  wire  _T_89; // @[Lookup.scala 11:37:@176.4]
  wire  _T_94; // @[Lookup.scala 11:37:@182.4]
  wire  _T_95; // @[Lookup.scala 11:37:@183.4]
  wire  _T_96; // @[Lookup.scala 11:37:@184.4]
  wire  _T_100; // @[Lookup.scala 11:37:@189.4]
  wire  _T_101; // @[Lookup.scala 11:37:@190.4]
  wire  _T_102; // @[Lookup.scala 11:37:@191.4]
  wire  _T_103; // @[Lookup.scala 11:37:@192.4]
  assign _T_25 = io_inst & 32'hfe00707f; // @[Lookup.scala 9:38:@122.4]
  assign _T_26 = 32'h33 == _T_25; // @[Lookup.scala 9:38:@123.4]
  assign _T_30 = 32'h40000033 == _T_25; // @[Lookup.scala 9:38:@125.4]
  assign _T_34 = 32'h7033 == _T_25; // @[Lookup.scala 9:38:@127.4]
  assign _T_38 = 32'h6033 == _T_25; // @[Lookup.scala 9:38:@129.4]
  assign _T_41 = io_inst & 32'h707f; // @[Lookup.scala 9:38:@130.4]
  assign _T_42 = 32'h2003 == _T_41; // @[Lookup.scala 9:38:@131.4]
  assign _T_46 = 32'h2023 == _T_41; // @[Lookup.scala 9:38:@133.4]
  assign _T_50 = 32'h63 == _T_41; // @[Lookup.scala 9:38:@135.4]
  assign _T_59 = _T_38 ? 1'h1 : _T_42; // @[Lookup.scala 11:37:@142.4]
  assign _T_60 = _T_34 ? 1'h1 : _T_59; // @[Lookup.scala 11:37:@143.4]
  assign _T_61 = _T_30 ? 1'h1 : _T_60; // @[Lookup.scala 11:37:@144.4]
  assign _T_63 = _T_50 ? 3'h4 : 3'h0; // @[Lookup.scala 11:37:@147.4]
  assign _T_64 = _T_46 ? 3'h3 : _T_63; // @[Lookup.scala 11:37:@148.4]
  assign _T_65 = _T_42 ? 3'h2 : _T_64; // @[Lookup.scala 11:37:@149.4]
  assign _T_66 = _T_38 ? 3'h1 : _T_65; // @[Lookup.scala 11:37:@150.4]
  assign _T_67 = _T_34 ? 3'h1 : _T_66; // @[Lookup.scala 11:37:@151.4]
  assign _T_68 = _T_30 ? 3'h1 : _T_67; // @[Lookup.scala 11:37:@152.4]
  assign _T_72 = _T_42 ? 1'h1 : _T_46; // @[Lookup.scala 11:37:@157.4]
  assign _T_73 = _T_38 ? 1'h0 : _T_72; // @[Lookup.scala 11:37:@158.4]
  assign _T_74 = _T_34 ? 1'h0 : _T_73; // @[Lookup.scala 11:37:@159.4]
  assign _T_75 = _T_30 ? 1'h0 : _T_74; // @[Lookup.scala 11:37:@160.4]
  assign _T_77 = _T_50 ? 4'h1 : 4'hf; // @[Lookup.scala 11:37:@163.4]
  assign _T_78 = _T_46 ? 4'h0 : _T_77; // @[Lookup.scala 11:37:@164.4]
  assign _T_79 = _T_42 ? 4'h0 : _T_78; // @[Lookup.scala 11:37:@165.4]
  assign _T_80 = _T_38 ? 4'h3 : _T_79; // @[Lookup.scala 11:37:@166.4]
  assign _T_81 = _T_34 ? 4'h2 : _T_80; // @[Lookup.scala 11:37:@167.4]
  assign _T_82 = _T_30 ? 4'h1 : _T_81; // @[Lookup.scala 11:37:@168.4]
  assign _T_85 = _T_46 ? 1'h0 : _T_50; // @[Lookup.scala 11:37:@172.4]
  assign _T_86 = _T_42 ? 1'h0 : _T_85; // @[Lookup.scala 11:37:@173.4]
  assign _T_87 = _T_38 ? 1'h0 : _T_86; // @[Lookup.scala 11:37:@174.4]
  assign _T_88 = _T_34 ? 1'h0 : _T_87; // @[Lookup.scala 11:37:@175.4]
  assign _T_89 = _T_30 ? 1'h0 : _T_88; // @[Lookup.scala 11:37:@176.4]
  assign _T_94 = _T_38 ? 1'h0 : _T_42; // @[Lookup.scala 11:37:@182.4]
  assign _T_95 = _T_34 ? 1'h0 : _T_94; // @[Lookup.scala 11:37:@183.4]
  assign _T_96 = _T_30 ? 1'h0 : _T_95; // @[Lookup.scala 11:37:@184.4]
  assign _T_100 = _T_42 ? 1'h0 : _T_46; // @[Lookup.scala 11:37:@189.4]
  assign _T_101 = _T_38 ? 1'h0 : _T_100; // @[Lookup.scala 11:37:@190.4]
  assign _T_102 = _T_34 ? 1'h0 : _T_101; // @[Lookup.scala 11:37:@191.4]
  assign _T_103 = _T_30 ? 1'h0 : _T_102; // @[Lookup.scala 11:37:@192.4]
  assign io_Reg_Write = _T_26 ? 1'h1 : _T_61; // @[Control.scala 98:17:@208.4]
  assign io_Imm_Sel = _T_26 ? 3'h1 : _T_68; // @[Control.scala 86:17:@202.4]
  assign io_ALU_Src = _T_26 ? 1'h0 : _T_75; // @[Control.scala 89:17:@203.4]
  assign io_ALUOp = _T_26 ? 4'h0 : _T_82; // @[Control.scala 90:17:@204.4]
  assign io_Branch = _T_26 ? 1'h0 : _T_89; // @[Control.scala 93:17:@205.4]
  assign io_Mem_Read = _T_26 ? 1'h0 : _T_96; // @[Control.scala 94:17:@206.4]
  assign io_Mem_Write = _T_26 ? 1'h0 : _T_103; // @[Control.scala 95:17:@207.4]
  assign io_Mem_to_Reg = _T_26 ? 1'h0 : _T_96; // @[Control.scala 99:17:@209.4]
endmodule
module ID_EX_Register( // @[:@211.2]
  input         clock, // @[:@212.4]
  input         reset, // @[:@213.4]
  input  [31:0] io_id_pc, // @[:@214.4]
  input  [31:0] io_id_rs1_out, // @[:@214.4]
  input  [31:0] io_id_rs2_out, // @[:@214.4]
  input  [31:0] io_id_imm, // @[:@214.4]
  input  [31:0] io_id_inst, // @[:@214.4]
  input         io_ALU_Src, // @[:@214.4]
  input  [3:0]  io_ALUOp, // @[:@214.4]
  input         io_Branch, // @[:@214.4]
  input         io_Mem_Read, // @[:@214.4]
  input         io_Mem_Write, // @[:@214.4]
  input         io_Reg_Write, // @[:@214.4]
  input         io_Mem_to_Reg, // @[:@214.4]
  output        io_ex_ALU_Src, // @[:@214.4]
  output [3:0]  io_ex_ALUOp, // @[:@214.4]
  output        io_ex_Branch, // @[:@214.4]
  output        io_ex_Mem_Read, // @[:@214.4]
  output        io_ex_Mem_Write, // @[:@214.4]
  output        io_ex_Reg_Write, // @[:@214.4]
  output        io_ex_Mem_to_Reg, // @[:@214.4]
  output [31:0] io_ex_pc, // @[:@214.4]
  output [31:0] io_ex_rs1_out, // @[:@214.4]
  output [31:0] io_ex_rs2_out, // @[:@214.4]
  output [4:0]  io_ex_rd, // @[:@214.4]
  output [31:0] io_ex_imm // @[:@214.4]
);
  reg [31:0] pc; // @[ID_EX_Register.scala 61:28:@216.4]
  reg [31:0] _RAND_0;
  reg [31:0] rs1_out; // @[ID_EX_Register.scala 62:28:@217.4]
  reg [31:0] _RAND_1;
  reg [31:0] rs2_out; // @[ID_EX_Register.scala 63:28:@218.4]
  reg [31:0] _RAND_2;
  reg [31:0] imm; // @[ID_EX_Register.scala 64:28:@219.4]
  reg [31:0] _RAND_3;
  reg [31:0] inst; // @[ID_EX_Register.scala 65:28:@220.4]
  reg [31:0] _RAND_4;
  reg  alu_src; // @[ID_EX_Register.scala 68:28:@223.4]
  reg [31:0] _RAND_5;
  reg [3:0] aluop; // @[ID_EX_Register.scala 69:28:@224.4]
  reg [31:0] _RAND_6;
  reg  branch; // @[ID_EX_Register.scala 70:28:@225.4]
  reg [31:0] _RAND_7;
  reg  mem_read; // @[ID_EX_Register.scala 71:28:@226.4]
  reg [31:0] _RAND_8;
  reg  mem_write; // @[ID_EX_Register.scala 72:28:@227.4]
  reg [31:0] _RAND_9;
  reg  reg_write; // @[ID_EX_Register.scala 73:28:@228.4]
  reg [31:0] _RAND_10;
  reg  mem_to_reg; // @[ID_EX_Register.scala 74:28:@229.4]
  reg [31:0] _RAND_11;
  assign io_ex_ALU_Src = alu_src; // @[ID_EX_Register.scala 93:21:@244.4]
  assign io_ex_ALUOp = aluop; // @[ID_EX_Register.scala 94:21:@245.4]
  assign io_ex_Branch = branch; // @[ID_EX_Register.scala 95:21:@246.4]
  assign io_ex_Mem_Read = mem_read; // @[ID_EX_Register.scala 96:21:@247.4]
  assign io_ex_Mem_Write = mem_write; // @[ID_EX_Register.scala 97:21:@248.4]
  assign io_ex_Reg_Write = reg_write; // @[ID_EX_Register.scala 98:21:@249.4]
  assign io_ex_Mem_to_Reg = mem_to_reg; // @[ID_EX_Register.scala 99:21:@250.4]
  assign io_ex_pc = pc; // @[ID_EX_Register.scala 100:21:@251.4]
  assign io_ex_rs1_out = rs1_out; // @[ID_EX_Register.scala 101:21:@252.4]
  assign io_ex_rs2_out = rs2_out; // @[ID_EX_Register.scala 102:21:@253.4]
  assign io_ex_rd = inst[11:7]; // @[ID_EX_Register.scala 107:21:@259.4]
  assign io_ex_imm = imm; // @[ID_EX_Register.scala 105:21:@256.4]
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
  rs1_out = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  rs2_out = _RAND_2[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  imm = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  inst = _RAND_4[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  alu_src = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  aluop = _RAND_6[3:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  branch = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  mem_read = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  mem_write = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_10 = {1{`RANDOM}};
  reg_write = _RAND_10[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_11 = {1{`RANDOM}};
  mem_to_reg = _RAND_11[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      pc <= 32'h0;
    end else begin
      pc <= io_id_pc;
    end
    if (reset) begin
      rs1_out <= 32'h0;
    end else begin
      rs1_out <= io_id_rs1_out;
    end
    if (reset) begin
      rs2_out <= 32'h0;
    end else begin
      rs2_out <= io_id_rs2_out;
    end
    if (reset) begin
      imm <= 32'h0;
    end else begin
      imm <= io_id_imm;
    end
    if (reset) begin
      inst <= 32'h0;
    end else begin
      inst <= io_id_inst;
    end
    if (reset) begin
      alu_src <= 1'h0;
    end else begin
      alu_src <= io_ALU_Src;
    end
    if (reset) begin
      aluop <= 4'h0;
    end else begin
      aluop <= io_ALUOp;
    end
    if (reset) begin
      branch <= 1'h0;
    end else begin
      branch <= io_Branch;
    end
    if (reset) begin
      mem_read <= 1'h0;
    end else begin
      mem_read <= io_Mem_Read;
    end
    if (reset) begin
      mem_write <= 1'h0;
    end else begin
      mem_write <= io_Mem_Write;
    end
    if (reset) begin
      reg_write <= 1'h0;
    end else begin
      reg_write <= io_Reg_Write;
    end
    if (reset) begin
      mem_to_reg <= 1'h0;
    end else begin
      mem_to_reg <= io_Mem_to_Reg;
    end
  end
endmodule
module ALU( // @[:@261.2]
  input  [31:0] io_Src_A, // @[:@264.4]
  input  [31:0] io_Src_B, // @[:@264.4]
  input  [3:0]  io_ALUOp, // @[:@264.4]
  output [31:0] io_Sum, // @[:@264.4]
  output        io_Zero // @[:@264.4]
);
  wire [32:0] _T_15; // @[ALU.scala 38:26:@266.4]
  wire [31:0] _T_16; // @[ALU.scala 38:26:@267.4]
  wire [32:0] _T_17; // @[ALU.scala 39:26:@268.4]
  wire [32:0] _T_18; // @[ALU.scala 39:26:@269.4]
  wire [31:0] _T_19; // @[ALU.scala 39:26:@270.4]
  wire [31:0] _T_20; // @[ALU.scala 40:26:@271.4]
  wire [31:0] _T_21; // @[ALU.scala 41:26:@272.4]
  wire  _T_22; // @[Mux.scala 46:19:@273.4]
  wire [31:0] _T_23; // @[Mux.scala 46:16:@274.4]
  wire  _T_24; // @[Mux.scala 46:19:@275.4]
  wire [31:0] _T_25; // @[Mux.scala 46:16:@276.4]
  wire  _T_26; // @[Mux.scala 46:19:@277.4]
  wire [31:0] _T_27; // @[Mux.scala 46:16:@278.4]
  wire  _T_28; // @[Mux.scala 46:19:@279.4]
  assign _T_15 = io_Src_A + io_Src_B; // @[ALU.scala 38:26:@266.4]
  assign _T_16 = io_Src_A + io_Src_B; // @[ALU.scala 38:26:@267.4]
  assign _T_17 = io_Src_A - io_Src_B; // @[ALU.scala 39:26:@268.4]
  assign _T_18 = $unsigned(_T_17); // @[ALU.scala 39:26:@269.4]
  assign _T_19 = _T_18[31:0]; // @[ALU.scala 39:26:@270.4]
  assign _T_20 = io_Src_A & io_Src_B; // @[ALU.scala 40:26:@271.4]
  assign _T_21 = io_Src_A | io_Src_B; // @[ALU.scala 41:26:@272.4]
  assign _T_22 = 4'h3 == io_ALUOp; // @[Mux.scala 46:19:@273.4]
  assign _T_23 = _T_22 ? _T_21 : io_Src_B; // @[Mux.scala 46:16:@274.4]
  assign _T_24 = 4'h2 == io_ALUOp; // @[Mux.scala 46:19:@275.4]
  assign _T_25 = _T_24 ? _T_20 : _T_23; // @[Mux.scala 46:16:@276.4]
  assign _T_26 = 4'h1 == io_ALUOp; // @[Mux.scala 46:19:@277.4]
  assign _T_27 = _T_26 ? _T_19 : _T_25; // @[Mux.scala 46:16:@278.4]
  assign _T_28 = 4'h0 == io_ALUOp; // @[Mux.scala 46:19:@279.4]
  assign io_Sum = _T_28 ? _T_16 : _T_27; // @[ALU.scala 37:10:@281.4]
  assign io_Zero = io_Src_A == io_Src_B; // @[ALU.scala 44:11:@284.4]
endmodule
module Datapath( // @[:@286.2]
  input  [31:0] io_if_datapathio_if_pc_branch_addr, // @[:@289.4]
  input  [31:0] io_if_datapathio_if_pc, // @[:@289.4]
  output [31:0] io_if_datapathio_if_new_pc, // @[:@289.4]
  input  [31:0] io_ex_datapathio_ex_rs2_out, // @[:@289.4]
  input  [31:0] io_ex_datapathio_ex_imm, // @[:@289.4]
  input  [31:0] io_ex_datapathio_ex_pc, // @[:@289.4]
  input         io_ex_datapathio_ex_ALU_Src, // @[:@289.4]
  output [31:0] io_ex_datapathio_ex_branch_addr, // @[:@289.4]
  output [31:0] io_ex_datapathio_alu_b_src, // @[:@289.4]
  input         io_mem_datapathio_mem_Branch, // @[:@289.4]
  input         io_mem_datapathio_mem_Zero, // @[:@289.4]
  input  [31:0] io_wb_datapathio_wb_alu_sum, // @[:@289.4]
  input  [31:0] io_wb_datapathio_wb_dataout, // @[:@289.4]
  input         io_wb_datapathio_wb_Mem_to_Reg, // @[:@289.4]
  output [31:0] io_wb_datapathio_wb_reg_writedata // @[:@289.4]
);
  wire [32:0] _T_36; // @[Datapath.scala 54:37:@291.4]
  wire [31:0] PC_4; // @[Datapath.scala 54:37:@292.4]
  wire  PC_Src; // @[Datapath.scala 57:43:@293.4]
  wire [32:0] _GEN_0; // @[Datapath.scala 62:43:@297.4]
  wire [32:0] shift_imm; // @[Datapath.scala 62:43:@297.4]
  wire [32:0] _GEN_1; // @[Datapath.scala 63:61:@298.4]
  wire [33:0] _T_40; // @[Datapath.scala 63:61:@298.4]
  wire [32:0] _T_41; // @[Datapath.scala 63:61:@299.4]
  assign _T_36 = io_if_datapathio_if_pc + 32'h4; // @[Datapath.scala 54:37:@291.4]
  assign PC_4 = io_if_datapathio_if_pc + 32'h4; // @[Datapath.scala 54:37:@292.4]
  assign PC_Src = io_mem_datapathio_mem_Zero & io_mem_datapathio_mem_Branch; // @[Datapath.scala 57:43:@293.4]
  assign _GEN_0 = {{1'd0}, io_ex_datapathio_ex_imm}; // @[Datapath.scala 62:43:@297.4]
  assign shift_imm = _GEN_0 << 1'h1; // @[Datapath.scala 62:43:@297.4]
  assign _GEN_1 = {{1'd0}, io_ex_datapathio_ex_pc}; // @[Datapath.scala 63:61:@298.4]
  assign _T_40 = _GEN_1 + shift_imm; // @[Datapath.scala 63:61:@298.4]
  assign _T_41 = _GEN_1 + shift_imm; // @[Datapath.scala 63:61:@299.4]
  assign io_if_datapathio_if_new_pc = PC_Src ? io_if_datapathio_if_pc_branch_addr : PC_4; // @[Datapath.scala 58:30:@296.4]
  assign io_ex_datapathio_ex_branch_addr = _T_41[31:0]; // @[Datapath.scala 63:35:@300.4]
  assign io_ex_datapathio_alu_b_src = io_ex_datapathio_ex_ALU_Src ? io_ex_datapathio_ex_imm : io_ex_datapathio_ex_rs2_out; // @[Datapath.scala 66:30:@303.4]
  assign io_wb_datapathio_wb_reg_writedata = io_wb_datapathio_wb_Mem_to_Reg ? io_wb_datapathio_wb_dataout : io_wb_datapathio_wb_alu_sum; // @[Datapath.scala 74:37:@306.4]
endmodule
module EX_MEM_Register( // @[:@308.2]
  input         clock, // @[:@309.4]
  input         reset, // @[:@310.4]
  input  [31:0] io_ex_branch_addr, // @[:@311.4]
  input  [31:0] io_ex_alu_sum, // @[:@311.4]
  input  [31:0] io_ex_alu_zero, // @[:@311.4]
  input  [31:0] io_ex_rs2_out, // @[:@311.4]
  input  [4:0]  io_ex_rd, // @[:@311.4]
  input         io_ex_Branch, // @[:@311.4]
  input         io_ex_Mem_Read, // @[:@311.4]
  input         io_ex_Mem_Write, // @[:@311.4]
  input         io_ex_Reg_Write, // @[:@311.4]
  input         io_ex_Mem_to_Reg, // @[:@311.4]
  output        io_mem_Branch, // @[:@311.4]
  output        io_mem_Mem_Read, // @[:@311.4]
  output        io_mem_Mem_Write, // @[:@311.4]
  output        io_mem_Reg_Write, // @[:@311.4]
  output        io_mem_Mem_to_Reg, // @[:@311.4]
  output [31:0] io_mem_branch_addr, // @[:@311.4]
  output        io_mem_alu_zero, // @[:@311.4]
  output [31:0] io_mem_alu_sum, // @[:@311.4]
  output [31:0] io_mem_rs2_out, // @[:@311.4]
  output [4:0]  io_mem_rd // @[:@311.4]
);
  reg [31:0] branch_addr; // @[EX_MEM_Register.scala 49:30:@313.4]
  reg [31:0] _RAND_0;
  reg [31:0] alu_sum; // @[EX_MEM_Register.scala 50:30:@314.4]
  reg [31:0] _RAND_1;
  reg [4:0] alu_zero; // @[EX_MEM_Register.scala 51:30:@315.4]
  reg [31:0] _RAND_2;
  reg [31:0] rs2_out; // @[EX_MEM_Register.scala 52:30:@316.4]
  reg [31:0] _RAND_3;
  reg [4:0] rd; // @[EX_MEM_Register.scala 53:30:@317.4]
  reg [31:0] _RAND_4;
  reg  branch; // @[EX_MEM_Register.scala 55:30:@318.4]
  reg [31:0] _RAND_5;
  reg  mem_read; // @[EX_MEM_Register.scala 56:30:@319.4]
  reg [31:0] _RAND_6;
  reg  mem_write; // @[EX_MEM_Register.scala 57:30:@320.4]
  reg [31:0] _RAND_7;
  reg  reg_write; // @[EX_MEM_Register.scala 58:30:@321.4]
  reg [31:0] _RAND_8;
  reg  mem_to_reg; // @[EX_MEM_Register.scala 59:30:@322.4]
  reg [31:0] _RAND_9;
  assign io_mem_Branch = branch; // @[EX_MEM_Register.scala 79:23:@338.4]
  assign io_mem_Mem_Read = mem_read; // @[EX_MEM_Register.scala 80:23:@339.4]
  assign io_mem_Mem_Write = mem_write; // @[EX_MEM_Register.scala 81:23:@340.4]
  assign io_mem_Reg_Write = reg_write; // @[EX_MEM_Register.scala 82:23:@341.4]
  assign io_mem_Mem_to_Reg = mem_to_reg; // @[EX_MEM_Register.scala 83:23:@342.4]
  assign io_mem_branch_addr = branch_addr; // @[EX_MEM_Register.scala 74:23:@333.4]
  assign io_mem_alu_zero = alu_zero[0]; // @[EX_MEM_Register.scala 76:23:@335.4]
  assign io_mem_alu_sum = alu_sum; // @[EX_MEM_Register.scala 75:23:@334.4]
  assign io_mem_rs2_out = rs2_out; // @[EX_MEM_Register.scala 77:23:@336.4]
  assign io_mem_rd = rd; // @[EX_MEM_Register.scala 78:23:@337.4]
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
  branch_addr = _RAND_0[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_1 = {1{`RANDOM}};
  alu_sum = _RAND_1[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_2 = {1{`RANDOM}};
  alu_zero = _RAND_2[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_3 = {1{`RANDOM}};
  rs2_out = _RAND_3[31:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  rd = _RAND_4[4:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_5 = {1{`RANDOM}};
  branch = _RAND_5[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_6 = {1{`RANDOM}};
  mem_read = _RAND_6[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_7 = {1{`RANDOM}};
  mem_write = _RAND_7[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_8 = {1{`RANDOM}};
  reg_write = _RAND_8[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_9 = {1{`RANDOM}};
  mem_to_reg = _RAND_9[0:0];
  `endif // RANDOMIZE_REG_INIT
  end
`endif // RANDOMIZE
  always @(posedge clock) begin
    if (reset) begin
      branch_addr <= 32'h0;
    end else begin
      branch_addr <= io_ex_branch_addr;
    end
    if (reset) begin
      alu_sum <= 32'h0;
    end else begin
      alu_sum <= io_ex_alu_sum;
    end
    if (reset) begin
      alu_zero <= 5'h0;
    end else begin
      alu_zero <= io_ex_alu_zero[4:0];
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
      branch <= 1'h0;
    end else begin
      branch <= io_ex_Branch;
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
      reg_write <= 1'h0;
    end else begin
      reg_write <= io_ex_Reg_Write;
    end
    if (reset) begin
      mem_to_reg <= 1'h0;
    end else begin
      mem_to_reg <= io_ex_Mem_to_Reg;
    end
  end
endmodule
module DataCache( // @[:@344.2]
  input         clock, // @[:@345.4]
  input  [31:0] io_addr, // @[:@347.4]
  input  [31:0] io_write_data, // @[:@347.4]
  input         io_Mem_Read, // @[:@347.4]
  input         io_Mem_Write, // @[:@347.4]
  output [31:0] io_data_out // @[:@347.4]
);
  reg [31:0] cache [0:31]; // @[DataCache.scala 27:18:@349.4]
  reg [31:0] _RAND_0;
  wire [31:0] cache__T_22_data; // @[DataCache.scala 27:18:@349.4]
  wire [4:0] cache__T_22_addr; // @[DataCache.scala 27:18:@349.4]
  wire [31:0] cache__T_26_data; // @[DataCache.scala 27:18:@349.4]
  wire [4:0] cache__T_26_addr; // @[DataCache.scala 27:18:@349.4]
  wire [31:0] cache__T_19_data; // @[DataCache.scala 27:18:@349.4]
  wire [4:0] cache__T_19_addr; // @[DataCache.scala 27:18:@349.4]
  wire  cache__T_19_mask; // @[DataCache.scala 27:18:@349.4]
  wire  cache__T_19_en; // @[DataCache.scala 27:18:@349.4]
  wire [31:0] fix_addr; // @[DataCache.scala 29:26:@350.4]
  assign cache__T_22_addr = fix_addr[4:0];
  assign cache__T_22_data = cache[cache__T_22_addr]; // @[DataCache.scala 27:18:@349.4]
  assign cache__T_26_addr = fix_addr[4:0];
  assign cache__T_26_data = cache[cache__T_26_addr]; // @[DataCache.scala 27:18:@349.4]
  assign cache__T_19_data = io_Mem_Write ? io_write_data : cache__T_22_data;
  assign cache__T_19_addr = fix_addr[4:0];
  assign cache__T_19_mask = 1'h1;
  assign cache__T_19_en = 1'h1;
  assign fix_addr = io_addr / 32'h4; // @[DataCache.scala 29:26:@350.4]
  assign io_data_out = io_Mem_Read ? cache__T_26_data : 32'h0; // @[DataCache.scala 31:15:@362.4]
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
    if(cache__T_19_en & cache__T_19_mask) begin
      cache[cache__T_19_addr] <= cache__T_19_data; // @[DataCache.scala 27:18:@349.4]
    end
  end
endmodule
module MEM_WB_Register( // @[:@364.2]
  input         clock, // @[:@365.4]
  input         reset, // @[:@366.4]
  input  [31:0] io_mem_dataout, // @[:@367.4]
  input  [31:0] io_mem_alu_sum, // @[:@367.4]
  input  [4:0]  io_mem_rd, // @[:@367.4]
  input         io_mem_Mem_to_Reg, // @[:@367.4]
  input         io_mem_Reg_Write, // @[:@367.4]
  output        io_wb_Mem_to_Reg, // @[:@367.4]
  output        io_wb_Reg_Write, // @[:@367.4]
  output [31:0] io_wb_dataout, // @[:@367.4]
  output [31:0] io_wb_alu_sum, // @[:@367.4]
  output [4:0]  io_wb_rd // @[:@367.4]
);
  reg [31:0] dataout; // @[MEM_WB_Register.scala 37:28:@369.4]
  reg [31:0] _RAND_0;
  reg [31:0] alu_sum; // @[MEM_WB_Register.scala 38:28:@370.4]
  reg [31:0] _RAND_1;
  reg [4:0] rd; // @[MEM_WB_Register.scala 39:28:@371.4]
  reg [31:0] _RAND_2;
  reg  mem_to_reg; // @[MEM_WB_Register.scala 40:28:@372.4]
  reg [31:0] _RAND_3;
  reg  reg_write; // @[MEM_WB_Register.scala 41:28:@373.4]
  reg [31:0] _RAND_4;
  assign io_wb_Mem_to_Reg = mem_to_reg; // @[MEM_WB_Register.scala 51:21:@379.4]
  assign io_wb_Reg_Write = reg_write; // @[MEM_WB_Register.scala 52:21:@380.4]
  assign io_wb_dataout = dataout; // @[MEM_WB_Register.scala 53:21:@381.4]
  assign io_wb_alu_sum = alu_sum; // @[MEM_WB_Register.scala 54:21:@382.4]
  assign io_wb_rd = rd; // @[MEM_WB_Register.scala 55:21:@383.4]
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
  mem_to_reg = _RAND_3[0:0];
  `endif // RANDOMIZE_REG_INIT
  `ifdef RANDOMIZE_REG_INIT
  _RAND_4 = {1{`RANDOM}};
  reg_write = _RAND_4[0:0];
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
      mem_to_reg <= 1'h0;
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
module Tile( // @[:@385.2]
  input         clock, // @[:@386.4]
  input         reset, // @[:@387.4]
  input         io_pc_write, // @[:@388.4]
  input         io_if_id_write, // @[:@388.4]
  input         io_if_flush, // @[:@388.4]
  output [31:0] io_if_pc_out, // @[:@388.4]
  output [31:0] io_if_next_pc, // @[:@388.4]
  output [4:0]  io_id_rs1, // @[:@388.4]
  output [4:0]  io_id_rs2, // @[:@388.4]
  output [31:0] io_id_rs1_out, // @[:@388.4]
  output [31:0] io_id_rs2_out, // @[:@388.4]
  output [31:0] io_ex_rs1_out, // @[:@388.4]
  output [31:0] io_ex_rs2_out, // @[:@388.4]
  output [31:0] io_ex_alu_sum, // @[:@388.4]
  output        io_ex_alu_zero, // @[:@388.4]
  output [31:0] io_ex_branch_addr, // @[:@388.4]
  output [4:0]  io_ex_rd, // @[:@388.4]
  output [4:0]  io_mem_rd, // @[:@388.4]
  output [31:0] io_mem_branch_addr, // @[:@388.4]
  output [31:0] io_mem_alu_sum, // @[:@388.4]
  output [31:0] io_mem_writedata, // @[:@388.4]
  output [31:0] io_mem_dataout, // @[:@388.4]
  output [4:0]  io_wb_rd, // @[:@388.4]
  output [31:0] io_wb_registerwrite // @[:@388.4]
);
  wire  pc_clock; // @[Tile.scala 46:31:@390.4]
  wire  pc_reset; // @[Tile.scala 46:31:@390.4]
  wire [31:0] pc_io_addr_input; // @[Tile.scala 46:31:@390.4]
  wire  pc_io_pc_write; // @[Tile.scala 46:31:@390.4]
  wire [31:0] pc_io_pc_out; // @[Tile.scala 46:31:@390.4]
  wire  instcache_clock; // @[Tile.scala 47:31:@393.4]
  wire [31:0] instcache_io_addr; // @[Tile.scala 47:31:@393.4]
  wire [31:0] instcache_io_inst; // @[Tile.scala 47:31:@393.4]
  wire  if_id_register_clock; // @[Tile.scala 48:31:@396.4]
  wire  if_id_register_reset; // @[Tile.scala 48:31:@396.4]
  wire [31:0] if_id_register_io_if_pc; // @[Tile.scala 48:31:@396.4]
  wire [31:0] if_id_register_io_if_inst; // @[Tile.scala 48:31:@396.4]
  wire  if_id_register_io_if_id_write; // @[Tile.scala 48:31:@396.4]
  wire  if_id_register_io_if_flush; // @[Tile.scala 48:31:@396.4]
  wire [4:0] if_id_register_io_id_rs1; // @[Tile.scala 48:31:@396.4]
  wire [4:0] if_id_register_io_id_rs2; // @[Tile.scala 48:31:@396.4]
  wire [31:0] if_id_register_io_id_pc; // @[Tile.scala 48:31:@396.4]
  wire [31:0] if_id_register_io_id_inst; // @[Tile.scala 48:31:@396.4]
  wire  regfile_clock; // @[Tile.scala 49:31:@399.4]
  wire [4:0] regfile_io_rs1; // @[Tile.scala 49:31:@399.4]
  wire [4:0] regfile_io_rs2; // @[Tile.scala 49:31:@399.4]
  wire [4:0] regfile_io_rd; // @[Tile.scala 49:31:@399.4]
  wire [31:0] regfile_io_wdata; // @[Tile.scala 49:31:@399.4]
  wire  regfile_io_regwrite; // @[Tile.scala 49:31:@399.4]
  wire [31:0] regfile_io_rs1_out; // @[Tile.scala 49:31:@399.4]
  wire [31:0] regfile_io_rs2_out; // @[Tile.scala 49:31:@399.4]
  wire [31:0] immgen_io_inst_in; // @[Tile.scala 50:31:@402.4]
  wire [2:0] immgen_io_imm_sel; // @[Tile.scala 50:31:@402.4]
  wire [31:0] immgen_io_imm; // @[Tile.scala 50:31:@402.4]
  wire [31:0] control_io_inst; // @[Tile.scala 51:31:@405.4]
  wire  control_io_Reg_Write; // @[Tile.scala 51:31:@405.4]
  wire [2:0] control_io_Imm_Sel; // @[Tile.scala 51:31:@405.4]
  wire  control_io_ALU_Src; // @[Tile.scala 51:31:@405.4]
  wire [3:0] control_io_ALUOp; // @[Tile.scala 51:31:@405.4]
  wire  control_io_Branch; // @[Tile.scala 51:31:@405.4]
  wire  control_io_Mem_Read; // @[Tile.scala 51:31:@405.4]
  wire  control_io_Mem_Write; // @[Tile.scala 51:31:@405.4]
  wire  control_io_Mem_to_Reg; // @[Tile.scala 51:31:@405.4]
  wire  id_ex_register_clock; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_reset; // @[Tile.scala 52:31:@408.4]
  wire [31:0] id_ex_register_io_id_pc; // @[Tile.scala 52:31:@408.4]
  wire [31:0] id_ex_register_io_id_rs1_out; // @[Tile.scala 52:31:@408.4]
  wire [31:0] id_ex_register_io_id_rs2_out; // @[Tile.scala 52:31:@408.4]
  wire [31:0] id_ex_register_io_id_imm; // @[Tile.scala 52:31:@408.4]
  wire [31:0] id_ex_register_io_id_inst; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_ALU_Src; // @[Tile.scala 52:31:@408.4]
  wire [3:0] id_ex_register_io_ALUOp; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_Branch; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_Mem_Read; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_Mem_Write; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_Reg_Write; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_Mem_to_Reg; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_ex_ALU_Src; // @[Tile.scala 52:31:@408.4]
  wire [3:0] id_ex_register_io_ex_ALUOp; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_ex_Branch; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_ex_Mem_Read; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_ex_Mem_Write; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_ex_Reg_Write; // @[Tile.scala 52:31:@408.4]
  wire  id_ex_register_io_ex_Mem_to_Reg; // @[Tile.scala 52:31:@408.4]
  wire [31:0] id_ex_register_io_ex_pc; // @[Tile.scala 52:31:@408.4]
  wire [31:0] id_ex_register_io_ex_rs1_out; // @[Tile.scala 52:31:@408.4]
  wire [31:0] id_ex_register_io_ex_rs2_out; // @[Tile.scala 52:31:@408.4]
  wire [4:0] id_ex_register_io_ex_rd; // @[Tile.scala 52:31:@408.4]
  wire [31:0] id_ex_register_io_ex_imm; // @[Tile.scala 52:31:@408.4]
  wire [31:0] alu_io_Src_A; // @[Tile.scala 53:31:@411.4]
  wire [31:0] alu_io_Src_B; // @[Tile.scala 53:31:@411.4]
  wire [3:0] alu_io_ALUOp; // @[Tile.scala 53:31:@411.4]
  wire [31:0] alu_io_Sum; // @[Tile.scala 53:31:@411.4]
  wire  alu_io_Zero; // @[Tile.scala 53:31:@411.4]
  wire [31:0] datapath_io_if_datapathio_if_pc_branch_addr; // @[Tile.scala 54:31:@414.4]
  wire [31:0] datapath_io_if_datapathio_if_pc; // @[Tile.scala 54:31:@414.4]
  wire [31:0] datapath_io_if_datapathio_if_new_pc; // @[Tile.scala 54:31:@414.4]
  wire [31:0] datapath_io_ex_datapathio_ex_rs2_out; // @[Tile.scala 54:31:@414.4]
  wire [31:0] datapath_io_ex_datapathio_ex_imm; // @[Tile.scala 54:31:@414.4]
  wire [31:0] datapath_io_ex_datapathio_ex_pc; // @[Tile.scala 54:31:@414.4]
  wire  datapath_io_ex_datapathio_ex_ALU_Src; // @[Tile.scala 54:31:@414.4]
  wire [31:0] datapath_io_ex_datapathio_ex_branch_addr; // @[Tile.scala 54:31:@414.4]
  wire [31:0] datapath_io_ex_datapathio_alu_b_src; // @[Tile.scala 54:31:@414.4]
  wire  datapath_io_mem_datapathio_mem_Branch; // @[Tile.scala 54:31:@414.4]
  wire  datapath_io_mem_datapathio_mem_Zero; // @[Tile.scala 54:31:@414.4]
  wire [31:0] datapath_io_wb_datapathio_wb_alu_sum; // @[Tile.scala 54:31:@414.4]
  wire [31:0] datapath_io_wb_datapathio_wb_dataout; // @[Tile.scala 54:31:@414.4]
  wire  datapath_io_wb_datapathio_wb_Mem_to_Reg; // @[Tile.scala 54:31:@414.4]
  wire [31:0] datapath_io_wb_datapathio_wb_reg_writedata; // @[Tile.scala 54:31:@414.4]
  wire  ex_mem_register_clock; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_reset; // @[Tile.scala 55:31:@417.4]
  wire [31:0] ex_mem_register_io_ex_branch_addr; // @[Tile.scala 55:31:@417.4]
  wire [31:0] ex_mem_register_io_ex_alu_sum; // @[Tile.scala 55:31:@417.4]
  wire [31:0] ex_mem_register_io_ex_alu_zero; // @[Tile.scala 55:31:@417.4]
  wire [31:0] ex_mem_register_io_ex_rs2_out; // @[Tile.scala 55:31:@417.4]
  wire [4:0] ex_mem_register_io_ex_rd; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_ex_Branch; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_ex_Mem_Read; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_ex_Mem_Write; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_ex_Reg_Write; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_ex_Mem_to_Reg; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_mem_Branch; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_mem_Mem_Read; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_mem_Mem_Write; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_mem_Reg_Write; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_mem_Mem_to_Reg; // @[Tile.scala 55:31:@417.4]
  wire [31:0] ex_mem_register_io_mem_branch_addr; // @[Tile.scala 55:31:@417.4]
  wire  ex_mem_register_io_mem_alu_zero; // @[Tile.scala 55:31:@417.4]
  wire [31:0] ex_mem_register_io_mem_alu_sum; // @[Tile.scala 55:31:@417.4]
  wire [31:0] ex_mem_register_io_mem_rs2_out; // @[Tile.scala 55:31:@417.4]
  wire [4:0] ex_mem_register_io_mem_rd; // @[Tile.scala 55:31:@417.4]
  wire  datacache_clock; // @[Tile.scala 56:31:@420.4]
  wire [31:0] datacache_io_addr; // @[Tile.scala 56:31:@420.4]
  wire [31:0] datacache_io_write_data; // @[Tile.scala 56:31:@420.4]
  wire  datacache_io_Mem_Read; // @[Tile.scala 56:31:@420.4]
  wire  datacache_io_Mem_Write; // @[Tile.scala 56:31:@420.4]
  wire [31:0] datacache_io_data_out; // @[Tile.scala 56:31:@420.4]
  wire  mem_wb_register_clock; // @[Tile.scala 57:31:@423.4]
  wire  mem_wb_register_reset; // @[Tile.scala 57:31:@423.4]
  wire [31:0] mem_wb_register_io_mem_dataout; // @[Tile.scala 57:31:@423.4]
  wire [31:0] mem_wb_register_io_mem_alu_sum; // @[Tile.scala 57:31:@423.4]
  wire [4:0] mem_wb_register_io_mem_rd; // @[Tile.scala 57:31:@423.4]
  wire  mem_wb_register_io_mem_Mem_to_Reg; // @[Tile.scala 57:31:@423.4]
  wire  mem_wb_register_io_mem_Reg_Write; // @[Tile.scala 57:31:@423.4]
  wire  mem_wb_register_io_wb_Mem_to_Reg; // @[Tile.scala 57:31:@423.4]
  wire  mem_wb_register_io_wb_Reg_Write; // @[Tile.scala 57:31:@423.4]
  wire [31:0] mem_wb_register_io_wb_dataout; // @[Tile.scala 57:31:@423.4]
  wire [31:0] mem_wb_register_io_wb_alu_sum; // @[Tile.scala 57:31:@423.4]
  wire [4:0] mem_wb_register_io_wb_rd; // @[Tile.scala 57:31:@423.4]
  PC pc ( // @[Tile.scala 46:31:@390.4]
    .clock(pc_clock),
    .reset(pc_reset),
    .io_addr_input(pc_io_addr_input),
    .io_pc_write(pc_io_pc_write),
    .io_pc_out(pc_io_pc_out)
  );
  InstCache instcache ( // @[Tile.scala 47:31:@393.4]
    .clock(instcache_clock),
    .io_addr(instcache_io_addr),
    .io_inst(instcache_io_inst)
  );
  IF_ID_Register if_id_register ( // @[Tile.scala 48:31:@396.4]
    .clock(if_id_register_clock),
    .reset(if_id_register_reset),
    .io_if_pc(if_id_register_io_if_pc),
    .io_if_inst(if_id_register_io_if_inst),
    .io_if_id_write(if_id_register_io_if_id_write),
    .io_if_flush(if_id_register_io_if_flush),
    .io_id_rs1(if_id_register_io_id_rs1),
    .io_id_rs2(if_id_register_io_id_rs2),
    .io_id_pc(if_id_register_io_id_pc),
    .io_id_inst(if_id_register_io_id_inst)
  );
  RegFile regfile ( // @[Tile.scala 49:31:@399.4]
    .clock(regfile_clock),
    .io_rs1(regfile_io_rs1),
    .io_rs2(regfile_io_rs2),
    .io_rd(regfile_io_rd),
    .io_wdata(regfile_io_wdata),
    .io_regwrite(regfile_io_regwrite),
    .io_rs1_out(regfile_io_rs1_out),
    .io_rs2_out(regfile_io_rs2_out)
  );
  ImmGen immgen ( // @[Tile.scala 50:31:@402.4]
    .io_inst_in(immgen_io_inst_in),
    .io_imm_sel(immgen_io_imm_sel),
    .io_imm(immgen_io_imm)
  );
  Control control ( // @[Tile.scala 51:31:@405.4]
    .io_inst(control_io_inst),
    .io_Reg_Write(control_io_Reg_Write),
    .io_Imm_Sel(control_io_Imm_Sel),
    .io_ALU_Src(control_io_ALU_Src),
    .io_ALUOp(control_io_ALUOp),
    .io_Branch(control_io_Branch),
    .io_Mem_Read(control_io_Mem_Read),
    .io_Mem_Write(control_io_Mem_Write),
    .io_Mem_to_Reg(control_io_Mem_to_Reg)
  );
  ID_EX_Register id_ex_register ( // @[Tile.scala 52:31:@408.4]
    .clock(id_ex_register_clock),
    .reset(id_ex_register_reset),
    .io_id_pc(id_ex_register_io_id_pc),
    .io_id_rs1_out(id_ex_register_io_id_rs1_out),
    .io_id_rs2_out(id_ex_register_io_id_rs2_out),
    .io_id_imm(id_ex_register_io_id_imm),
    .io_id_inst(id_ex_register_io_id_inst),
    .io_ALU_Src(id_ex_register_io_ALU_Src),
    .io_ALUOp(id_ex_register_io_ALUOp),
    .io_Branch(id_ex_register_io_Branch),
    .io_Mem_Read(id_ex_register_io_Mem_Read),
    .io_Mem_Write(id_ex_register_io_Mem_Write),
    .io_Reg_Write(id_ex_register_io_Reg_Write),
    .io_Mem_to_Reg(id_ex_register_io_Mem_to_Reg),
    .io_ex_ALU_Src(id_ex_register_io_ex_ALU_Src),
    .io_ex_ALUOp(id_ex_register_io_ex_ALUOp),
    .io_ex_Branch(id_ex_register_io_ex_Branch),
    .io_ex_Mem_Read(id_ex_register_io_ex_Mem_Read),
    .io_ex_Mem_Write(id_ex_register_io_ex_Mem_Write),
    .io_ex_Reg_Write(id_ex_register_io_ex_Reg_Write),
    .io_ex_Mem_to_Reg(id_ex_register_io_ex_Mem_to_Reg),
    .io_ex_pc(id_ex_register_io_ex_pc),
    .io_ex_rs1_out(id_ex_register_io_ex_rs1_out),
    .io_ex_rs2_out(id_ex_register_io_ex_rs2_out),
    .io_ex_rd(id_ex_register_io_ex_rd),
    .io_ex_imm(id_ex_register_io_ex_imm)
  );
  ALU alu ( // @[Tile.scala 53:31:@411.4]
    .io_Src_A(alu_io_Src_A),
    .io_Src_B(alu_io_Src_B),
    .io_ALUOp(alu_io_ALUOp),
    .io_Sum(alu_io_Sum),
    .io_Zero(alu_io_Zero)
  );
  Datapath datapath ( // @[Tile.scala 54:31:@414.4]
    .io_if_datapathio_if_pc_branch_addr(datapath_io_if_datapathio_if_pc_branch_addr),
    .io_if_datapathio_if_pc(datapath_io_if_datapathio_if_pc),
    .io_if_datapathio_if_new_pc(datapath_io_if_datapathio_if_new_pc),
    .io_ex_datapathio_ex_rs2_out(datapath_io_ex_datapathio_ex_rs2_out),
    .io_ex_datapathio_ex_imm(datapath_io_ex_datapathio_ex_imm),
    .io_ex_datapathio_ex_pc(datapath_io_ex_datapathio_ex_pc),
    .io_ex_datapathio_ex_ALU_Src(datapath_io_ex_datapathio_ex_ALU_Src),
    .io_ex_datapathio_ex_branch_addr(datapath_io_ex_datapathio_ex_branch_addr),
    .io_ex_datapathio_alu_b_src(datapath_io_ex_datapathio_alu_b_src),
    .io_mem_datapathio_mem_Branch(datapath_io_mem_datapathio_mem_Branch),
    .io_mem_datapathio_mem_Zero(datapath_io_mem_datapathio_mem_Zero),
    .io_wb_datapathio_wb_alu_sum(datapath_io_wb_datapathio_wb_alu_sum),
    .io_wb_datapathio_wb_dataout(datapath_io_wb_datapathio_wb_dataout),
    .io_wb_datapathio_wb_Mem_to_Reg(datapath_io_wb_datapathio_wb_Mem_to_Reg),
    .io_wb_datapathio_wb_reg_writedata(datapath_io_wb_datapathio_wb_reg_writedata)
  );
  EX_MEM_Register ex_mem_register ( // @[Tile.scala 55:31:@417.4]
    .clock(ex_mem_register_clock),
    .reset(ex_mem_register_reset),
    .io_ex_branch_addr(ex_mem_register_io_ex_branch_addr),
    .io_ex_alu_sum(ex_mem_register_io_ex_alu_sum),
    .io_ex_alu_zero(ex_mem_register_io_ex_alu_zero),
    .io_ex_rs2_out(ex_mem_register_io_ex_rs2_out),
    .io_ex_rd(ex_mem_register_io_ex_rd),
    .io_ex_Branch(ex_mem_register_io_ex_Branch),
    .io_ex_Mem_Read(ex_mem_register_io_ex_Mem_Read),
    .io_ex_Mem_Write(ex_mem_register_io_ex_Mem_Write),
    .io_ex_Reg_Write(ex_mem_register_io_ex_Reg_Write),
    .io_ex_Mem_to_Reg(ex_mem_register_io_ex_Mem_to_Reg),
    .io_mem_Branch(ex_mem_register_io_mem_Branch),
    .io_mem_Mem_Read(ex_mem_register_io_mem_Mem_Read),
    .io_mem_Mem_Write(ex_mem_register_io_mem_Mem_Write),
    .io_mem_Reg_Write(ex_mem_register_io_mem_Reg_Write),
    .io_mem_Mem_to_Reg(ex_mem_register_io_mem_Mem_to_Reg),
    .io_mem_branch_addr(ex_mem_register_io_mem_branch_addr),
    .io_mem_alu_zero(ex_mem_register_io_mem_alu_zero),
    .io_mem_alu_sum(ex_mem_register_io_mem_alu_sum),
    .io_mem_rs2_out(ex_mem_register_io_mem_rs2_out),
    .io_mem_rd(ex_mem_register_io_mem_rd)
  );
  DataCache datacache ( // @[Tile.scala 56:31:@420.4]
    .clock(datacache_clock),
    .io_addr(datacache_io_addr),
    .io_write_data(datacache_io_write_data),
    .io_Mem_Read(datacache_io_Mem_Read),
    .io_Mem_Write(datacache_io_Mem_Write),
    .io_data_out(datacache_io_data_out)
  );
  MEM_WB_Register mem_wb_register ( // @[Tile.scala 57:31:@423.4]
    .clock(mem_wb_register_clock),
    .reset(mem_wb_register_reset),
    .io_mem_dataout(mem_wb_register_io_mem_dataout),
    .io_mem_alu_sum(mem_wb_register_io_mem_alu_sum),
    .io_mem_rd(mem_wb_register_io_mem_rd),
    .io_mem_Mem_to_Reg(mem_wb_register_io_mem_Mem_to_Reg),
    .io_mem_Reg_Write(mem_wb_register_io_mem_Reg_Write),
    .io_wb_Mem_to_Reg(mem_wb_register_io_wb_Mem_to_Reg),
    .io_wb_Reg_Write(mem_wb_register_io_wb_Reg_Write),
    .io_wb_dataout(mem_wb_register_io_wb_dataout),
    .io_wb_alu_sum(mem_wb_register_io_wb_alu_sum),
    .io_wb_rd(mem_wb_register_io_wb_rd)
  );
  assign io_if_pc_out = pc_io_addr_input; // @[Tile.scala 72:16:@431.4]
  assign io_if_next_pc = datapath_io_if_datapathio_if_new_pc; // @[Tile.scala 73:17:@432.4]
  assign io_id_rs1 = if_id_register_io_id_rs1; // @[Tile.scala 98:13:@445.4]
  assign io_id_rs2 = if_id_register_io_id_rs2; // @[Tile.scala 99:13:@446.4]
  assign io_id_rs1_out = regfile_io_rs1_out; // @[Tile.scala 100:17:@447.4]
  assign io_id_rs2_out = regfile_io_rs2_out; // @[Tile.scala 101:17:@448.4]
  assign io_ex_rs1_out = id_ex_register_io_ex_rs1_out; // @[Tile.scala 138:17:@470.4]
  assign io_ex_rs2_out = id_ex_register_io_ex_rs2_out; // @[Tile.scala 139:17:@471.4]
  assign io_ex_alu_sum = alu_io_Sum; // @[Tile.scala 140:17:@472.4]
  assign io_ex_alu_zero = alu_io_Zero; // @[Tile.scala 141:18:@473.4]
  assign io_ex_branch_addr = datapath_io_ex_datapathio_ex_branch_addr; // @[Tile.scala 142:21:@474.4]
  assign io_ex_rd = id_ex_register_io_ex_rd; // @[Tile.scala 143:12:@475.4]
  assign io_mem_rd = ex_mem_register_io_mem_rd; // @[Tile.scala 170:13:@492.4]
  assign io_mem_branch_addr = ex_mem_register_io_mem_branch_addr; // @[Tile.scala 171:22:@493.4]
  assign io_mem_alu_sum = ex_mem_register_io_mem_alu_sum; // @[Tile.scala 172:18:@494.4]
  assign io_mem_writedata = ex_mem_register_io_mem_rs2_out; // @[Tile.scala 173:20:@495.4]
  assign io_mem_dataout = datacache_io_data_out; // @[Tile.scala 174:18:@496.4]
  assign io_wb_rd = mem_wb_register_io_wb_rd; // @[Tile.scala 190:12:@505.4]
  assign io_wb_registerwrite = datapath_io_wb_datapathio_wb_reg_writedata; // @[Tile.scala 191:23:@506.4]
  assign pc_clock = clock; // @[:@391.4]
  assign pc_reset = reset; // @[:@392.4]
  assign pc_io_addr_input = datapath_io_if_datapathio_if_new_pc; // @[Tile.scala 65:20:@428.4]
  assign pc_io_pc_write = io_pc_write; // @[Tile.scala 66:20:@429.4]
  assign instcache_clock = clock; // @[:@394.4]
  assign instcache_io_addr = pc_io_pc_out; // @[Tile.scala 69:21:@430.4]
  assign if_id_register_clock = clock; // @[:@397.4]
  assign if_id_register_reset = reset; // @[:@398.4]
  assign if_id_register_io_if_pc = pc_io_pc_out; // @[Tile.scala 80:33:@436.4]
  assign if_id_register_io_if_inst = instcache_io_inst; // @[Tile.scala 79:33:@435.4]
  assign if_id_register_io_if_id_write = io_if_id_write; // @[Tile.scala 77:33:@433.4]
  assign if_id_register_io_if_flush = io_if_flush; // @[Tile.scala 78:33:@434.4]
  assign regfile_clock = clock; // @[:@400.4]
  assign regfile_io_rs1 = if_id_register_io_id_rs1; // @[Tile.scala 87:23:@438.4]
  assign regfile_io_rs2 = if_id_register_io_id_rs2; // @[Tile.scala 88:23:@439.4]
  assign regfile_io_rd = mem_wb_register_io_wb_rd; // @[Tile.scala 89:23:@440.4]
  assign regfile_io_wdata = datapath_io_wb_datapathio_wb_reg_writedata; // @[Tile.scala 90:23:@441.4]
  assign regfile_io_regwrite = mem_wb_register_io_wb_Reg_Write; // @[Tile.scala 91:23:@442.4]
  assign immgen_io_inst_in = if_id_register_io_id_inst; // @[Tile.scala 94:23:@443.4]
  assign immgen_io_imm_sel = control_io_Imm_Sel; // @[Tile.scala 95:23:@444.4]
  assign control_io_inst = if_id_register_io_id_inst; // @[Tile.scala 84:23:@437.4]
  assign id_ex_register_clock = clock; // @[:@409.4]
  assign id_ex_register_reset = reset; // @[:@410.4]
  assign id_ex_register_io_id_pc = if_id_register_io_id_pc; // @[Tile.scala 119:32:@460.4]
  assign id_ex_register_io_id_rs1_out = regfile_io_rs1_out; // @[Tile.scala 115:32:@456.4]
  assign id_ex_register_io_id_rs2_out = regfile_io_rs2_out; // @[Tile.scala 116:32:@457.4]
  assign id_ex_register_io_id_imm = immgen_io_imm; // @[Tile.scala 121:32:@462.4]
  assign id_ex_register_io_id_inst = if_id_register_io_id_inst; // @[Tile.scala 120:32:@461.4]
  assign id_ex_register_io_ALU_Src = control_io_ALU_Src; // @[Tile.scala 106:33:@449.4]
  assign id_ex_register_io_ALUOp = control_io_ALUOp; // @[Tile.scala 107:33:@450.4]
  assign id_ex_register_io_Branch = control_io_Branch; // @[Tile.scala 108:33:@451.4]
  assign id_ex_register_io_Mem_Read = control_io_Mem_Read; // @[Tile.scala 109:33:@452.4]
  assign id_ex_register_io_Mem_Write = control_io_Mem_Write; // @[Tile.scala 110:33:@453.4]
  assign id_ex_register_io_Reg_Write = control_io_Reg_Write; // @[Tile.scala 111:33:@454.4]
  assign id_ex_register_io_Mem_to_Reg = control_io_Mem_to_Reg; // @[Tile.scala 112:33:@455.4]
  assign alu_io_Src_A = id_ex_register_io_ex_rs1_out; // @[Tile.scala 133:16:@467.4]
  assign alu_io_Src_B = datapath_io_ex_datapathio_alu_b_src; // @[Tile.scala 134:16:@468.4]
  assign alu_io_ALUOp = id_ex_register_io_ex_ALUOp; // @[Tile.scala 135:16:@469.4]
  assign datapath_io_if_datapathio_if_pc_branch_addr = ex_mem_register_io_mem_branch_addr; // @[Tile.scala 61:47:@426.4]
  assign datapath_io_if_datapathio_if_pc = pc_io_pc_out; // @[Tile.scala 62:47:@427.4]
  assign datapath_io_ex_datapathio_ex_rs2_out = id_ex_register_io_ex_rs2_out; // @[Tile.scala 129:40:@465.4]
  assign datapath_io_ex_datapathio_ex_imm = id_ex_register_io_ex_imm; // @[Tile.scala 126:37:@464.4]
  assign datapath_io_ex_datapathio_ex_pc = id_ex_register_io_ex_pc; // @[Tile.scala 125:37:@463.4]
  assign datapath_io_ex_datapathio_ex_ALU_Src = id_ex_register_io_ex_ALU_Src; // @[Tile.scala 130:40:@466.4]
  assign datapath_io_mem_datapathio_mem_Branch = ex_mem_register_io_mem_Branch; // @[Tile.scala 166:41:@490.4]
  assign datapath_io_mem_datapathio_mem_Zero = ex_mem_register_io_mem_alu_zero; // @[Tile.scala 167:41:@491.4]
  assign datapath_io_wb_datapathio_wb_alu_sum = mem_wb_register_io_wb_alu_sum; // @[Tile.scala 185:40:@502.4]
  assign datapath_io_wb_datapathio_wb_dataout = mem_wb_register_io_wb_dataout; // @[Tile.scala 186:40:@503.4]
  assign datapath_io_wb_datapathio_wb_Mem_to_Reg = mem_wb_register_io_wb_Mem_to_Reg; // @[Tile.scala 187:43:@504.4]
  assign ex_mem_register_clock = clock; // @[:@418.4]
  assign ex_mem_register_reset = reset; // @[:@419.4]
  assign ex_mem_register_io_ex_branch_addr = datapath_io_ex_datapathio_ex_branch_addr; // @[Tile.scala 147:37:@476.4]
  assign ex_mem_register_io_ex_alu_sum = alu_io_Sum; // @[Tile.scala 148:37:@477.4]
  assign ex_mem_register_io_ex_alu_zero = {{31'd0}, alu_io_Zero}; // @[Tile.scala 149:37:@478.4]
  assign ex_mem_register_io_ex_rs2_out = id_ex_register_io_ex_rs2_out; // @[Tile.scala 150:37:@479.4]
  assign ex_mem_register_io_ex_rd = id_ex_register_io_ex_rd; // @[Tile.scala 151:37:@480.4]
  assign ex_mem_register_io_ex_Branch = id_ex_register_io_ex_Branch; // @[Tile.scala 152:37:@481.4]
  assign ex_mem_register_io_ex_Mem_Read = id_ex_register_io_ex_Mem_Read; // @[Tile.scala 153:37:@482.4]
  assign ex_mem_register_io_ex_Mem_Write = id_ex_register_io_ex_Mem_Write; // @[Tile.scala 154:37:@483.4]
  assign ex_mem_register_io_ex_Reg_Write = id_ex_register_io_ex_Reg_Write; // @[Tile.scala 155:37:@484.4]
  assign ex_mem_register_io_ex_Mem_to_Reg = id_ex_register_io_ex_Mem_to_Reg; // @[Tile.scala 156:37:@485.4]
  assign datacache_clock = clock; // @[:@421.4]
  assign datacache_io_addr = ex_mem_register_io_mem_alu_sum; // @[Tile.scala 160:27:@486.4]
  assign datacache_io_write_data = ex_mem_register_io_mem_rs2_out; // @[Tile.scala 161:27:@487.4]
  assign datacache_io_Mem_Read = ex_mem_register_io_mem_Mem_Read; // @[Tile.scala 162:27:@488.4]
  assign datacache_io_Mem_Write = ex_mem_register_io_mem_Mem_Write; // @[Tile.scala 163:27:@489.4]
  assign mem_wb_register_clock = clock; // @[:@424.4]
  assign mem_wb_register_reset = reset; // @[:@425.4]
  assign mem_wb_register_io_mem_dataout = datacache_io_data_out; // @[Tile.scala 180:34:@499.4]
  assign mem_wb_register_io_mem_alu_sum = ex_mem_register_io_mem_alu_sum; // @[Tile.scala 181:34:@500.4]
  assign mem_wb_register_io_mem_rd = ex_mem_register_io_mem_rd; // @[Tile.scala 182:34:@501.4]
  assign mem_wb_register_io_mem_Mem_to_Reg = ex_mem_register_io_mem_Mem_to_Reg; // @[Tile.scala 179:37:@498.4]
  assign mem_wb_register_io_mem_Reg_Write = ex_mem_register_io_mem_Reg_Write; // @[Tile.scala 178:36:@497.4]
endmodule
