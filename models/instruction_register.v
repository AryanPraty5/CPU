module instruction__register
(
    inout [7:0]bus,
    input clk,load,drive,reset,
    output [2:0]opcode
);

    reg [7:0]data;
    wire [4:0]info;
    always@(posedge clk)
        begin
            if(reset)
                data <= 8'b0000_0000;
            else if(load)
                data <= bus;
        end
    
    assign opcode = data[7:5];
    assign info = data[4:0];
    assign bus = (drive) ? info : 8'bz;
endmodule