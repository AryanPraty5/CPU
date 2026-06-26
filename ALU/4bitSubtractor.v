module Subtractor
(input [3:0]a,
 input [3:0]b,
 output borrow,
 output [3:0]diff
);
    wire [3:0]c;
    wire ci;
    assign ci = 1;
    wire [3:0]not_b;
    assign not_b = ~b;
    
    
    FA fs1(.x(a[0]),.y(not_b[0]),.cin(ci),.cout(c[0]),.s(diff[0]));
    FA fs2(.x(a[1]),.y(not_b[1]),.cin(c[0]),.cout(c[1]),.s(diff[1]));
    FA fs3(.x(a[2]),.y(not_b[2]),.cin(c[1]),.cout(c[2]),.s(diff[2]));
    FA fs4(.x(a[3]),.y(not_b[3]),.cin(c[2]),.cout(c[3]),.s(diff[3]));

    assign borrow = ~c[3];
endmodule