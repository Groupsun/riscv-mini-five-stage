module RegFile( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [4:0]  io_rs1, // @[:@6.4]
  input  [4:0]  io_rs2, // @[:@6.4]
  input  [4:0]  io_rd, // @[:@6.4]
  input  [31:0] io_wdata, // @[:@6.4]
  input         io_regwrite, // @[:@6.4]
  output [31:0] io_rs1_out, // @[:@6.4]
  output [31:0] io_rs2_out // @[:@6.4]
);
  reg [31:0] regfile [0:31]; // @[RegFile.scala 26:20:@8.4]
  reg [31:0] _RAND_0;
  wire [31:0] regfile__T_36_data; // @[RegFile.scala 26:20:@8.4]
  wire [4:0] regfile__T_36_addr; // @[RegFile.scala 26:20:@8.4]
  wire [31:0] regfile__T_37_data; // @[RegFile.scala 26:20:@8.4]
  wire [4:0] regfile__T_37_addr; // @[RegFile.scala 26:20:@8.4]
  wire [31:0] regfile__T_44_data; // @[RegFile.scala 26:20:@8.4]
  wire [4:0] regfile__T_44_addr; // @[RegFile.scala 26:20:@8.4]
  wire [31:0] regfile__T_22_data; // @[RegFile.scala 26:20:@8.4]
  wire [4:0] regfile__T_22_addr; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_22_mask; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_22_en; // @[RegFile.scala 26:20:@8.4]
  wire [31:0] regfile__T_25_data; // @[RegFile.scala 26:20:@8.4]
  wire [4:0] regfile__T_25_addr; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_25_mask; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_25_en; // @[RegFile.scala 26:20:@8.4]
  wire [31:0] regfile__T_28_data; // @[RegFile.scala 26:20:@8.4]
  wire [4:0] regfile__T_28_addr; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_28_mask; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_28_en; // @[RegFile.scala 26:20:@8.4]
  wire [31:0] regfile__T_31_data; // @[RegFile.scala 26:20:@8.4]
  wire [4:0] regfile__T_31_addr; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_31_mask; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_31_en; // @[RegFile.scala 26:20:@8.4]
  wire [31:0] regfile__T_34_data; // @[RegFile.scala 26:20:@8.4]
  wire [4:0] regfile__T_34_addr; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_34_mask; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_34_en; // @[RegFile.scala 26:20:@8.4]
  wire [31:0] regfile__T_38_data; // @[RegFile.scala 26:20:@8.4]
  wire [4:0] regfile__T_38_addr; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_38_mask; // @[RegFile.scala 26:20:@8.4]
  wire  regfile__T_38_en; // @[RegFile.scala 26:20:@8.4]
  wire  _T_41; // @[RegFile.scala 40:57:@25.4]
  wire [31:0] _T_43; // @[RegFile.scala 40:50:@26.4]
  assign regfile__T_36_addr = io_rs1;
  assign regfile__T_36_data = regfile[regfile__T_36_addr]; // @[RegFile.scala 26:20:@8.4]
  assign regfile__T_37_addr = io_rs2;
  assign regfile__T_37_data = regfile[regfile__T_37_addr]; // @[RegFile.scala 26:20:@8.4]
  assign regfile__T_44_addr = io_rd;
  assign regfile__T_44_data = regfile[regfile__T_44_addr]; // @[RegFile.scala 26:20:@8.4]
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
  assign _T_41 = io_rd == 5'h0; // @[RegFile.scala 40:57:@25.4]
  assign _T_43 = _T_41 ? 32'h0 : io_wdata; // @[RegFile.scala 40:50:@26.4]
  assign io_rs1_out = regfile__T_36_data; // @[RegFile.scala 37:14:@20.4]
  assign io_rs2_out = regfile__T_37_data; // @[RegFile.scala 38:14:@22.4]
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
      regfile[regfile__T_22_addr] <= regfile__T_22_data; // @[RegFile.scala 26:20:@8.4]
    end
    if(regfile__T_25_en & regfile__T_25_mask) begin
      regfile[regfile__T_25_addr] <= regfile__T_25_data; // @[RegFile.scala 26:20:@8.4]
    end
    if(regfile__T_28_en & regfile__T_28_mask) begin
      regfile[regfile__T_28_addr] <= regfile__T_28_data; // @[RegFile.scala 26:20:@8.4]
    end
    if(regfile__T_31_en & regfile__T_31_mask) begin
      regfile[regfile__T_31_addr] <= regfile__T_31_data; // @[RegFile.scala 26:20:@8.4]
    end
    if(regfile__T_34_en & regfile__T_34_mask) begin
      regfile[regfile__T_34_addr] <= regfile__T_34_data; // @[RegFile.scala 26:20:@8.4]
    end
    if(regfile__T_38_en & regfile__T_38_mask) begin
      regfile[regfile__T_38_addr] <= regfile__T_38_data; // @[RegFile.scala 26:20:@8.4]
    end
  end
endmodule
