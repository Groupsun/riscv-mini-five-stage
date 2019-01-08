;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit DataCache : 
  module DataCache : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip addr : UInt<32>, flip write_data : UInt<32>, flip Mem_Read : UInt<1>, flip Mem_Write : UInt<1>, data_out : UInt<32>}
    
    cmem cache : UInt<32>[32] @[DataCache.scala 27:18]
    node fix_addr = div(io.addr, UInt<3>("h04")) @[DataCache.scala 29:26]
    node _T_18 = bits(fix_addr, 4, 0) @[DataCache.scala 30:8]
    infer mport _T_19 = cache[_T_18], clock @[DataCache.scala 30:8]
    node _T_20 = bits(io.Mem_Write, 0, 0) @[DataCache.scala 30:45]
    node _T_21 = bits(fix_addr, 4, 0) @[DataCache.scala 30:69]
    infer mport _T_22 = cache[_T_21], clock @[DataCache.scala 30:69]
    node _T_23 = mux(_T_20, io.write_data, _T_22) @[DataCache.scala 30:25]
    _T_19 <= _T_23 @[DataCache.scala 30:19]
    node _T_24 = bits(io.Mem_Read, 0, 0) @[DataCache.scala 31:40]
    node _T_25 = bits(fix_addr, 4, 0) @[DataCache.scala 31:49]
    infer mport _T_26 = cache[_T_25], clock @[DataCache.scala 31:49]
    node _T_28 = mux(_T_24, _T_26, UInt<1>("h00")) @[DataCache.scala 31:21]
    io.data_out <= _T_28 @[DataCache.scala 31:15]
    
