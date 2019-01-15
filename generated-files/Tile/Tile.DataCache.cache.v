module BindsTo_2_DataCache( // @[:@968.2]
  input         clock, // @[:@969.4]
  input  [31:0] io_addr, // @[:@971.4]
  input  [31:0] io_write_data, // @[:@971.4]
  input         io_Mem_Read, // @[:@971.4]
  input         io_Mem_Write, // @[:@971.4]
  input  [1:0]  io_Data_Size, // @[:@971.4]
  input         io_Load_Type, // @[:@971.4]
  output [31:0] io_data_out // @[:@971.4]
);

initial begin
  $readmemh("initmem/datacache.txt", DataCache.cache);
end
                      endmodule

bind DataCache BindsTo_2_DataCache BindsTo_2_DataCache_Inst(.*);