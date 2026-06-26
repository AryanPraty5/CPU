module bus_system(
    inout [7:0]bus,
    input clk,reset,
    input load_acc,drive_acc,
    input load_b,drive_b,
    input alu_drive,
    input [1:0]op,
    output [7:0]ALU_out
);

    wire [7:0]acc_data_out;
    wire [7:0]b_data_out;
    
    bus_register ACC(.bus(bus),.clk(clk),.reset(reset),.drive(drive_acc),.load(load_acc),.data_out(acc_data_out));
    bus_register B(.bus(bus),.clk(clk),.reset(reset),.drive(drive_b),.load(load_b),.data_out(b_data_out));
    
    wire [7:0]alu_out;
    
    FullModel f1(.m(acc_data_out[3:0]),.n(b_data_out[3:0]),.op(op),.ans(alu_out));

    assign ALU_out = alu_out;
    assign bus = (alu_drive) ? alu_out : 8'bz;
    
endmodule



