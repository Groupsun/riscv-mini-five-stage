;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit InstCache : 
  module InstCache : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip addr : UInt<32>, inst : UInt<32>}
    
    cmem cache : UInt<8>[128] @[InstCache.scala 30:18]
    node _T_11 = bits(io.addr, 6, 0) @[InstCache.scala 56:23]
    infer mport _T_12 = cache[_T_11], clock @[InstCache.scala 56:23]
    node _T_14 = add(io.addr, UInt<1>("h01")) @[InstCache.scala 56:48]
    node _T_15 = tail(_T_14, 1) @[InstCache.scala 56:48]
    node _T_16 = bits(_T_15, 6, 0) @[InstCache.scala 56:39]
    infer mport _T_17 = cache[_T_16], clock @[InstCache.scala 56:39]
    node _T_19 = add(io.addr, UInt<2>("h02")) @[InstCache.scala 56:70]
    node _T_20 = tail(_T_19, 1) @[InstCache.scala 56:70]
    node _T_21 = bits(_T_20, 6, 0) @[InstCache.scala 56:61]
    infer mport _T_22 = cache[_T_21], clock @[InstCache.scala 56:61]
    node _T_24 = add(io.addr, UInt<2>("h03")) @[InstCache.scala 56:92]
    node _T_25 = tail(_T_24, 1) @[InstCache.scala 56:92]
    node _T_26 = bits(_T_25, 6, 0) @[InstCache.scala 56:83]
    infer mport _T_27 = cache[_T_26], clock @[InstCache.scala 56:83]
    node _T_28 = cat(_T_22, _T_27) @[Cat.scala 30:58]
    node _T_29 = cat(_T_12, _T_17) @[Cat.scala 30:58]
    node _T_30 = cat(_T_29, _T_28) @[Cat.scala 30:58]
    io.inst <= _T_30 @[InstCache.scala 56:11]
    
