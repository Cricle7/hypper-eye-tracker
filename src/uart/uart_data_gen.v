`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company:Meyesemi 
// Engineer: Will
// 
// Create Date: 2023-01-29 20:31  
// Design Name:  
// Module Name: 
// Project Name: 
// Target Devices: Pango
// Tool Versions: 
// Description: 
//      
// Dependencies: 
// 
// Revision:
// Revision 1.0 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////

`define UD #1
module uart_data_gen(
    input               reset,
    input               clk,
    input      [7:0]    read_data,
    input               tx_busy,
    input      [7:0]    write_max_num,

    input   [1:0]  r_vsync_i,
    input   [42:0] target_pos_out1,
    input   [42:0] target_pos_out2,

    output reg [7:0]    write_data,
    output reg          write_en
);
   
    wire [63:0] data_buf; 
    reg [10:0] x1,x2;
    reg [9:0] y1,y2;

    reg [10:0] target_pos1_part1_stage1, target_pos1_part2_stage1;
    reg [10:0] target_pos2_part1_stage1, target_pos2_part2_stage1;
    reg [9:0]  target_pos1_part3_stage1, target_pos1_part4_stage1;
    reg [9:0]  target_pos2_part3_stage1, target_pos2_part4_stage1;

    reg [11:0] sum1_stage2, sum2_stage2;
    reg [10:0] sum3_stage2, sum4_stage2;

    reg r_vsync_i_stage1, r_vsync_i_stage2;

    always @(posedge clk) begin
        if (reset) begin
            // 第一级流水线寄存器复位
            target_pos1_part1_stage1 <= 0;
            target_pos1_part2_stage1 <= 0;
            target_pos2_part1_stage1 <= 0;
            target_pos2_part2_stage1 <= 0;
            target_pos1_part3_stage1 <= 0;
            target_pos1_part4_stage1 <= 0;
            target_pos2_part3_stage1 <= 0;
            target_pos2_part4_stage1 <= 0;
            r_vsync_i_stage1 <= 0;
        end else begin
            // 第一级流水线寄存器赋值
            target_pos1_part1_stage1 <= target_pos_out1[31:21];
            target_pos1_part2_stage1 <= target_pos_out1[10:0];
            target_pos2_part1_stage1 <= target_pos_out2[31:21];
            target_pos2_part2_stage1 <= target_pos_out2[10:0];
            target_pos1_part3_stage1 <= target_pos_out1[41:32];
            target_pos1_part4_stage1 <= target_pos_out1[20:11];
            target_pos2_part3_stage1 <= target_pos_out2[41:32];
            target_pos2_part4_stage1 <= target_pos_out2[20:11];
            r_vsync_i_stage1 <= r_vsync_i;
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            // 第二级流水线寄存器复位
            sum1_stage2 <= 0;
            sum2_stage2 <= 0;
            sum3_stage2 <= 0;
            sum4_stage2 <= 0;
            r_vsync_i_stage2 <= 0;
        end else begin
            // 执行加法操作并存储结果
            sum1_stage2 <= target_pos1_part1_stage1 + target_pos1_part2_stage1;
            sum2_stage2 <= target_pos2_part1_stage1 + target_pos2_part2_stage1;
            sum3_stage2 <= target_pos1_part3_stage1 + target_pos1_part4_stage1;
            sum4_stage2 <= target_pos2_part3_stage1 + target_pos2_part4_stage1;
            r_vsync_i_stage2 <= r_vsync_i_stage1;
        end
    end

    always @(posedge clk) begin
        if (reset) begin
            x1 <= 0;
            x2 <= 0;
            y1 <= 0;
            y2 <= 0;
        end else if (r_vsync_i_stage2 == 2'b01) begin
            // 使用第二级流水线的加法结果
            x1 <= sum1_stage2[11:1];
            x2 <= sum2_stage2[11:1];
            y1 <= sum3_stage2[10:1];
            y2 <= sum4_stage2[10:1];
        end
    end
 //   assign x1 = (target_pos_out1[31:21] + target_pos_out1[10:0])>>1;
    //assign x2 = (target_pos_out2[31:21] + target_pos_out2[10:0])>>1;
    //assign y1 = (target_pos_out1[41:32] + target_pos_out1[20:11])>>1;
    //assign y2 = (target_pos_out2[41:32] + target_pos_out2[20:11])>>1;
    //assign data_buf = 64'hFFF0FFFF; 
    assign data_buf = {8'hff, 8'hff, 6'b000000,  x1 , y1, x2, y2}; 

    reg [ 7:0] data_num;

    // 设置串口发射工作区间
    reg        work_en;
    reg        work_en_1d;
    always @(posedge clk) begin
        if (reset) begin
            work_en <= `UD 1'b0;
        end else if(r_vsync_i == 2'b01)
            work_en <= `UD 1'b1;
        else if(data_num == write_max_num-1'b1)
            work_en <= `UD 1'b0;
    end
    
    always @(posedge clk) begin
        if (reset) begin
            work_en_1d <= 1'b0;
        end else
        work_en_1d <= work_en;
    end

    // get the tx_busy‘s falling edge   获取tx_busy的下降沿
    reg            tx_busy_reg=0;
    wire           tx_busy_f;
    always @ (posedge clk) tx_busy_reg <= tx_busy;
    
    assign tx_busy_f = (!tx_busy) && (tx_busy_reg);
    
    // 串口发射数据触发信号
    reg write_pluse;
    always @ (posedge clk) begin
        if (reset) begin
            write_pluse <= `UD 1'b0;
        end else if(work_en) begin
            if(~work_en_1d || tx_busy_f)
                write_pluse <= `UD 1'b1;
            else
                write_pluse <= `UD 1'b0;
        end else
            write_pluse <= `UD 1'b0;
    end
    
    always @ (posedge clk) begin
        if (reset)
            data_num   <= 7'h0;
        else if (~work_en & tx_busy_f)
            data_num   <= 7'h0;
        else if (write_pluse)
            data_num   <= data_num + 8'h1;
    end
    
    always @(posedge clk) begin
        write_en <= `UD write_pluse;
    end

//  字符的对应ASCII码
    always @ (posedge clk) begin
        if (reset) begin
            write_data <= 8'h0;
        end else begin case(data_num)
                8'd0  ,
                8'd1  :	write_data <= data_buf[63:56];// ASCII code is w
                8'd2  :	write_data <= data_buf[55:48];// ASCII code is w
                8'd3  :	write_data <= data_buf[47:40];// ASCII code is w
                8'd4  :	write_data <= data_buf[39:32];// ASCII code is .
                8'd5  :	write_data <= data_buf[31:24];// ASCII code is m
                8'd6  :	write_data <= data_buf[23:16];// ASCII code is y
                8'd7  :	write_data <= data_buf[15:8];// ASCII code is e
                8'd8  :	write_data <= data_buf[7:0];// ASCII code is s
                8'd9 :	write_data <= 8'h0d;
                8'd10 :	write_data <= 8'h0a;
                default :	write_data <= 0;
            endcase
        end
    end

endmodule
