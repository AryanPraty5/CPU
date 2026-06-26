module BehaviouralDivider
(input [3:0]a,
 input [3:0]b,
 output [3:0]q,
 output [3:0]r
);

    assign q = b!=0 ? a/b : 8'hFF;
    assign r = b!=0 ? a%b : 8'hFF;

endmodule