module BindsTo_2_DataCache( // @[:@921.2]
  input         clock, // @[:@922.4]
  input  [31:0] io_addr, // @[:@924.4]
  input  [31:0] io_write_data, // @[:@924.4]
  input         io_Mem_Read, // @[:@924.4]
  input         io_Mem_Write, // @[:@924.4]
  input  [1:0]  io_Data_Size, // @[:@924.4]
  input         io_Load_Type, // @[:@924.4]
  output [31:0] io_data_out // @[:@924.4]
);

initial begin
  $readmemh("initmem/datacache.txt", DataCache.cache);
end
                      endmodule

bind DataCache BindsTo_2_DataCache BindsTo_2_DataCache_Inst(.*);