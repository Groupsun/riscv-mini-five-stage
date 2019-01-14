module BindsTo_1_RegFile( // @[:@70.2]
  input         clock, // @[:@71.4]
  input  [4:0]  io_rs1, // @[:@73.4]
  input  [4:0]  io_rs2, // @[:@73.4]
  input  [4:0]  io_rd, // @[:@73.4]
  input  [31:0] io_wdata, // @[:@73.4]
  input         io_regwrite, // @[:@73.4]
  output [31:0] io_rs1_out, // @[:@73.4]
  output [31:0] io_rs2_out // @[:@73.4]
);

initial begin
  $readmemh("initmem/regfile.txt", RegFile.regfile);
end
                      endmodule

bind RegFile BindsTo_1_RegFile BindsTo_1_RegFile_Inst(.*);