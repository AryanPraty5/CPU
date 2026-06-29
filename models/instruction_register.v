module instruction__register
(
    inout [7:0]bus,
    input clk,load,drive,reset,
    output [3:0]opcode
);

    reg [7:0]data;
    wire [3:0]info;
    always@(posedge clk)
        begin
            if(reset)
                data <= 8'b0000_0000;
            else if(load)
                data <= bus;
        end
    
    assign opcode = data[6:4];
    assign info = data[3:0];
    assign bus = (drive) ? {3'b000,info} : 8'bz;
endmodule