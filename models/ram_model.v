module ram_model(
    input clk,wr,       // wr = 0 =>RAM is writng onto bus; wr=1 => RAM is reading from the bus
    inout [7:0]bus,
    input switch        // takes address if switch = 0 else takes memory element
);

    reg [7:0] mem[0:15]; // 16 of the 8bits array acting as RAM
    reg [3:0]address;
    initial begin
        mem[0] = 8'b0000_1000;  //8(operand 1)
        mem[1] = 8'b0100_0101;  //5(operand 2)
        mem[2] = 8'b0010_1011;  // for turning ADD on in opcode and address 11 for storing the value of ADD
        mem[3] = 8'b0101_1000;  //jump to address 8
        mem[4] = 8'b0000_0000;
        mem[5] = 8'b0000_0000;
        mem[6] = 8'b0000_0000;
        mem[7] = 8'b0000_0000;
        mem[8] = 8'b0100_0110;  //jumped to this address and it stores 6 for B
        mem[9] = 8'b0011_1101;  // for turning SUB on in opcode and address 13 for storing the value of SUB
        mem[10] = 8'b0111_0000; //  HALT
        mem[11] = 8'b0000_0000;         //here ALU add will be stored
        mem[12] = 8'b0000_0000;
        mem[13] = 8'b0000_0000;         //here ALU sub will be stored
        mem[14] = 8'b0000_0000;
        mem[15] = 8'b0000_0000;
    end

    always@(posedge clk)
        begin
            if(wr)
                begin
                    if(switch)
                        mem[address] <= bus;
                    else
                        address <= bus[3:0];
                end
        end
    
    assign bus = (!wr) ? mem[address] : 8'bz;

endmodule






