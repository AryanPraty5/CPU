module ram_model(
    input clk,wr,       // wr = 0 =>RAM is writng onto bus; wr=1 => RAM is reading from the bus
    inout [7:0]bus,
    input switch        // takes address if switch = 0 else takes memory element
);

    reg [7:0] mem[0:15]; // 16 of the 8bits array acting as RAM
    reg [3:0]address;
    initial begin
        mem[0] = 4'hf;
        mem[1] = 4'he;
        mem[2] = 4'hd;
        mem[3] = 4'hc;
        mem[4] = 4'hb;
        mem[5] = 4'ha;
        mem[6] = 4'h9;
        mem[7] = 4'h3;
        mem[8] = 4'h7;  //hehe
        mem[9] = 4'h6;
        mem[10] = 4'h5;
        mem[11] = 4'h4;
        mem[12] = 4'h3;
        mem[13] = 4'h2;
        mem[14] = 4'h1;
        mem[15] = 4'h0;
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






