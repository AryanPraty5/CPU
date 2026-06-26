`timescale 1ns/1ps

module cpu_tb;

reg clk,reset;

cpu CPU1(.clk(clk),.reset(reset));

initial begin
    clk =0;
    forever #5 clk = ~clk;
end

initial
    begin
        reset =1;
        #11;
        reset =0;
    end
endmodule