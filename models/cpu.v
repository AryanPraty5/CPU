module cpu
(
    input clk,reset
);

    wire [7:0]bus;
    wire load_acc,drive_acc;        //acc functions    
    wire load_b,drive_b;              //b functions
    wire reset_registers;            //registers
    wire load_ir,drive_ir,reset_ir;   //ir functions
    wire alu_drive;
    wire jump;
    wire [1:0]op;
    wire wr,switch;
    wire pc_out,ce,reset_pc;
    wire [2:0]opcode;

    control_unit cu(.clk(clk),.reset(reset),
    .opcode(opcode),
    .load_acc(load_acc),.drive_acc(drive_acc),           
    .load_b(load_b),.drive_b(drive_b),            
    .reset_registers(reset_registers),            
    .load_ir(load_ir),.drive_ir(drive_ir),.reset_ir(reset_ir),   
    .alu_drive(alu_drive),
    .jump(jump),
    .op(op),
    .wr(wr),.switch(switch),
    .pc_out(pc_out),.ce(ce),.reset_pc(reset_pc));


    data_path dp1(.bus(bus),.clk(clk),.reset(reset),
    .load_acc(load_acc),.drive_acc(drive_acc),           
    .load_b(load_b),.drive_b(drive_b),            
    .reset_registers(reset_registers),            
    .load_ir(load_ir),.drive_ir(drive_ir),.reset_ir(reset_ir),   
    .alu_drive(alu_drive),
    .jump(jump),
    .op(op),
    .wr(wr),.switch(switch),
    .pc_out(pc_out),.ce(ce),.reset_pc(reset_pc),
    .opcode(opcode));

endmodule

