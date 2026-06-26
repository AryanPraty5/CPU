module PC_model
(
    inout [7:0]bus,
    input pc_out,   // decides if to pass value to the bus
    input ce,       //enables the count(use when RAM is writing not reading)
    input jump,     //takes a jump instruction from the bus to change which program comes next
    input clk,
    input reset
    );

    reg [3:0]addr;
    always@(posedge clk)
        begin
            if(reset)
                addr <= 4'b0000;
            else if(jump)
                addr <= bus[3:0];
            else if(ce)
                addr <= addr + 4'b0001;
        end
    
    assign bus = (pc_out) ? {4'b0000,addr} : 8'bz;

endmodule
        
        
