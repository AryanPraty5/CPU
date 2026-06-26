module FullModel
(
    input [3:0]m,
    input [3:0]n,
    input [1:0]op,
    output reg [7:0]ans
);
    wire [3:0]sum_out;
    wire carry_out;

    wire [3:0]diff_out;
    wire borrow_out;

    wire [7:0]mult_out;

    wire [3:0]quo_out;
    wire [3:0]rem_out;

    Adder a1(.a(m),.b(n),.cfinal(carry_out),.s(sum_out));
    Subtractor s1(.a(m),.b(n),.borrow(borrow_out),.diff(diff_out));
    Multiplier m1 (.a(m),.b(n),.p(mult_out));
    BehaviouralDivider d1(.a(m),.b(n),.q(quo_out),.r(rem_out));
    

    always@(*) begin
        case(op)
            2'b00:  ans = {3'b000, carry_out, sum_out};
            2'b01:  ans = {3'b000, borrow_out, diff_out};
            2'b10:  ans = mult_out;
            2'b11:  ans = {4'b0000,quo_out};
            default: ans = 8'b00000000;
        endcase
    end
endmodule
