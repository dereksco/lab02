`timescale  1ns/1ns
 
module  demo05
#(
    parameter   CNT_MAX = 25'd24_999_999 
)
(
    input   wire    sys_clk     ,   //系统时钟50MHz
    input   wire    sys_rst_n   ,   //全局复位

    output  reg     led_out         //输出控制led灯
);


reg     [24:0]  cnt;                


always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        cnt <= 25'b0;
    else    if(cnt == CNT_MAX)
        cnt <= 25'b0;
    else
        cnt <= cnt + 1'b1;


always@(posedge sys_clk or negedge sys_rst_n)
    if(sys_rst_n == 1'b0)
        led_out <= 1'b0;
    else    if(cnt == CNT_MAX)
        led_out <= ~led_out;

endmodule

