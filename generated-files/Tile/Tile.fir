;buildInfoPackage: chisel3, version: 3.1.6, scalaVersion: 2.11.12, sbtVersion: 1.1.1, builtAtString: 2018-12-21 23:42:51.273, builtAtMillis: 1545435771273
circuit Tile : 
  module PC : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip addr_input : UInt<32>, flip pc_write : UInt<1>, pc_out : UInt<32>}
    
    reg PC_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[PC.scala 24:23]
    node _T_13 = bits(io.pc_write, 0, 0) @[PC.scala 26:35]
    node _T_14 = mux(_T_13, io.addr_input, PC_reg) @[PC.scala 26:16]
    PC_reg <= _T_14 @[PC.scala 26:10]
    io.pc_out <= PC_reg @[PC.scala 27:13]
    
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
    
  module IF_ID_Register : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip if_pc : UInt<32>, flip if_inst : UInt<32>, flip if_id_write : UInt<1>, flip if_flush : UInt<1>, id_rs1 : UInt<5>, id_rs2 : UInt<5>, id_pc : UInt<32>, id_inst : UInt<32>}
    
    reg pc_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[IF_ID_Register.scala 27:23]
    reg inst_reg : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[IF_ID_Register.scala 28:25]
    node _T_25 = bits(io.if_flush, 0, 0) @[IF_ID_Register.scala 30:35]
    node _T_27 = bits(io.if_id_write, 0, 0) @[IF_ID_Register.scala 31:30]
    node _T_28 = mux(_T_27, io.if_pc, pc_reg) @[IF_ID_Register.scala 31:8]
    node _T_29 = mux(_T_25, UInt<32>("h00"), _T_28) @[IF_ID_Register.scala 30:16]
    pc_reg <= _T_29 @[IF_ID_Register.scala 30:10]
    node _T_30 = bits(io.if_flush, 0, 0) @[IF_ID_Register.scala 33:37]
    node _T_32 = bits(io.if_id_write, 0, 0) @[IF_ID_Register.scala 34:30]
    node _T_33 = mux(_T_32, io.if_inst, inst_reg) @[IF_ID_Register.scala 34:8]
    node _T_34 = mux(_T_30, UInt<32>("h00"), _T_33) @[IF_ID_Register.scala 33:18]
    inst_reg <= _T_34 @[IF_ID_Register.scala 33:12]
    io.id_pc <= pc_reg @[IF_ID_Register.scala 36:12]
    io.id_inst <= inst_reg @[IF_ID_Register.scala 37:14]
    node _T_35 = bits(inst_reg, 19, 15) @[IF_ID_Register.scala 38:24]
    io.id_rs1 <= _T_35 @[IF_ID_Register.scala 38:13]
    node _T_36 = bits(inst_reg, 24, 20) @[IF_ID_Register.scala 39:24]
    io.id_rs2 <= _T_36 @[IF_ID_Register.scala 39:13]
    
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
    
  module ImmGen : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inst_in : UInt<32>, flip imm_sel : UInt<3>, imm : UInt<32>}
    
    node Iimm = bits(io.inst_in, 31, 20) @[ImmGen.scala 26:24]
    node _T_11 = bits(io.inst_in, 31, 25) @[ImmGen.scala 27:28]
    node _T_12 = bits(io.inst_in, 11, 7) @[ImmGen.scala 27:48]
    node Simm = cat(_T_11, _T_12) @[Cat.scala 30:58]
    node _T_13 = bits(io.inst_in, 31, 31) @[ImmGen.scala 28:28]
    node _T_14 = bits(io.inst_in, 7, 7) @[ImmGen.scala 28:44]
    node _T_15 = bits(io.inst_in, 30, 25) @[ImmGen.scala 28:59]
    node _T_16 = bits(io.inst_in, 11, 8) @[ImmGen.scala 28:79]
    node _T_17 = cat(_T_15, _T_16) @[Cat.scala 30:58]
    node _T_18 = cat(_T_13, _T_14) @[Cat.scala 30:58]
    node Bimm = cat(_T_18, _T_17) @[Cat.scala 30:58]
    node _T_44 = eq(UInt<3>("h04"), io.imm_sel) @[Mux.scala 46:19]
    node _T_45 = mux(_T_44, Bimm, UInt<1>("h00")) @[Mux.scala 46:16]
    node _T_46 = eq(UInt<3>("h03"), io.imm_sel) @[Mux.scala 46:19]
    node _T_47 = mux(_T_46, Simm, _T_45) @[Mux.scala 46:16]
    node _T_48 = eq(UInt<3>("h02"), io.imm_sel) @[Mux.scala 46:19]
    node _T_49 = mux(_T_48, Iimm, _T_47) @[Mux.scala 46:16]
    node _T_50 = eq(UInt<3>("h01"), io.imm_sel) @[Mux.scala 46:19]
    node _T_51 = mux(_T_50, Iimm, _T_49) @[Mux.scala 46:16]
    io.imm <= _T_51 @[ImmGen.scala 30:10]
    
  module Control : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip inst : UInt<32>, Reg_Write : UInt<1>, Imm_Sel : UInt<3>, ALU_Src : UInt<1>, ALUOp : UInt<4>, Branch : UInt<1>, Mem_Read : UInt<1>, Mem_Write : UInt<1>, Mem_to_Reg : UInt<1>}
    
    node _T_25 = and(io.inst, UInt<32>("h0fe00707f")) @[Lookup.scala 9:38]
    node _T_26 = eq(UInt<6>("h033"), _T_25) @[Lookup.scala 9:38]
    node _T_29 = and(io.inst, UInt<32>("h0fe00707f")) @[Lookup.scala 9:38]
    node _T_30 = eq(UInt<31>("h040000033"), _T_29) @[Lookup.scala 9:38]
    node _T_33 = and(io.inst, UInt<32>("h0fe00707f")) @[Lookup.scala 9:38]
    node _T_34 = eq(UInt<15>("h07033"), _T_33) @[Lookup.scala 9:38]
    node _T_37 = and(io.inst, UInt<32>("h0fe00707f")) @[Lookup.scala 9:38]
    node _T_38 = eq(UInt<15>("h06033"), _T_37) @[Lookup.scala 9:38]
    node _T_41 = and(io.inst, UInt<15>("h0707f")) @[Lookup.scala 9:38]
    node _T_42 = eq(UInt<14>("h02003"), _T_41) @[Lookup.scala 9:38]
    node _T_45 = and(io.inst, UInt<15>("h0707f")) @[Lookup.scala 9:38]
    node _T_46 = eq(UInt<14>("h02023"), _T_45) @[Lookup.scala 9:38]
    node _T_49 = and(io.inst, UInt<15>("h0707f")) @[Lookup.scala 9:38]
    node _T_50 = eq(UInt<7>("h063"), _T_49) @[Lookup.scala 9:38]
    node _T_53 = and(io.inst, UInt<32>("h0ffffffff")) @[Lookup.scala 9:38]
    node _T_54 = eq(UInt<1>("h00"), _T_53) @[Lookup.scala 9:38]
    node _T_55 = mux(_T_54, UInt<1>("h00"), UInt<1>("h00")) @[Lookup.scala 11:37]
    node _T_56 = mux(_T_50, UInt<1>("h00"), _T_55) @[Lookup.scala 11:37]
    node _T_57 = mux(_T_46, UInt<1>("h00"), _T_56) @[Lookup.scala 11:37]
    node _T_58 = mux(_T_42, UInt<1>("h01"), _T_57) @[Lookup.scala 11:37]
    node _T_59 = mux(_T_38, UInt<1>("h01"), _T_58) @[Lookup.scala 11:37]
    node _T_60 = mux(_T_34, UInt<1>("h01"), _T_59) @[Lookup.scala 11:37]
    node _T_61 = mux(_T_30, UInt<1>("h01"), _T_60) @[Lookup.scala 11:37]
    node ctrlsignals_0 = mux(_T_26, UInt<1>("h01"), _T_61) @[Lookup.scala 11:37]
    node _T_62 = mux(_T_54, UInt<3>("h00"), UInt<3>("h00")) @[Lookup.scala 11:37]
    node _T_63 = mux(_T_50, UInt<3>("h04"), _T_62) @[Lookup.scala 11:37]
    node _T_64 = mux(_T_46, UInt<3>("h03"), _T_63) @[Lookup.scala 11:37]
    node _T_65 = mux(_T_42, UInt<3>("h02"), _T_64) @[Lookup.scala 11:37]
    node _T_66 = mux(_T_38, UInt<3>("h01"), _T_65) @[Lookup.scala 11:37]
    node _T_67 = mux(_T_34, UInt<3>("h01"), _T_66) @[Lookup.scala 11:37]
    node _T_68 = mux(_T_30, UInt<3>("h01"), _T_67) @[Lookup.scala 11:37]
    node ctrlsignals_1 = mux(_T_26, UInt<3>("h01"), _T_68) @[Lookup.scala 11:37]
    node _T_69 = mux(_T_54, UInt<1>("h00"), UInt<1>("h00")) @[Lookup.scala 11:37]
    node _T_70 = mux(_T_50, UInt<1>("h00"), _T_69) @[Lookup.scala 11:37]
    node _T_71 = mux(_T_46, UInt<1>("h01"), _T_70) @[Lookup.scala 11:37]
    node _T_72 = mux(_T_42, UInt<1>("h01"), _T_71) @[Lookup.scala 11:37]
    node _T_73 = mux(_T_38, UInt<1>("h00"), _T_72) @[Lookup.scala 11:37]
    node _T_74 = mux(_T_34, UInt<1>("h00"), _T_73) @[Lookup.scala 11:37]
    node _T_75 = mux(_T_30, UInt<1>("h00"), _T_74) @[Lookup.scala 11:37]
    node ctrlsignals_2 = mux(_T_26, UInt<1>("h00"), _T_75) @[Lookup.scala 11:37]
    node _T_76 = mux(_T_54, UInt<4>("h0f"), UInt<4>("h0f")) @[Lookup.scala 11:37]
    node _T_77 = mux(_T_50, UInt<4>("h01"), _T_76) @[Lookup.scala 11:37]
    node _T_78 = mux(_T_46, UInt<4>("h00"), _T_77) @[Lookup.scala 11:37]
    node _T_79 = mux(_T_42, UInt<4>("h00"), _T_78) @[Lookup.scala 11:37]
    node _T_80 = mux(_T_38, UInt<4>("h03"), _T_79) @[Lookup.scala 11:37]
    node _T_81 = mux(_T_34, UInt<4>("h02"), _T_80) @[Lookup.scala 11:37]
    node _T_82 = mux(_T_30, UInt<4>("h01"), _T_81) @[Lookup.scala 11:37]
    node ctrlsignals_3 = mux(_T_26, UInt<4>("h00"), _T_82) @[Lookup.scala 11:37]
    node _T_83 = mux(_T_54, UInt<1>("h00"), UInt<1>("h00")) @[Lookup.scala 11:37]
    node _T_84 = mux(_T_50, UInt<1>("h01"), _T_83) @[Lookup.scala 11:37]
    node _T_85 = mux(_T_46, UInt<1>("h00"), _T_84) @[Lookup.scala 11:37]
    node _T_86 = mux(_T_42, UInt<1>("h00"), _T_85) @[Lookup.scala 11:37]
    node _T_87 = mux(_T_38, UInt<1>("h00"), _T_86) @[Lookup.scala 11:37]
    node _T_88 = mux(_T_34, UInt<1>("h00"), _T_87) @[Lookup.scala 11:37]
    node _T_89 = mux(_T_30, UInt<1>("h00"), _T_88) @[Lookup.scala 11:37]
    node ctrlsignals_4 = mux(_T_26, UInt<1>("h00"), _T_89) @[Lookup.scala 11:37]
    node _T_90 = mux(_T_54, UInt<1>("h00"), UInt<1>("h00")) @[Lookup.scala 11:37]
    node _T_91 = mux(_T_50, UInt<1>("h00"), _T_90) @[Lookup.scala 11:37]
    node _T_92 = mux(_T_46, UInt<1>("h00"), _T_91) @[Lookup.scala 11:37]
    node _T_93 = mux(_T_42, UInt<1>("h01"), _T_92) @[Lookup.scala 11:37]
    node _T_94 = mux(_T_38, UInt<1>("h00"), _T_93) @[Lookup.scala 11:37]
    node _T_95 = mux(_T_34, UInt<1>("h00"), _T_94) @[Lookup.scala 11:37]
    node _T_96 = mux(_T_30, UInt<1>("h00"), _T_95) @[Lookup.scala 11:37]
    node ctrlsignals_5 = mux(_T_26, UInt<1>("h00"), _T_96) @[Lookup.scala 11:37]
    node _T_97 = mux(_T_54, UInt<1>("h00"), UInt<1>("h00")) @[Lookup.scala 11:37]
    node _T_98 = mux(_T_50, UInt<1>("h00"), _T_97) @[Lookup.scala 11:37]
    node _T_99 = mux(_T_46, UInt<1>("h01"), _T_98) @[Lookup.scala 11:37]
    node _T_100 = mux(_T_42, UInt<1>("h00"), _T_99) @[Lookup.scala 11:37]
    node _T_101 = mux(_T_38, UInt<1>("h00"), _T_100) @[Lookup.scala 11:37]
    node _T_102 = mux(_T_34, UInt<1>("h00"), _T_101) @[Lookup.scala 11:37]
    node _T_103 = mux(_T_30, UInt<1>("h00"), _T_102) @[Lookup.scala 11:37]
    node ctrlsignals_6 = mux(_T_26, UInt<1>("h00"), _T_103) @[Lookup.scala 11:37]
    node _T_104 = mux(_T_54, UInt<1>("h00"), UInt<1>("h00")) @[Lookup.scala 11:37]
    node _T_105 = mux(_T_50, UInt<1>("h00"), _T_104) @[Lookup.scala 11:37]
    node _T_106 = mux(_T_46, UInt<1>("h00"), _T_105) @[Lookup.scala 11:37]
    node _T_107 = mux(_T_42, UInt<1>("h01"), _T_106) @[Lookup.scala 11:37]
    node _T_108 = mux(_T_38, UInt<1>("h00"), _T_107) @[Lookup.scala 11:37]
    node _T_109 = mux(_T_34, UInt<1>("h00"), _T_108) @[Lookup.scala 11:37]
    node _T_110 = mux(_T_30, UInt<1>("h00"), _T_109) @[Lookup.scala 11:37]
    node ctrlsignals_7 = mux(_T_26, UInt<1>("h00"), _T_110) @[Lookup.scala 11:37]
    io.Imm_Sel <= ctrlsignals_1 @[Control.scala 86:17]
    io.ALU_Src <= ctrlsignals_2 @[Control.scala 89:17]
    io.ALUOp <= ctrlsignals_3 @[Control.scala 90:17]
    io.Branch <= ctrlsignals_4 @[Control.scala 93:17]
    io.Mem_Read <= ctrlsignals_5 @[Control.scala 94:17]
    io.Mem_Write <= ctrlsignals_6 @[Control.scala 95:17]
    io.Reg_Write <= ctrlsignals_0 @[Control.scala 98:17]
    io.Mem_to_Reg <= ctrlsignals_7 @[Control.scala 99:17]
    
  module ID_EX_Register : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip id_pc : UInt<32>, flip id_rs1_out : UInt<32>, flip id_rs2_out : UInt<32>, flip id_imm : UInt<32>, flip id_inst : UInt<32>, flip id_rs1 : UInt<5>, flip id_rs2 : UInt<5>, flip ALU_Src : UInt<1>, flip ALUOp : UInt<4>, flip Branch : UInt<1>, flip Mem_Read : UInt<1>, flip Mem_Write : UInt<1>, flip Reg_Write : UInt<1>, flip Mem_to_Reg : UInt<1>, ex_ALU_Src : UInt<1>, ex_ALUOp : UInt<4>, ex_Branch : UInt<1>, ex_Mem_Read : UInt<1>, ex_Mem_Write : UInt<1>, ex_Reg_Write : UInt<1>, ex_Mem_to_Reg : UInt<1>, ex_pc : UInt<32>, ex_rs1_out : UInt<32>, ex_rs2_out : UInt<32>, ex_rd : UInt<5>, ex_imm : UInt<32>, ex_rs1 : UInt<5>, ex_rs2 : UInt<5>, ex_inst : UInt<32>}
    
    reg pc : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ID_EX_Register.scala 61:28]
    reg rs1_out : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ID_EX_Register.scala 62:28]
    reg rs2_out : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ID_EX_Register.scala 63:28]
    reg imm : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ID_EX_Register.scala 64:28]
    reg inst : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ID_EX_Register.scala 65:28]
    reg rs1 : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ID_EX_Register.scala 66:28]
    reg rs2 : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[ID_EX_Register.scala 67:28]
    reg alu_src : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[ID_EX_Register.scala 68:28]
    reg aluop : UInt<4>, clock with : (reset => (reset, UInt<4>("h00"))) @[ID_EX_Register.scala 69:28]
    reg branch : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[ID_EX_Register.scala 70:28]
    reg mem_read : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[ID_EX_Register.scala 71:28]
    reg mem_write : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[ID_EX_Register.scala 72:28]
    reg reg_write : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[ID_EX_Register.scala 73:28]
    reg mem_to_reg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[ID_EX_Register.scala 74:28]
    pc <= io.id_pc @[ID_EX_Register.scala 77:21]
    rs1_out <= io.id_rs1_out @[ID_EX_Register.scala 78:21]
    rs2_out <= io.id_rs2_out @[ID_EX_Register.scala 79:21]
    imm <= io.id_imm @[ID_EX_Register.scala 80:21]
    inst <= io.id_inst @[ID_EX_Register.scala 81:21]
    rs1 <= io.id_rs1 @[ID_EX_Register.scala 82:21]
    rs2 <= io.id_rs2 @[ID_EX_Register.scala 83:21]
    alu_src <= io.ALU_Src @[ID_EX_Register.scala 84:21]
    aluop <= io.ALUOp @[ID_EX_Register.scala 85:21]
    branch <= io.Branch @[ID_EX_Register.scala 86:21]
    mem_read <= io.Mem_Read @[ID_EX_Register.scala 87:21]
    mem_write <= io.Mem_Write @[ID_EX_Register.scala 88:21]
    reg_write <= io.Reg_Write @[ID_EX_Register.scala 89:21]
    mem_to_reg <= io.Mem_to_Reg @[ID_EX_Register.scala 90:21]
    io.ex_ALU_Src <= alu_src @[ID_EX_Register.scala 93:21]
    io.ex_ALUOp <= aluop @[ID_EX_Register.scala 94:21]
    io.ex_Branch <= branch @[ID_EX_Register.scala 95:21]
    io.ex_Mem_Read <= mem_read @[ID_EX_Register.scala 96:21]
    io.ex_Mem_Write <= mem_write @[ID_EX_Register.scala 97:21]
    io.ex_Reg_Write <= reg_write @[ID_EX_Register.scala 98:21]
    io.ex_Mem_to_Reg <= mem_to_reg @[ID_EX_Register.scala 99:21]
    io.ex_pc <= pc @[ID_EX_Register.scala 100:21]
    io.ex_rs1_out <= rs1_out @[ID_EX_Register.scala 101:21]
    io.ex_rs2_out <= rs2_out @[ID_EX_Register.scala 102:21]
    io.ex_rs1 <= rs1 @[ID_EX_Register.scala 103:21]
    io.ex_rs2 <= rs2 @[ID_EX_Register.scala 104:21]
    io.ex_imm <= imm @[ID_EX_Register.scala 105:21]
    io.ex_inst <= inst @[ID_EX_Register.scala 106:21]
    node _T_91 = bits(inst, 11, 7) @[ID_EX_Register.scala 107:28]
    io.ex_rd <= _T_91 @[ID_EX_Register.scala 107:21]
    
  module ALU : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip Src_A : UInt<32>, flip Src_B : UInt<32>, flip ALUOp : UInt<4>, Sum : UInt<32>, Zero : UInt<1>}
    
    node _T_15 = add(io.Src_A, io.Src_B) @[ALU.scala 38:26]
    node _T_16 = tail(_T_15, 1) @[ALU.scala 38:26]
    node _T_17 = sub(io.Src_A, io.Src_B) @[ALU.scala 39:26]
    node _T_18 = asUInt(_T_17) @[ALU.scala 39:26]
    node _T_19 = tail(_T_18, 1) @[ALU.scala 39:26]
    node _T_20 = and(io.Src_A, io.Src_B) @[ALU.scala 40:26]
    node _T_21 = or(io.Src_A, io.Src_B) @[ALU.scala 41:26]
    node _T_22 = eq(UInt<4>("h03"), io.ALUOp) @[Mux.scala 46:19]
    node _T_23 = mux(_T_22, _T_21, io.Src_B) @[Mux.scala 46:16]
    node _T_24 = eq(UInt<4>("h02"), io.ALUOp) @[Mux.scala 46:19]
    node _T_25 = mux(_T_24, _T_20, _T_23) @[Mux.scala 46:16]
    node _T_26 = eq(UInt<4>("h01"), io.ALUOp) @[Mux.scala 46:19]
    node _T_27 = mux(_T_26, _T_19, _T_25) @[Mux.scala 46:16]
    node _T_28 = eq(UInt<4>("h00"), io.ALUOp) @[Mux.scala 46:19]
    node _T_29 = mux(_T_28, _T_16, _T_27) @[Mux.scala 46:16]
    io.Sum <= _T_29 @[ALU.scala 37:10]
    node _T_30 = eq(io.Src_A, io.Src_B) @[ALU.scala 44:28]
    node _T_33 = mux(_T_30, UInt<1>("h01"), UInt<1>("h00")) @[ALU.scala 44:17]
    io.Zero <= _T_33 @[ALU.scala 44:11]
    
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
    
  module EX_MEM_Register : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip ex_branch_addr : UInt<32>, flip ex_alu_sum : UInt<32>, flip ex_alu_zero : UInt<32>, flip ex_rs2_out : UInt<32>, flip ex_rd : UInt<5>, flip ex_Branch : UInt<1>, flip ex_Mem_Read : UInt<1>, flip ex_Mem_Write : UInt<1>, flip ex_Reg_Write : UInt<1>, flip ex_Mem_to_Reg : UInt<1>, mem_Branch : UInt<1>, mem_Mem_Read : UInt<1>, mem_Mem_Write : UInt<1>, mem_Reg_Write : UInt<1>, mem_Mem_to_Reg : UInt<1>, mem_branch_addr : UInt<32>, mem_alu_zero : UInt<1>, mem_alu_sum : UInt<32>, mem_rs2_out : UInt<32>, mem_rd : UInt<5>}
    
    reg branch_addr : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[EX_MEM_Register.scala 49:30]
    reg alu_sum : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[EX_MEM_Register.scala 50:30]
    reg alu_zero : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[EX_MEM_Register.scala 51:30]
    reg rs2_out : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[EX_MEM_Register.scala 52:30]
    reg rd : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[EX_MEM_Register.scala 53:30]
    reg branch : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EX_MEM_Register.scala 55:30]
    reg mem_read : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EX_MEM_Register.scala 56:30]
    reg mem_write : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EX_MEM_Register.scala 57:30]
    reg reg_write : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EX_MEM_Register.scala 58:30]
    reg mem_to_reg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[EX_MEM_Register.scala 59:30]
    branch_addr <= io.ex_branch_addr @[EX_MEM_Register.scala 62:17]
    alu_sum <= io.ex_alu_sum @[EX_MEM_Register.scala 63:17]
    alu_zero <= io.ex_alu_zero @[EX_MEM_Register.scala 64:17]
    rs2_out <= io.ex_rs2_out @[EX_MEM_Register.scala 65:17]
    rd <= io.ex_rd @[EX_MEM_Register.scala 66:17]
    branch <= io.ex_Branch @[EX_MEM_Register.scala 67:17]
    mem_read <= io.ex_Mem_Read @[EX_MEM_Register.scala 68:17]
    mem_write <= io.ex_Mem_Write @[EX_MEM_Register.scala 69:17]
    reg_write <= io.ex_Reg_Write @[EX_MEM_Register.scala 70:17]
    mem_to_reg <= io.ex_Mem_to_Reg @[EX_MEM_Register.scala 71:17]
    io.mem_branch_addr <= branch_addr @[EX_MEM_Register.scala 74:23]
    io.mem_alu_sum <= alu_sum @[EX_MEM_Register.scala 75:23]
    io.mem_alu_zero <= alu_zero @[EX_MEM_Register.scala 76:23]
    io.mem_rs2_out <= rs2_out @[EX_MEM_Register.scala 77:23]
    io.mem_rd <= rd @[EX_MEM_Register.scala 78:23]
    io.mem_Branch <= branch @[EX_MEM_Register.scala 79:23]
    io.mem_Mem_Read <= mem_read @[EX_MEM_Register.scala 80:23]
    io.mem_Mem_Write <= mem_write @[EX_MEM_Register.scala 81:23]
    io.mem_Reg_Write <= reg_write @[EX_MEM_Register.scala 82:23]
    io.mem_Mem_to_Reg <= mem_to_reg @[EX_MEM_Register.scala 83:23]
    
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
    
  module MEM_WB_Register : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip mem_dataout : UInt<32>, flip mem_alu_sum : UInt<32>, flip mem_rd : UInt<5>, flip mem_Mem_to_Reg : UInt<1>, flip mem_Reg_Write : UInt<1>, wb_Mem_to_Reg : UInt<1>, wb_Reg_Write : UInt<1>, wb_dataout : UInt<32>, wb_alu_sum : UInt<32>, wb_rd : UInt<5>}
    
    reg dataout : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[MEM_WB_Register.scala 37:28]
    reg alu_sum : UInt<32>, clock with : (reset => (reset, UInt<32>("h00"))) @[MEM_WB_Register.scala 38:28]
    reg rd : UInt<5>, clock with : (reset => (reset, UInt<5>("h00"))) @[MEM_WB_Register.scala 39:28]
    reg mem_to_reg : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[MEM_WB_Register.scala 40:28]
    reg reg_write : UInt<1>, clock with : (reset => (reset, UInt<1>("h00"))) @[MEM_WB_Register.scala 41:28]
    dataout <= io.mem_dataout @[MEM_WB_Register.scala 44:15]
    alu_sum <= io.mem_alu_sum @[MEM_WB_Register.scala 45:15]
    rd <= io.mem_rd @[MEM_WB_Register.scala 46:15]
    mem_to_reg <= io.mem_Mem_to_Reg @[MEM_WB_Register.scala 47:15]
    reg_write <= io.mem_Reg_Write @[MEM_WB_Register.scala 48:15]
    io.wb_Mem_to_Reg <= mem_to_reg @[MEM_WB_Register.scala 51:21]
    io.wb_Reg_Write <= reg_write @[MEM_WB_Register.scala 52:21]
    io.wb_dataout <= dataout @[MEM_WB_Register.scala 53:21]
    io.wb_alu_sum <= alu_sum @[MEM_WB_Register.scala 54:21]
    io.wb_rd <= rd @[MEM_WB_Register.scala 55:21]
    
  module Tile : 
    input clock : Clock
    input reset : UInt<1>
    output io : {flip pc_write : UInt<1>, flip if_id_write : UInt<1>, flip if_flush : UInt<1>, if_pc_out : UInt<32>, if_next_pc : UInt<32>, id_rs1 : UInt<5>, id_rs2 : UInt<5>, id_rs1_out : UInt<32>, id_rs2_out : UInt<32>, ex_rs1_out : UInt<32>, ex_rs2_out : UInt<32>, ex_alu_sum : UInt<32>, ex_alu_zero : UInt<1>, ex_branch_addr : UInt<32>, ex_rd : UInt<5>, mem_rd : UInt<5>, mem_branch_addr : UInt<32>, mem_alu_sum : UInt<32>, mem_writedata : UInt<32>, mem_dataout : UInt<32>, wb_rd : UInt<5>, wb_registerwrite : UInt<32>}
    
    inst pc of PC @[Tile.scala 46:31]
    pc.clock <= clock
    pc.reset <= reset
    inst instcache of InstCache @[Tile.scala 47:31]
    instcache.clock <= clock
    instcache.reset <= reset
    inst if_id_register of IF_ID_Register @[Tile.scala 48:31]
    if_id_register.clock <= clock
    if_id_register.reset <= reset
    inst regfile of RegFile @[Tile.scala 49:31]
    regfile.clock <= clock
    regfile.reset <= reset
    inst immgen of ImmGen @[Tile.scala 50:31]
    immgen.clock <= clock
    immgen.reset <= reset
    inst control of Control @[Tile.scala 51:31]
    control.clock <= clock
    control.reset <= reset
    inst id_ex_register of ID_EX_Register @[Tile.scala 52:31]
    id_ex_register.clock <= clock
    id_ex_register.reset <= reset
    inst alu of ALU @[Tile.scala 53:31]
    alu.clock <= clock
    alu.reset <= reset
    inst datapath of Datapath @[Tile.scala 54:31]
    datapath.clock <= clock
    datapath.reset <= reset
    inst ex_mem_register of EX_MEM_Register @[Tile.scala 55:31]
    ex_mem_register.clock <= clock
    ex_mem_register.reset <= reset
    inst datacache of DataCache @[Tile.scala 56:31]
    datacache.clock <= clock
    datacache.reset <= reset
    inst mem_wb_register of MEM_WB_Register @[Tile.scala 57:31]
    mem_wb_register.clock <= clock
    mem_wb_register.reset <= reset
    datapath.io.if_datapathio.if_pc_branch_addr <= ex_mem_register.io.mem_branch_addr @[Tile.scala 61:47]
    datapath.io.if_datapathio.if_pc <= pc.io.pc_out @[Tile.scala 62:47]
    pc.io.addr_input <= datapath.io.if_datapathio.if_new_pc @[Tile.scala 65:20]
    pc.io.pc_write <= io.pc_write @[Tile.scala 66:20]
    instcache.io.addr <= pc.io.pc_out @[Tile.scala 69:21]
    io.if_pc_out <= pc.io.addr_input @[Tile.scala 72:16]
    io.if_next_pc <= datapath.io.if_datapathio.if_new_pc @[Tile.scala 73:17]
    if_id_register.io.if_id_write <= io.if_id_write @[Tile.scala 77:33]
    if_id_register.io.if_flush <= io.if_flush @[Tile.scala 78:33]
    if_id_register.io.if_inst <= instcache.io.inst @[Tile.scala 79:33]
    if_id_register.io.if_pc <= pc.io.pc_out @[Tile.scala 80:33]
    control.io.inst <= if_id_register.io.id_inst @[Tile.scala 84:23]
    regfile.io.rs1 <= if_id_register.io.id_rs1 @[Tile.scala 87:23]
    regfile.io.rs2 <= if_id_register.io.id_rs2 @[Tile.scala 88:23]
    regfile.io.rd <= mem_wb_register.io.wb_rd @[Tile.scala 89:23]
    regfile.io.wdata <= datapath.io.wb_datapathio.wb_reg_writedata @[Tile.scala 90:23]
    regfile.io.regwrite <= mem_wb_register.io.wb_Reg_Write @[Tile.scala 91:23]
    immgen.io.inst_in <= if_id_register.io.id_inst @[Tile.scala 94:23]
    immgen.io.imm_sel <= control.io.Imm_Sel @[Tile.scala 95:23]
    io.id_rs1 <= if_id_register.io.id_rs1 @[Tile.scala 98:13]
    io.id_rs2 <= if_id_register.io.id_rs2 @[Tile.scala 99:13]
    io.id_rs1_out <= regfile.io.rs1_out @[Tile.scala 100:17]
    io.id_rs2_out <= regfile.io.rs2_out @[Tile.scala 101:17]
    id_ex_register.io.ALU_Src <= control.io.ALU_Src @[Tile.scala 106:33]
    id_ex_register.io.ALUOp <= control.io.ALUOp @[Tile.scala 107:33]
    id_ex_register.io.Branch <= control.io.Branch @[Tile.scala 108:33]
    id_ex_register.io.Mem_Read <= control.io.Mem_Read @[Tile.scala 109:33]
    id_ex_register.io.Mem_Write <= control.io.Mem_Write @[Tile.scala 110:33]
    id_ex_register.io.Reg_Write <= control.io.Reg_Write @[Tile.scala 111:33]
    id_ex_register.io.Mem_to_Reg <= control.io.Mem_to_Reg @[Tile.scala 112:33]
    id_ex_register.io.id_rs1_out <= regfile.io.rs1_out @[Tile.scala 115:32]
    id_ex_register.io.id_rs2_out <= regfile.io.rs2_out @[Tile.scala 116:32]
    id_ex_register.io.id_rs1 <= if_id_register.io.id_rs1 @[Tile.scala 117:32]
    id_ex_register.io.id_rs2 <= if_id_register.io.id_rs2 @[Tile.scala 118:32]
    id_ex_register.io.id_pc <= if_id_register.io.id_pc @[Tile.scala 119:32]
    id_ex_register.io.id_inst <= if_id_register.io.id_inst @[Tile.scala 120:32]
    id_ex_register.io.id_imm <= immgen.io.imm @[Tile.scala 121:32]
    datapath.io.ex_datapathio.ex_pc <= id_ex_register.io.ex_pc @[Tile.scala 125:37]
    datapath.io.ex_datapathio.ex_imm <= id_ex_register.io.ex_imm @[Tile.scala 126:37]
    datapath.io.ex_datapathio.ex_rs2_out <= id_ex_register.io.ex_rs2_out @[Tile.scala 129:40]
    datapath.io.ex_datapathio.ex_ALU_Src <= id_ex_register.io.ex_ALU_Src @[Tile.scala 130:40]
    alu.io.Src_A <= id_ex_register.io.ex_rs1_out @[Tile.scala 133:16]
    alu.io.Src_B <= datapath.io.ex_datapathio.alu_b_src @[Tile.scala 134:16]
    alu.io.ALUOp <= id_ex_register.io.ex_ALUOp @[Tile.scala 135:16]
    io.ex_rs1_out <= id_ex_register.io.ex_rs1_out @[Tile.scala 138:17]
    io.ex_rs2_out <= id_ex_register.io.ex_rs2_out @[Tile.scala 139:17]
    io.ex_alu_sum <= alu.io.Sum @[Tile.scala 140:17]
    io.ex_alu_zero <= alu.io.Zero @[Tile.scala 141:18]
    io.ex_branch_addr <= datapath.io.ex_datapathio.ex_branch_addr @[Tile.scala 142:21]
    io.ex_rd <= id_ex_register.io.ex_rd @[Tile.scala 143:12]
    ex_mem_register.io.ex_branch_addr <= datapath.io.ex_datapathio.ex_branch_addr @[Tile.scala 147:37]
    ex_mem_register.io.ex_alu_sum <= alu.io.Sum @[Tile.scala 148:37]
    ex_mem_register.io.ex_alu_zero <= alu.io.Zero @[Tile.scala 149:37]
    ex_mem_register.io.ex_rs2_out <= id_ex_register.io.ex_rs2_out @[Tile.scala 150:37]
    ex_mem_register.io.ex_rd <= id_ex_register.io.ex_rd @[Tile.scala 151:37]
    ex_mem_register.io.ex_Branch <= id_ex_register.io.ex_Branch @[Tile.scala 152:37]
    ex_mem_register.io.ex_Mem_Read <= id_ex_register.io.ex_Mem_Read @[Tile.scala 153:37]
    ex_mem_register.io.ex_Mem_Write <= id_ex_register.io.ex_Mem_Write @[Tile.scala 154:37]
    ex_mem_register.io.ex_Reg_Write <= id_ex_register.io.ex_Reg_Write @[Tile.scala 155:37]
    ex_mem_register.io.ex_Mem_to_Reg <= id_ex_register.io.ex_Mem_to_Reg @[Tile.scala 156:37]
    datacache.io.addr <= ex_mem_register.io.mem_alu_sum @[Tile.scala 160:27]
    datacache.io.write_data <= ex_mem_register.io.mem_rs2_out @[Tile.scala 161:27]
    datacache.io.Mem_Read <= ex_mem_register.io.mem_Mem_Read @[Tile.scala 162:27]
    datacache.io.Mem_Write <= ex_mem_register.io.mem_Mem_Write @[Tile.scala 163:27]
    datapath.io.mem_datapathio.mem_Branch <= ex_mem_register.io.mem_Branch @[Tile.scala 166:41]
    datapath.io.mem_datapathio.mem_Zero <= ex_mem_register.io.mem_alu_zero @[Tile.scala 167:41]
    io.mem_rd <= ex_mem_register.io.mem_rd @[Tile.scala 170:13]
    io.mem_branch_addr <= ex_mem_register.io.mem_branch_addr @[Tile.scala 171:22]
    io.mem_alu_sum <= ex_mem_register.io.mem_alu_sum @[Tile.scala 172:18]
    io.mem_writedata <= ex_mem_register.io.mem_rs2_out @[Tile.scala 173:20]
    io.mem_dataout <= datacache.io.data_out @[Tile.scala 174:18]
    mem_wb_register.io.mem_Reg_Write <= ex_mem_register.io.mem_Reg_Write @[Tile.scala 178:36]
    mem_wb_register.io.mem_Mem_to_Reg <= ex_mem_register.io.mem_Mem_to_Reg @[Tile.scala 179:37]
    mem_wb_register.io.mem_dataout <= datacache.io.data_out @[Tile.scala 180:34]
    mem_wb_register.io.mem_alu_sum <= ex_mem_register.io.mem_alu_sum @[Tile.scala 181:34]
    mem_wb_register.io.mem_rd <= ex_mem_register.io.mem_rd @[Tile.scala 182:34]
    datapath.io.wb_datapathio.wb_alu_sum <= mem_wb_register.io.wb_alu_sum @[Tile.scala 185:40]
    datapath.io.wb_datapathio.wb_dataout <= mem_wb_register.io.wb_dataout @[Tile.scala 186:40]
    datapath.io.wb_datapathio.wb_Mem_to_Reg <= mem_wb_register.io.wb_Mem_to_Reg @[Tile.scala 187:43]
    io.wb_rd <= mem_wb_register.io.wb_rd @[Tile.scala 190:12]
    io.wb_registerwrite <= datapath.io.wb_datapathio.wb_reg_writedata @[Tile.scala 191:23]
    
