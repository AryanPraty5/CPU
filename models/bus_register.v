module bus_register (
    inout [7:0]bus,
    input clk,reset,drive,load,
    output [7:0]data_out
);
    reg [7:0]info;

    always@(posedge clk)
        begin
            if(reset)
                info <= 8'b0000_0000;
            else if(load)
                info <= bus;
        end

    assign bus = (drive) ? info : 8'bz;
    assign data_out = info;

endmodule
