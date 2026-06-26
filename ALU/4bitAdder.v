module Adder
(   input [3:0]a,
    input [3:0]b,
    output cfinal,
    output [3:0]s  
);
    wire [3:0]c;
    HA h(.a(a[0]),.b(b[0]),.carry(c[0]),.sum(s[0]));
    FA f1(.x(a[1]),.y(b[1]),.cin(c[0]),.cout(c[1]),.s(s[1]));
    FA f2(.x(a[2]),.y(b[2]),.cin(c[1]),.cout(c[2]),.s(s[2]));
    FA f3(.x(a[3]),.y(b[3]),.cin(c[2]),.cout(c[3]),.s(s[3]));
    assign cfinal = c[3];
endmodule