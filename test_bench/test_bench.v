`timescale 1ns/1ps

module cpu_tb;

reg clk,reset,reset_all;

cpu CPU1(.clk(clk),.reset(reset),.reset_all(reset_all));

initial begin
    clk =0;
    forever #5 clk = ~clk;
end

initial
    begin
        reset =1;
        reset_all=1;
        #6;
        reset =0;
        reset_all=0;

        repeat(35)@(posedge clk);
        $stop;
    end
endmodule