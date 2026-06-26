module data_path
(
    inout [7:0]bus,
    input clk,reset,
    input load_acc,drive_acc,        //acc functions    
    input load_b,drive_b,              //b functions
    input reset_registers,            //registers
    input load_ir,drive_ir,reset_ir,   //ir functions
    input alu_drive,
    input jump,
    input [1:0]op,
    input wr,switch,
    input pc_out,ce,reset_pc,
    output [2:0]opcode
);

    wire [7:0]ALU_out;

    bus_system b_s(.bus(bus),.clk(clk),.reset(reset_registers),.load_acc(load_acc),.drive_acc(drive_acc),
    .load_b(load_b),.drive_b(drive_b),.alu_drive(alu_drive),.op(op),.ALU_out(ALU_out));

    instruction__register ir(.bus(bus),.clk(clk),.load(load_ir),.drive(drive_ir),.reset(reset_ir),.opcode(opcode));

    PC_model pc(.bus(bus),.pc_out(pc_out),.ce(ce),.jump(jump),.clk(clk),.reset(reset_pc));

    ram_model ram(.clk(clk),.wr(wr),.bus(bus),.switch(switch));

endmodule

