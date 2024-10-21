`timescale  1ns/1ns
 

module  tb_demo06();

 
wire    [3:0]   led_out     ;

//reg   define
reg             sys_clk     ;
reg             sys_rst_n   ;

 
initial begin
    sys_clk    = 1'b1;
    sys_rst_n <= 1'b0;
    #20
    sys_rst_n <= 1'b1;
end

 
always #10 sys_clk = ~sys_clk;

 
demo06   
#(
    .CNT_MAX    (25'd24)
)
water_led_inst
(
    .sys_clk    (sys_clk    ),  //input          sys_clk
    .sys_rst_n  (sys_rst_n  ),  //input          sys_rst_n
                    
    .led_out    (led_out    )   //output  [3:0]  led_out
);

endmodule
