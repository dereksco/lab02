`timescale  1ns/1ns
 

module  tb_demo04();

 
wire            led_out     ;

//reg   define
reg             sys_clk     ;
reg             sys_rst_n   ;
reg             key_in      ;

 
initial begin
    sys_clk    = 1'b1;   
    sys_rst_n <= 1'b0;  //因为低电平复位，所以复位信号的初始化为0
    key_in    <= 1'b0;  //输入信号按键的初始化，为0和1均可
    #20
    sys_rst_n <= 1'b1;  //初始化20ns后，复位释放，因为是低电平复位，所示释放时，把信号拉高，电路开始工作
    #210
    sys_rst_n <= 1'b0;  
    #40
    sys_rst_n <= 1'b1;  //复位40ns后再次让复位释放掉
end


always #10 sys_clk = ~sys_clk; //使用always产生时钟信号，让时钟每隔10ns反转一次，即一个时钟周期为20ns，换算为频率为50Mhz

 
always #20 key_in <= {$random} % 2;  

initial begin
    $timeformat(-9, 0, "ns", 6);
    $monitor("@time %t: key_in=%b led_out=%b", $time, key_in, led_out);
end


demo04   demo04_inst
(
    .sys_clk    (sys_clk    ),  //input     sys_clk
    .sys_rst_n  (sys_rst_n  ),  //input     sys_rst_n
    .key_in     (key_in     ),  //input     key_in

    .led_out    (led_out    )   //output    led_out
);

endmodule
