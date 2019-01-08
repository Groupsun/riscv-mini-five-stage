;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit Datapath : 
  module Datapath : 
    input clock : Clock
    input reset : UInt<1>
    output io : {if_datapathio : {flip if_pc_branch_addr : UInt<32>, flip if_pc : UInt<32>, if_new_pc : UInt<32>}, ex_datapathio : {flip ex_rs2_out : UInt<32>, flip ex_imm : UInt<32>, flip ex_pc : UInt<32>, flip ex_ALU_Src : UInt<1>, ex_branch_addr : UInt<32>, alu_b_src : UInt<32>}, mem_datapathio : {flip mem_Branch : UInt<1>, flip mem_Zero : UInt<1>}, wb_datapathio : {flip wb_alu_sum : UInt<32>, flip wb_dataout : UInt<32>, flip wb_Mem_to_Reg : UInt<1>, wb_reg_writedata : UInt<32>}}
    
    node _T_36 = add(io.if_datapathio.if_pc, UInt<3>("h04")) @[Datapath.scala 54:37]
    node PC_4 = tail(_T_36, 1) @[Datapath.scala 54:37]
    node PC_Src = and(io.mem_datapathio.mem_Zero, io.mem_datapathio.mem_Branch) @[Datapath.scala 57:43]
    node _T_37 = bits(PC_Src, 0, 0) @[Datapath.scala 58:50]
    node _T_38 = mux(_T_37, io.if_datapathio.if_pc_branch_addr, PC_4) @[Datapath.scala 58:36]
    io.if_datapathio.if_new_pc <= _T_38 @[Datapath.scala 58:30]
    node shift_imm = dshl(io.ex_datapathio.ex_imm, UInt<1>("h01")) @[Datapath.scala 62:43]
    node _T_40 = add(io.ex_datapathio.ex_pc, shift_imm) @[Datapath.scala 63:61]
    node _T_41 = tail(_T_40, 1) @[Datapath.scala 63:61]
    io.ex_datapathio.ex_branch_addr <= _T_41 @[Datapath.scala 63:35]
    node _T_42 = bits(io.ex_datapathio.ex_ALU_Src, 0, 0) @[Datapath.scala 66:71]
    node _T_43 = mux(_T_42, io.ex_datapathio.ex_imm, io.ex_datapathio.ex_rs2_out) @[Datapath.scala 66:36]
    io.ex_datapathio.alu_b_src <= _T_43 @[Datapath.scala 66:30]
    node _T_44 = bits(io.wb_datapathio.wb_Mem_to_Reg, 0, 0) @[Datapath.scala 74:81]
    node _T_45 = mux(_T_44, io.wb_datapathio.wb_dataout, io.wb_datapathio.wb_alu_sum) @[Datapath.scala 74:43]
    io.wb_datapathio.wb_reg_writedata <= _T_45 @[Datapath.scala 74:37]
    
