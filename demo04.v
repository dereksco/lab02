`timescale  1ns/1ns


module  demo04
(
    input   wire    sys_clk     ,    
    input   wire    sys_rst_n   ,   //全局复位
    input   wire    key_in      ,   //输入按键

    output  reg     led_out         //输出控制led灯
);

always@(posedge sys_clk)    //当always块中的敏感列表为检测到sys_clk上升沿时执行下面的语句
    if(sys_rst_n == 1'b0)   //sys_rst_n为低电平时复位 
        led_out <= 1'b0;     
    else
        led_out <= key_in;

 

endmodule
