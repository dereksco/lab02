`timescale  1ns/1ns
 

module  tb_demo05();

 
wire            led_out     ;

//reg   define
reg             sys_clk     ;
reg             sys_rst_n   ;

 

//初始化系统时钟、全局复位
initial begin
    sys_clk    = 1'b1;
    sys_rst_n <= 1'b0;
    #20
    sys_rst_n <= 1'b1;
end

 
always #10 sys_clk = ~sys_clk;

initial begin
    $timeformat(-9, 0, "ns", 6);
    $monitor("@time %t: led_out=%b", $time, led_out);
end

 
demo05
#(
    .CNT_MAX    (25'd24     )    
)
counter_inst
(
    .sys_clk    (sys_clk    ),  //input     sys_clk
    .sys_rst_n  (sys_rst_n  ),  //input     sys_rst_n

    .led_out    (led_out    )   //output    led_out
);

endmodule
