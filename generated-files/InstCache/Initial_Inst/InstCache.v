module InstCache( // @[:@3.2]
  input         clock, // @[:@4.4]
  input         reset, // @[:@5.4]
  input  [31:0] io_addr, // @[:@6.4]
  output [31:0] io_Inst // @[:@6.4]
);
  reg [7:0] cache [0:127]; // @[InstCache.scala 19:18:@8.4]
  reg [31:0] _RAND_0;
  wire [7:0] cache__T_60_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_60_addr; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_65_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_65_addr; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_70_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_70_addr; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_75_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_75_addr; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_12_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_12_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_12_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_12_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_15_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_15_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_15_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_15_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_18_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_18_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_18_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_18_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_21_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_21_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_21_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_21_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_24_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_24_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_24_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_24_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_27_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_27_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_27_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_27_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_30_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_30_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_30_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_30_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_33_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_33_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_33_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_33_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_36_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_36_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_36_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_36_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_39_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_39_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_39_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_39_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_42_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_42_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_42_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_42_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_45_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_45_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_45_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_45_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_48_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_48_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_48_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_48_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_51_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_51_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_51_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_51_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_54_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_54_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_54_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_54_en; // @[InstCache.scala 19:18:@8.4]
  wire [7:0] cache__T_57_data; // @[InstCache.scala 19:18:@8.4]
  wire [6:0] cache__T_57_addr; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_57_mask; // @[InstCache.scala 19:18:@8.4]
  wire  cache__T_57_en; // @[InstCache.scala 19:18:@8.4]
  wire [32:0] _T_62; // @[InstCache.scala 47:48:@43.4]
  wire [31:0] _T_63; // @[InstCache.scala 47:48:@44.4]
  wire [32:0] _T_67; // @[InstCache.scala 47:70:@47.4]
  wire [31:0] _T_68; // @[InstCache.scala 47:70:@48.4]
  wire [32:0] _T_72; // @[InstCache.scala 47:92:@51.4]
  wire [31:0] _T_73; // @[InstCache.scala 47:92:@52.4]
  wire [15:0] _T_76; // @[Cat.scala 30:58:@55.4]
  wire [15:0] _T_77; // @[Cat.scala 30:58:@56.4]
  assign cache__T_60_addr = io_addr[6:0];
  assign cache__T_60_data = cache[cache__T_60_addr]; // @[InstCache.scala 19:18:@8.4]
  assign cache__T_65_addr = _T_63[6:0];
  assign cache__T_65_data = cache[cache__T_65_addr]; // @[InstCache.scala 19:18:@8.4]
  assign cache__T_70_addr = _T_68[6:0];
  assign cache__T_70_data = cache[cache__T_70_addr]; // @[InstCache.scala 19:18:@8.4]
  assign cache__T_75_addr = _T_73[6:0];
  assign cache__T_75_data = cache[cache__T_75_addr]; // @[InstCache.scala 19:18:@8.4]
  assign cache__T_12_data = 8'h0;
  assign cache__T_12_addr = 7'h0;
  assign cache__T_12_mask = 1'h1;
  assign cache__T_12_en = 1'h1;
  assign cache__T_15_data = 8'h0;
  assign cache__T_15_addr = 7'h1;
  assign cache__T_15_mask = 1'h1;
  assign cache__T_15_en = 1'h1;
  assign cache__T_18_data = 8'h0;
  assign cache__T_18_addr = 7'h2;
  assign cache__T_18_mask = 1'h1;
  assign cache__T_18_en = 1'h1;
  assign cache__T_21_data = 8'h83;
  assign cache__T_21_addr = 7'h3;
  assign cache__T_21_mask = 1'h1;
  assign cache__T_21_en = 1'h1;
  assign cache__T_24_data = 8'h0;
  assign cache__T_24_addr = 7'h4;
  assign cache__T_24_mask = 1'h1;
  assign cache__T_24_en = 1'h1;
  assign cache__T_27_data = 8'h40;
  assign cache__T_27_addr = 7'h5;
  assign cache__T_27_mask = 1'h1;
  assign cache__T_27_en = 1'h1;
  assign cache__T_30_data = 8'h1;
  assign cache__T_30_addr = 7'h6;
  assign cache__T_30_mask = 1'h1;
  assign cache__T_30_en = 1'h1;
  assign cache__T_33_data = 8'h3;
  assign cache__T_33_addr = 7'h7;
  assign cache__T_33_mask = 1'h1;
  assign cache__T_33_en = 1'h1;
  assign cache__T_36_data = 8'h0;
  assign cache__T_36_addr = 7'h8;
  assign cache__T_36_mask = 1'h1;
  assign cache__T_36_en = 1'h1;
  assign cache__T_39_data = 8'h20;
  assign cache__T_39_addr = 7'h9;
  assign cache__T_39_mask = 1'h1;
  assign cache__T_39_en = 1'h1;
  assign cache__T_42_data = 8'h81;
  assign cache__T_42_addr = 7'ha;
  assign cache__T_42_mask = 1'h1;
  assign cache__T_42_en = 1'h1;
  assign cache__T_45_data = 8'hb3;
  assign cache__T_45_addr = 7'hb;
  assign cache__T_45_mask = 1'h1;
  assign cache__T_45_en = 1'h1;
  assign cache__T_48_data = 8'h0;
  assign cache__T_48_addr = 7'hc;
  assign cache__T_48_mask = 1'h1;
  assign cache__T_48_en = 1'h1;
  assign cache__T_51_data = 8'h30;
  assign cache__T_51_addr = 7'hd;
  assign cache__T_51_mask = 1'h1;
  assign cache__T_51_en = 1'h1;
  assign cache__T_54_data = 8'h24;
  assign cache__T_54_addr = 7'he;
  assign cache__T_54_mask = 1'h1;
  assign cache__T_54_en = 1'h1;
  assign cache__T_57_data = 8'h23;
  assign cache__T_57_addr = 7'hf;
  assign cache__T_57_mask = 1'h1;
  assign cache__T_57_en = 1'h1;
  assign _T_62 = io_addr + 32'h1; // @[InstCache.scala 47:48:@43.4]
  assign _T_63 = io_addr + 32'h1; // @[InstCache.scala 47:48:@44.4]
  assign _T_67 = io_addr + 32'h2; // @[InstCache.scala 47:70:@47.4]
  assign _T_68 = io_addr + 32'h2; // @[InstCache.scala 47:70:@48.4]
  assign _T_72 = io_addr + 32'h3; // @[InstCache.scala 47:92:@51.4]
  assign _T_73 = io_addr + 32'h3; // @[InstCache.scala 47:92:@52.4]
  assign _T_76 = {cache__T_70_data,cache__T_75_data}; // @[Cat.scala 30:58:@55.4]
  assign _T_77 = {cache__T_60_data,cache__T_65_data}; // @[Cat.scala 30:58:@56.4]
  assign io_Inst = {_T_77,_T_76}; // @[InstCache.scala 47:11:@58.4]
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
  always @(posedge clock) begin
    if(cache__T_12_en & cache__T_12_mask) begin
      cache[cache__T_12_addr] <= cache__T_12_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_15_en & cache__T_15_mask) begin
      cache[cache__T_15_addr] <= cache__T_15_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_18_en & cache__T_18_mask) begin
      cache[cache__T_18_addr] <= cache__T_18_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_21_en & cache__T_21_mask) begin
      cache[cache__T_21_addr] <= cache__T_21_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_24_en & cache__T_24_mask) begin
      cache[cache__T_24_addr] <= cache__T_24_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_27_en & cache__T_27_mask) begin
      cache[cache__T_27_addr] <= cache__T_27_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_30_en & cache__T_30_mask) begin
      cache[cache__T_30_addr] <= cache__T_30_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_33_en & cache__T_33_mask) begin
      cache[cache__T_33_addr] <= cache__T_33_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_36_en & cache__T_36_mask) begin
      cache[cache__T_36_addr] <= cache__T_36_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_39_en & cache__T_39_mask) begin
      cache[cache__T_39_addr] <= cache__T_39_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_42_en & cache__T_42_mask) begin
      cache[cache__T_42_addr] <= cache__T_42_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_45_en & cache__T_45_mask) begin
      cache[cache__T_45_addr] <= cache__T_45_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_48_en & cache__T_48_mask) begin
      cache[cache__T_48_addr] <= cache__T_48_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_51_en & cache__T_51_mask) begin
      cache[cache__T_51_addr] <= cache__T_51_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_54_en & cache__T_54_mask) begin
      cache[cache__T_54_addr] <= cache__T_54_data; // @[InstCache.scala 19:18:@8.4]
    end
    if(cache__T_57_en & cache__T_57_mask) begin
      cache[cache__T_57_addr] <= cache__T_57_data; // @[InstCache.scala 19:18:@8.4]
    end
  end
endmodule
