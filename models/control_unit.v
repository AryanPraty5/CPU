module control_unit
(
    input clk,reset,
    input [2:0]opcode,
    output reg load_acc,drive_acc,        //acc functions    
    output reg load_b,drive_b,              //b functions
    output reg reset_registers,            //registers
    output reg load_ir,drive_ir,reset_ir,   //ir functions
    output reg alu_drive,
    output reg jump,
    output reg [1:0]op,
    output reg wr,switch,
    output reg pc_out,ce,reset_pc
);

    reg [3:0]state;

    parameter LoadA1 = 1;
    parameter LoadA2 = 2;
    parameter LoadB1 = 3;
    parameter LoadB2 = 4;
    parameter Add = 5;
    parameter Sub = 6;
    parameter Jump = 7;
    parameter Out = 8;
    parameter Halt = 9;
    parameter Store1 = 10;
    parameter Store2 = 11;
    parameter Fetch1 = 12;
    parameter Fetch2 = 13;
    parameter Decode = 14;
    

    always@(posedge clk)
        begin
            if(reset)
                state <= Fetch1;
            else
                begin
                    case(state)
                    Fetch1 : state <= Fetch2;
                    Fetch2 : state <= Decode;
                    Decode : begin
                                case(opcode)
                                3'b000: state <= LoadA1;
                                3'b001: state <= Store1;
                                3'b010: state <= Add;
                                3'b011: state <= Sub;
                                3'b100: state <= LoadB1;
                                3'b101: state <= Jump;
                                3'b110: state <= Out;
                                3'b111: state <= Halt;
                                endcase
                            end
                    LoadA1 : state <= LoadA2;
                    LoadA2 : state <= Fetch1;
                    Store1 : state <= Store2;
                    Store2 : state <= Fetch1;
                    Add    : state <= Store1;
                    Sub    : state <= Store1;
                    Jump   : state <= Fetch1;
                    Out    : state <= Fetch1;
                    Halt   : state <= Halt;
                    endcase
                end
        end

        always@(*)
            begin
                pc_out =0;ce =0; wr =1; load_ir =0;drive_ir =0;load_acc =0;
                drive_acc =0;load_b =0;drive_b=0;alu_drive =0;reset_registers=1;
                jump =0;op = 2'b00;switch =0;reset_pc=1;reset_ir=1;
                case(state)
                Fetch1 : begin pc_out = 1;wr = 1;reset_registers=0;reset_ir=0;reset_pc=0; end
                Fetch2 : begin wr = 0 ;load_ir = 1;ce = 1;end
                LoadA1 : begin drive_ir = 1; wr = 1;end
                LoadA2 : begin wr = 0;load_acc = 1;end
                Store1 : begin drive_ir = 1;wr=0;switch=0;end   //the address where ACC's value is to be stored
                Store2 : begin wr=0;switch=1;drive_acc=1;end
                LoadB1 : begin drive_ir = 1; wr = 1;end
                LoadB2 : begin wr=0;load_b=1;end
                Add    : begin alu_drive=1;load_acc=1;op=2'b00;end
                Sub    : begin alu_drive=1;load_acc=1;op=2'b11;end
                Jump   : begin jump =1;end
                Out    : begin drive_acc =1;end
                Halt   : begin pc_out =0;ce =0; wr =1; load_ir =0;drive_ir =0;load_acc =0;
                drive_acc =0;load_b =0;drive_b=0;alu_drive =0;jump =0;op = 2'b00;switch =0;  end
                endcase
            end
endmodule


    