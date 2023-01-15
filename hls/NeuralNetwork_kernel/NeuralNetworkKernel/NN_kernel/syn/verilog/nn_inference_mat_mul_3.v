// ==============================================================
// RTL generated by Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.2 (64-bit)
// Version: 2020.2
// Copyright (C) Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
// 
// ===========================================================

`timescale 1 ns / 1 ps 

module nn_inference_mat_mul_3 (
        ap_clk,
        ap_rst,
        ap_start,
        ap_done,
        ap_idle,
        ap_ready,
        input_r_address0,
        input_r_ce0,
        input_r_q0,
        output_r_address0,
        output_r_ce0,
        output_r_we0,
        output_r_d0,
        grp_fu_35017_p_din0,
        grp_fu_35017_p_din1,
        grp_fu_35017_p_dout0,
        grp_fu_35017_p_ce
);

parameter    ap_ST_fsm_state1 = 5'd1;
parameter    ap_ST_fsm_pp0_stage0 = 5'd2;
parameter    ap_ST_fsm_state10 = 5'd4;
parameter    ap_ST_fsm_pp1_stage0 = 5'd8;
parameter    ap_ST_fsm_state19 = 5'd16;

input   ap_clk;
input   ap_rst;
input   ap_start;
output   ap_done;
output   ap_idle;
output   ap_ready;
output  [10:0] input_r_address0;
output   input_r_ce0;
input  [31:0] input_r_q0;
output  [10:0] output_r_address0;
output   output_r_ce0;
output   output_r_we0;
output  [31:0] output_r_d0;
output  [31:0] grp_fu_35017_p_din0;
output  [31:0] grp_fu_35017_p_din1;
input  [31:0] grp_fu_35017_p_dout0;
output   grp_fu_35017_p_ce;

reg ap_done;
reg ap_idle;
reg ap_ready;
reg[10:0] input_r_address0;
reg input_r_ce0;
reg[10:0] output_r_address0;
reg output_r_ce0;
reg output_r_we0;
reg[31:0] output_r_d0;

(* fsm_encoding = "none" *) reg   [4:0] ap_CS_fsm;
wire    ap_CS_fsm_state1;
reg   [3:0] layer10_weights_address0;
reg    layer10_weights_ce0;
wire   [31:0] layer10_weights_q0;
reg   [3:0] j_0_reg_105;
reg   [31:0] sum_0_reg_116;
reg   [3:0] j_1_reg_129;
reg   [31:0] sum_19_reg_140;
wire    ap_CS_fsm_pp0_stage0;
reg    ap_enable_reg_pp0_iter1;
wire    ap_block_state2_pp0_stage0_iter0;
wire    ap_block_state3_pp0_stage0_iter1;
wire    ap_block_state4_pp0_stage0_iter2;
wire    ap_block_state5_pp0_stage0_iter3;
wire    ap_block_state6_pp0_stage0_iter4;
wire    ap_block_state7_pp0_stage0_iter5;
wire    ap_block_state8_pp0_stage0_iter6;
wire    ap_block_state9_pp0_stage0_iter7;
wire    ap_block_pp0_stage0_11001;
reg   [0:0] icmp_ln70_reg_251;
wire    ap_block_state11_pp1_stage0_iter0;
wire    ap_block_state12_pp1_stage0_iter1;
wire    ap_block_state13_pp1_stage0_iter2;
wire    ap_block_state14_pp1_stage0_iter3;
wire    ap_block_state15_pp1_stage0_iter4;
wire    ap_block_state16_pp1_stage0_iter5;
wire    ap_block_state17_pp1_stage0_iter6;
wire    ap_block_state18_pp1_stage0_iter7;
wire    ap_block_pp1_stage0_11001;
wire    ap_CS_fsm_pp1_stage0;
reg    ap_enable_reg_pp1_iter1;
reg   [0:0] icmp_ln70_1_reg_281;
wire   [31:0] grp_fu_153_p2;
reg   [31:0] reg_169;
reg    ap_enable_reg_pp0_iter4;
reg   [0:0] icmp_ln70_reg_251_pp0_iter3_reg;
reg    ap_enable_reg_pp1_iter4;
reg   [0:0] icmp_ln70_1_reg_281_pp1_iter3_reg;
wire   [3:0] add_ln70_fu_173_p2;
reg   [3:0] add_ln70_reg_245;
reg    ap_enable_reg_pp0_iter0;
reg   [3:0] add_ln70_reg_245_pp0_iter1_reg;
reg   [3:0] add_ln70_reg_245_pp0_iter2_reg;
reg   [3:0] add_ln70_reg_245_pp0_iter3_reg;
reg   [3:0] add_ln70_reg_245_pp0_iter4_reg;
wire   [0:0] icmp_ln70_fu_179_p2;
reg   [0:0] icmp_ln70_reg_251_pp0_iter1_reg;
reg   [0:0] icmp_ln70_reg_251_pp0_iter2_reg;
reg   [0:0] icmp_ln70_reg_251_pp0_iter4_reg;
reg   [0:0] icmp_ln70_reg_251_pp0_iter5_reg;
reg   [0:0] icmp_ln70_reg_251_pp0_iter6_reg;
wire   [31:0] grp_fu_196_p3;
reg    ap_enable_reg_pp0_iter7;
wire   [3:0] add_ln70_1_fu_204_p2;
reg   [3:0] add_ln70_1_reg_275;
reg    ap_enable_reg_pp1_iter0;
reg   [3:0] add_ln70_1_reg_275_pp1_iter1_reg;
reg   [3:0] add_ln70_1_reg_275_pp1_iter2_reg;
reg   [3:0] add_ln70_1_reg_275_pp1_iter3_reg;
reg   [3:0] add_ln70_1_reg_275_pp1_iter4_reg;
wire   [0:0] icmp_ln70_1_fu_210_p2;
reg   [0:0] icmp_ln70_1_reg_281_pp1_iter1_reg;
reg   [0:0] icmp_ln70_1_reg_281_pp1_iter2_reg;
reg   [0:0] icmp_ln70_1_reg_281_pp1_iter4_reg;
reg   [0:0] icmp_ln70_1_reg_281_pp1_iter5_reg;
reg   [0:0] icmp_ln70_1_reg_281_pp1_iter6_reg;
wire   [31:0] grp_fu_237_p3;
reg    ap_enable_reg_pp1_iter7;
wire    ap_block_pp0_stage0_subdone;
reg    ap_condition_pp0_exit_iter0_state2;
reg    ap_enable_reg_pp0_iter2;
reg    ap_enable_reg_pp0_iter3;
reg    ap_enable_reg_pp0_iter5;
reg    ap_enable_reg_pp0_iter6;
wire    ap_CS_fsm_state10;
wire    ap_block_pp1_stage0_subdone;
reg    ap_condition_pp1_exit_iter0_state11;
reg    ap_enable_reg_pp1_iter2;
reg    ap_enable_reg_pp1_iter3;
reg    ap_enable_reg_pp1_iter5;
reg    ap_enable_reg_pp1_iter6;
reg   [3:0] ap_phi_mux_j_0_phi_fu_109_p4;
wire    ap_block_pp0_stage0;
reg   [3:0] ap_phi_mux_j_1_phi_fu_133_p4;
wire    ap_block_pp1_stage0;
wire   [63:0] j_0_cast_fu_185_p1;
wire   [63:0] zext_ln72_fu_227_p1;
wire   [63:0] j_1_cast_fu_216_p1;
wire    ap_CS_fsm_state19;
wire   [31:0] grp_fu_153_p0;
wire   [31:0] grp_fu_153_p1;
wire   [0:0] grp_fu_196_p2;
wire   [3:0] xor_ln72_fu_221_p2;
wire   [0:0] grp_fu_237_p2;
wire    grp_fu_153_ce;
reg    grp_fu_196_in_valid;
reg    grp_fu_237_in_valid;
reg   [4:0] ap_NS_fsm;
reg    ap_idle_pp0;
wire    ap_enable_pp0;
reg    ap_idle_pp1;
wire    ap_enable_pp1;
wire   [31:0] grp_fu_196_p0;
wire   [31:0] grp_fu_237_p0;
wire    ap_ce_reg;

// power-on initialization
initial begin
#0 ap_CS_fsm = 5'd1;
#0 ap_enable_reg_pp0_iter1 = 1'b0;
#0 ap_enable_reg_pp1_iter1 = 1'b0;
#0 ap_enable_reg_pp0_iter4 = 1'b0;
#0 ap_enable_reg_pp1_iter4 = 1'b0;
#0 ap_enable_reg_pp0_iter0 = 1'b0;
#0 ap_enable_reg_pp0_iter7 = 1'b0;
#0 ap_enable_reg_pp1_iter0 = 1'b0;
#0 ap_enable_reg_pp1_iter7 = 1'b0;
#0 ap_enable_reg_pp0_iter2 = 1'b0;
#0 ap_enable_reg_pp0_iter3 = 1'b0;
#0 ap_enable_reg_pp0_iter5 = 1'b0;
#0 ap_enable_reg_pp0_iter6 = 1'b0;
#0 ap_enable_reg_pp1_iter2 = 1'b0;
#0 ap_enable_reg_pp1_iter3 = 1'b0;
#0 ap_enable_reg_pp1_iter5 = 1'b0;
#0 ap_enable_reg_pp1_iter6 = 1'b0;
end

nn_inference_mat_mul_3_layer10_weights #(
    .DataWidth( 32 ),
    .AddressRange( 16 ),
    .AddressWidth( 4 ))
layer10_weights_U(
    .clk(ap_clk),
    .reset(ap_rst),
    .address0(layer10_weights_address0),
    .ce0(layer10_weights_ce0),
    .q0(layer10_weights_q0)
);

nn_inference_facc_32ns_32ns_1ns_32_3_no_dsp_1 #(
    .DWIDTH( 32 ))
facc_32ns_32ns_1ns_32_3_no_dsp_1_U88(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .in_data(reg_169),
    .in_last(grp_fu_196_p2),
    .in_valid(grp_fu_196_in_valid),
    .out_data(grp_fu_196_p3)
);

nn_inference_facc_32ns_32ns_1ns_32_3_no_dsp_1 #(
    .DWIDTH( 32 ))
facc_32ns_32ns_1ns_32_3_no_dsp_1_U89(
    .clk(ap_clk),
    .reset(ap_rst),
    .ce(1'b1),
    .in_data(reg_169),
    .in_last(grp_fu_237_p2),
    .in_valid(grp_fu_237_in_valid),
    .out_data(grp_fu_237_p3)
);

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_CS_fsm <= ap_ST_fsm_state1;
    end else begin
        ap_CS_fsm <= ap_NS_fsm;
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp0_stage0_subdone) & (1'b1 == ap_CS_fsm_pp0_stage0) & (1'b1 == ap_condition_pp0_exit_iter0_state2))) begin
            ap_enable_reg_pp0_iter0 <= 1'b0;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp0_exit_iter0_state2)) begin
                ap_enable_reg_pp0_iter1 <= (1'b1 ^ ap_condition_pp0_exit_iter0_state2);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp0_iter1 <= ap_enable_reg_pp0_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter2 <= ap_enable_reg_pp0_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter3 <= ap_enable_reg_pp0_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter4 <= ap_enable_reg_pp0_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter5 <= ap_enable_reg_pp0_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter6 <= ap_enable_reg_pp0_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp0_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp0_stage0_subdone)) begin
            ap_enable_reg_pp0_iter7 <= ap_enable_reg_pp0_iter6;
        end else if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
            ap_enable_reg_pp0_iter7 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter0 <= 1'b0;
    end else begin
        if (((1'b0 == ap_block_pp1_stage0_subdone) & (1'b1 == ap_CS_fsm_pp1_stage0) & (1'b1 == ap_condition_pp1_exit_iter0_state11))) begin
            ap_enable_reg_pp1_iter0 <= 1'b0;
        end else if ((1'b1 == ap_CS_fsm_state10)) begin
            ap_enable_reg_pp1_iter0 <= 1'b1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter1 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            if ((1'b1 == ap_condition_pp1_exit_iter0_state11)) begin
                ap_enable_reg_pp1_iter1 <= (1'b1 ^ ap_condition_pp1_exit_iter0_state11);
            end else if ((1'b1 == 1'b1)) begin
                ap_enable_reg_pp1_iter1 <= ap_enable_reg_pp1_iter0;
            end
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter2 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter2 <= ap_enable_reg_pp1_iter1;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter3 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter3 <= ap_enable_reg_pp1_iter2;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter4 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter4 <= ap_enable_reg_pp1_iter3;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter5 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter5 <= ap_enable_reg_pp1_iter4;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter6 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter6 <= ap_enable_reg_pp1_iter5;
        end
    end
end

always @ (posedge ap_clk) begin
    if (ap_rst == 1'b1) begin
        ap_enable_reg_pp1_iter7 <= 1'b0;
    end else begin
        if ((1'b0 == ap_block_pp1_stage0_subdone)) begin
            ap_enable_reg_pp1_iter7 <= ap_enable_reg_pp1_iter6;
        end else if ((1'b1 == ap_CS_fsm_state10)) begin
            ap_enable_reg_pp1_iter7 <= 1'b0;
        end
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        j_0_reg_105 <= 4'd0;
    end else if (((icmp_ln70_reg_251 == 1'd0) & (1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        j_0_reg_105 <= add_ln70_reg_245;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        j_1_reg_129 <= 4'd0;
    end else if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (icmp_ln70_1_reg_281 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1))) begin
        j_1_reg_129 <= add_ln70_1_reg_275;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
        sum_0_reg_116 <= 32'd0;
    end else if (((1'b0 == ap_block_pp0_stage0_11001) & (ap_enable_reg_pp0_iter7 == 1'b1) & (icmp_ln70_reg_251_pp0_iter6_reg == 1'd0))) begin
        sum_0_reg_116 <= grp_fu_196_p3;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b1 == ap_CS_fsm_state10)) begin
        sum_19_reg_140 <= 32'd0;
    end else if (((1'b0 == ap_block_pp1_stage0_11001) & (ap_enable_reg_pp1_iter7 == 1'b1) & (icmp_ln70_1_reg_281_pp1_iter6_reg == 1'd0))) begin
        sum_19_reg_140 <= grp_fu_237_p3;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        add_ln70_1_reg_275 <= add_ln70_1_fu_204_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0))) begin
        add_ln70_1_reg_275_pp1_iter1_reg <= add_ln70_1_reg_275;
        icmp_ln70_1_reg_281 <= icmp_ln70_1_fu_210_p2;
        icmp_ln70_1_reg_281_pp1_iter1_reg <= icmp_ln70_1_reg_281;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp1_stage0_11001)) begin
        add_ln70_1_reg_275_pp1_iter2_reg <= add_ln70_1_reg_275_pp1_iter1_reg;
        add_ln70_1_reg_275_pp1_iter3_reg <= add_ln70_1_reg_275_pp1_iter2_reg;
        add_ln70_1_reg_275_pp1_iter4_reg <= add_ln70_1_reg_275_pp1_iter3_reg;
        icmp_ln70_1_reg_281_pp1_iter2_reg <= icmp_ln70_1_reg_281_pp1_iter1_reg;
        icmp_ln70_1_reg_281_pp1_iter3_reg <= icmp_ln70_1_reg_281_pp1_iter2_reg;
        icmp_ln70_1_reg_281_pp1_iter4_reg <= icmp_ln70_1_reg_281_pp1_iter3_reg;
        icmp_ln70_1_reg_281_pp1_iter5_reg <= icmp_ln70_1_reg_281_pp1_iter4_reg;
        icmp_ln70_1_reg_281_pp1_iter6_reg <= icmp_ln70_1_reg_281_pp1_iter5_reg;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        add_ln70_reg_245 <= add_ln70_fu_173_p2;
    end
end

always @ (posedge ap_clk) begin
    if (((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        add_ln70_reg_245_pp0_iter1_reg <= add_ln70_reg_245;
        icmp_ln70_reg_251 <= icmp_ln70_fu_179_p2;
        icmp_ln70_reg_251_pp0_iter1_reg <= icmp_ln70_reg_251;
    end
end

always @ (posedge ap_clk) begin
    if ((1'b0 == ap_block_pp0_stage0_11001)) begin
        add_ln70_reg_245_pp0_iter2_reg <= add_ln70_reg_245_pp0_iter1_reg;
        add_ln70_reg_245_pp0_iter3_reg <= add_ln70_reg_245_pp0_iter2_reg;
        add_ln70_reg_245_pp0_iter4_reg <= add_ln70_reg_245_pp0_iter3_reg;
        icmp_ln70_reg_251_pp0_iter2_reg <= icmp_ln70_reg_251_pp0_iter1_reg;
        icmp_ln70_reg_251_pp0_iter3_reg <= icmp_ln70_reg_251_pp0_iter2_reg;
        icmp_ln70_reg_251_pp0_iter4_reg <= icmp_ln70_reg_251_pp0_iter3_reg;
        icmp_ln70_reg_251_pp0_iter5_reg <= icmp_ln70_reg_251_pp0_iter4_reg;
        icmp_ln70_reg_251_pp0_iter6_reg <= icmp_ln70_reg_251_pp0_iter5_reg;
    end
end

always @ (posedge ap_clk) begin
    if ((((1'b0 == ap_block_pp1_stage0_11001) & (icmp_ln70_1_reg_281_pp1_iter3_reg == 1'd0) & (ap_enable_reg_pp1_iter4 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (icmp_ln70_reg_251_pp0_iter3_reg == 1'd0) & (ap_enable_reg_pp0_iter4 == 1'b1)))) begin
        reg_169 <= grp_fu_35017_p_dout0;
    end
end

always @ (*) begin
    if ((icmp_ln70_fu_179_p2 == 1'd1)) begin
        ap_condition_pp0_exit_iter0_state2 = 1'b1;
    end else begin
        ap_condition_pp0_exit_iter0_state2 = 1'b0;
    end
end

always @ (*) begin
    if ((icmp_ln70_1_fu_210_p2 == 1'd1)) begin
        ap_condition_pp1_exit_iter0_state11 = 1'b1;
    end else begin
        ap_condition_pp1_exit_iter0_state11 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | ((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0)))) begin
        ap_done = 1'b1;
    end else begin
        ap_done = 1'b0;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b0))) begin
        ap_idle = 1'b1;
    end else begin
        ap_idle = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp0_iter1 == 1'b0) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter5 == 1'b0) & (ap_enable_reg_pp0_iter3 == 1'b0) & (ap_enable_reg_pp0_iter2 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b0) & (ap_enable_reg_pp0_iter0 == 1'b0) & (ap_enable_reg_pp0_iter4 == 1'b0))) begin
        ap_idle_pp0 = 1'b1;
    end else begin
        ap_idle_pp0 = 1'b0;
    end
end

always @ (*) begin
    if (((ap_enable_reg_pp1_iter6 == 1'b0) & (ap_enable_reg_pp1_iter5 == 1'b0) & (ap_enable_reg_pp1_iter3 == 1'b0) & (ap_enable_reg_pp1_iter2 == 1'b0) & (ap_enable_reg_pp1_iter7 == 1'b0) & (ap_enable_reg_pp1_iter0 == 1'b0) & (ap_enable_reg_pp1_iter4 == 1'b0) & (ap_enable_reg_pp1_iter1 == 1'b0))) begin
        ap_idle_pp1 = 1'b1;
    end else begin
        ap_idle_pp1 = 1'b0;
    end
end

always @ (*) begin
    if (((icmp_ln70_reg_251 == 1'd0) & (1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter1 == 1'b1) & (1'b1 == ap_CS_fsm_pp0_stage0))) begin
        ap_phi_mux_j_0_phi_fu_109_p4 = add_ln70_reg_245;
    end else begin
        ap_phi_mux_j_0_phi_fu_109_p4 = j_0_reg_105;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (icmp_ln70_1_reg_281 == 1'd0) & (ap_enable_reg_pp1_iter1 == 1'b1))) begin
        ap_phi_mux_j_1_phi_fu_133_p4 = add_ln70_1_reg_275;
    end else begin
        ap_phi_mux_j_1_phi_fu_133_p4 = j_1_reg_129;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state19)) begin
        ap_ready = 1'b1;
    end else begin
        ap_ready = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp0_stage0) & (ap_enable_reg_pp0_iter5 == 1'b1) & (icmp_ln70_reg_251_pp0_iter4_reg == 1'd0))) begin
        grp_fu_196_in_valid = 1'b1;
    end else begin
        grp_fu_196_in_valid = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0) & (ap_enable_reg_pp1_iter5 == 1'b1) & (icmp_ln70_1_reg_281_pp1_iter4_reg == 1'd0))) begin
        grp_fu_237_in_valid = 1'b1;
    end else begin
        grp_fu_237_in_valid = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        input_r_address0 = j_1_cast_fu_216_p1;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        input_r_address0 = j_0_cast_fu_185_p1;
    end else begin
        input_r_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        input_r_ce0 = 1'b1;
    end else begin
        input_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    if (((1'b0 == ap_block_pp1_stage0) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1))) begin
        layer10_weights_address0 = zext_ln72_fu_227_p1;
    end else if (((1'b0 == ap_block_pp0_stage0) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1))) begin
        layer10_weights_address0 = j_0_cast_fu_185_p1;
    end else begin
        layer10_weights_address0 = 'bx;
    end
end

always @ (*) begin
    if ((((1'b0 == ap_block_pp1_stage0_11001) & (1'b1 == ap_CS_fsm_pp1_stage0) & (ap_enable_reg_pp1_iter0 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_11001) & (1'b1 == ap_CS_fsm_pp0_stage0) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
        layer10_weights_ce0 = 1'b1;
    end else begin
        layer10_weights_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state19)) begin
        output_r_address0 = 64'd1;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        output_r_address0 = 64'd0;
    end else begin
        output_r_address0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | (1'b1 == ap_CS_fsm_state10))) begin
        output_r_ce0 = 1'b1;
    end else begin
        output_r_ce0 = 1'b0;
    end
end

always @ (*) begin
    if ((1'b1 == ap_CS_fsm_state19)) begin
        output_r_d0 = sum_19_reg_140;
    end else if ((1'b1 == ap_CS_fsm_state10)) begin
        output_r_d0 = sum_0_reg_116;
    end else begin
        output_r_d0 = 'bx;
    end
end

always @ (*) begin
    if (((1'b1 == ap_CS_fsm_state19) | (1'b1 == ap_CS_fsm_state10))) begin
        output_r_we0 = 1'b1;
    end else begin
        output_r_we0 = 1'b0;
    end
end

always @ (*) begin
    case (ap_CS_fsm)
        ap_ST_fsm_state1 : begin
            if (((1'b1 == ap_CS_fsm_state1) & (ap_start == 1'b1))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else begin
                ap_NS_fsm = ap_ST_fsm_state1;
            end
        end
        ap_ST_fsm_pp0_stage0 : begin
            if ((~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln70_fu_179_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1)) & ~((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end else if ((((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter6 == 1'b0) & (ap_enable_reg_pp0_iter7 == 1'b1)) | ((1'b0 == ap_block_pp0_stage0_subdone) & (ap_enable_reg_pp0_iter1 == 1'b0) & (icmp_ln70_fu_179_p2 == 1'd1) & (ap_enable_reg_pp0_iter0 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_state10;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp0_stage0;
            end
        end
        ap_ST_fsm_state10 : begin
            ap_NS_fsm = ap_ST_fsm_pp1_stage0;
        end
        ap_ST_fsm_pp1_stage0 : begin
            if ((~((1'b0 == ap_block_pp1_stage0_subdone) & (icmp_ln70_1_fu_210_p2 == 1'd1) & (ap_enable_reg_pp1_iter0 == 1'b1) & (ap_enable_reg_pp1_iter1 == 1'b0)) & ~((1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter6 == 1'b0) & (ap_enable_reg_pp1_iter7 == 1'b1)))) begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end else if ((((1'b0 == ap_block_pp1_stage0_subdone) & (ap_enable_reg_pp1_iter6 == 1'b0) & (ap_enable_reg_pp1_iter7 == 1'b1)) | ((1'b0 == ap_block_pp1_stage0_subdone) & (icmp_ln70_1_fu_210_p2 == 1'd1) & (ap_enable_reg_pp1_iter0 == 1'b1) & (ap_enable_reg_pp1_iter1 == 1'b0)))) begin
                ap_NS_fsm = ap_ST_fsm_state19;
            end else begin
                ap_NS_fsm = ap_ST_fsm_pp1_stage0;
            end
        end
        ap_ST_fsm_state19 : begin
            ap_NS_fsm = ap_ST_fsm_state1;
        end
        default : begin
            ap_NS_fsm = 'bx;
        end
    endcase
end

assign add_ln70_1_fu_204_p2 = (ap_phi_mux_j_1_phi_fu_133_p4 + 4'd1);

assign add_ln70_fu_173_p2 = (ap_phi_mux_j_0_phi_fu_109_p4 + 4'd1);

assign ap_CS_fsm_pp0_stage0 = ap_CS_fsm[32'd1];

assign ap_CS_fsm_pp1_stage0 = ap_CS_fsm[32'd3];

assign ap_CS_fsm_state1 = ap_CS_fsm[32'd0];

assign ap_CS_fsm_state10 = ap_CS_fsm[32'd2];

assign ap_CS_fsm_state19 = ap_CS_fsm[32'd4];

assign ap_block_pp0_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp0_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_11001 = ~(1'b1 == 1'b1);

assign ap_block_pp1_stage0_subdone = ~(1'b1 == 1'b1);

assign ap_block_state11_pp1_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state12_pp1_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state13_pp1_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state14_pp1_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state15_pp1_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state16_pp1_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state17_pp1_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state18_pp1_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_block_state2_pp0_stage0_iter0 = ~(1'b1 == 1'b1);

assign ap_block_state3_pp0_stage0_iter1 = ~(1'b1 == 1'b1);

assign ap_block_state4_pp0_stage0_iter2 = ~(1'b1 == 1'b1);

assign ap_block_state5_pp0_stage0_iter3 = ~(1'b1 == 1'b1);

assign ap_block_state6_pp0_stage0_iter4 = ~(1'b1 == 1'b1);

assign ap_block_state7_pp0_stage0_iter5 = ~(1'b1 == 1'b1);

assign ap_block_state8_pp0_stage0_iter6 = ~(1'b1 == 1'b1);

assign ap_block_state9_pp0_stage0_iter7 = ~(1'b1 == 1'b1);

assign ap_enable_pp0 = (ap_idle_pp0 ^ 1'b1);

assign ap_enable_pp1 = (ap_idle_pp1 ^ 1'b1);

assign grp_fu_153_ce = 1'b1;

assign grp_fu_153_p0 = layer10_weights_q0;

assign grp_fu_153_p1 = input_r_q0;

assign grp_fu_153_p2 = grp_fu_35017_p_dout0;

assign grp_fu_196_p2 = ((add_ln70_reg_245_pp0_iter4_reg == 4'd8) ? 1'b1 : 1'b0);

assign grp_fu_237_p2 = ((add_ln70_1_reg_275_pp1_iter4_reg == 4'd8) ? 1'b1 : 1'b0);

assign grp_fu_35017_p_ce = 1'b1;

assign grp_fu_35017_p_din0 = layer10_weights_q0;

assign grp_fu_35017_p_din1 = input_r_q0;

assign icmp_ln70_1_fu_210_p2 = ((ap_phi_mux_j_1_phi_fu_133_p4 == 4'd8) ? 1'b1 : 1'b0);

assign icmp_ln70_fu_179_p2 = ((ap_phi_mux_j_0_phi_fu_109_p4 == 4'd8) ? 1'b1 : 1'b0);

assign j_0_cast_fu_185_p1 = ap_phi_mux_j_0_phi_fu_109_p4;

assign j_1_cast_fu_216_p1 = ap_phi_mux_j_1_phi_fu_133_p4;

assign xor_ln72_fu_221_p2 = (ap_phi_mux_j_1_phi_fu_133_p4 ^ 4'd8);

assign zext_ln72_fu_227_p1 = xor_ln72_fu_221_p2;

endmodule //nn_inference_mat_mul_3