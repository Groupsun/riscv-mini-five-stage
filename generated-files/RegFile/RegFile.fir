;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit RegFile : 
  module RegFile : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip rs1 : UInt<5>, flip rs2 : UInt<5>, flip rd : UInt<5>, flip wdata : UInt<32>, flip regwrite : UInt<1>, rs1_out : UInt<32>, rs2_out : UInt<32>}
    
    cmem regfile : UInt<32>[32] @[RegFile.scala 26:20]
    infer mport _T_22 = regfile[UInt<1>("h01")], clock @[RegFile.scala 30:10]
    _T_22 <= UInt<4>("h0a") @[RegFile.scala 30:14]
    infer mport _T_25 = regfile[UInt<2>("h02")], clock @[RegFile.scala 31:10]
    _T_25 <= UInt<4>("h0b") @[RegFile.scala 31:14]
    infer mport _T_28 = regfile[UInt<2>("h03")], clock @[RegFile.scala 32:10]
    _T_28 <= UInt<4>("h0c") @[RegFile.scala 32:14]
    infer mport _T_31 = regfile[UInt<3>("h04")], clock @[RegFile.scala 33:10]
    _T_31 <= UInt<4>("h0f") @[RegFile.scala 33:14]
    infer mport _T_34 = regfile[UInt<3>("h05")], clock @[RegFile.scala 34:10]
    _T_34 <= UInt<4>("h0f") @[RegFile.scala 34:14]
    infer mport _T_36 = regfile[io.rs1], clock @[RegFile.scala 37:24]
    io.rs1_out <= _T_36 @[RegFile.scala 37:14]
    infer mport _T_37 = regfile[io.rs2], clock @[RegFile.scala 38:24]
    io.rs2_out <= _T_37 @[RegFile.scala 38:14]
    infer mport _T_38 = regfile[io.rd], clock @[RegFile.scala 40:10]
    node _T_39 = bits(io.regwrite, 0, 0) @[RegFile.scala 40:43]
    node _T_41 = eq(io.rd, UInt<1>("h00")) @[RegFile.scala 40:57]
    node _T_43 = mux(_T_41, UInt<1>("h00"), io.wdata) @[RegFile.scala 40:50]
    infer mport _T_44 = regfile[io.rd], clock @[RegFile.scala 40:89]
    node _T_45 = mux(_T_39, _T_43, _T_44) @[RegFile.scala 40:24]
    _T_38 <= _T_45 @[RegFile.scala 40:18]
    
