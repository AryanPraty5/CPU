module HA 
(input a,input b,
output carry,output sum
);
    assign carry = a&b;
    assign sum = a^b;
endmodule