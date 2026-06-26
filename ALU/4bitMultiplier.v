module Multiplier
(input [3:0]a,
 input [3:0]b,
 output [7:0]p
);
    wire c[10:0];
    wire s[5:0];
    wire z[15:0];
    assign z[0]=a[0]&b[0];assign z[1]=a[1]&b[0];assign z[2]=a[0]&b[1];
    assign z[3]=a[2]&b[0];assign z[4]=a[1]&b[1];assign z[5]=a[0]&b[2];
    assign z[6]=a[3]&b[0];assign z[7]=a[2]&b[1];assign z[8]=a[1]&b[2];
    assign z[9]=a[0]&b[3];assign z[10]=a[3]&b[1];assign z[11]=a[2]&b[2];
    assign z[12]=a[1]&b[3];assign z[13]=a[3]&b[2];assign z[14]=a[2]&b[3];
    assign z[15]=a[3]&b[3];

    assign p[0]=z[0];
    HA h1(.a(z[1]),.b(z[2]),.carry(c[0]),.sum(p[1]));
    FA f1(.x(z[3]),.y(z[4]),.cin(c[0]),.cout(c[1]),.s(s[0]));
    HA h2(.a(z[5]),.b(s[0]),.carry(c[2]),.sum(p[2]));
    FA f2(.x(z[6]),.y(z[7]),.cin(c[1]),.cout(c[3]),.s(s[1]));
    FA f3(.x(z[8]),.y(s[1]),.cin(c[2]),.cout(c[4]),.s(s[2]));
    HA h3(.a(z[9]),.b(s[2]),.carry(c[5]),.sum(p[3]));
    HA h4(.a(z[10]),.b(c[3]),.carry(c[6]),.sum(s[3]));
    FA f4(.x(z[11]),.y(s[3]),.cin(c[4]),.cout(c[7]),.s(s[4]));
    FA f5(.x(z[12]),.y(s[4]),.cin(c[5]),.cout(c[8]),.s(p[4]));
    FA f6(.x(z[13]),.y(c[6]),.cin(c[7]),.cout(c[9]),.s(s[5]));
    FA f7(.x(z[14]),.y(s[5]),.cin(c[8]),.cout(c[10]),.s(p[5]));
    FA f8(.x(z[15]),.y(c[9]),.cin(c[10]),.cout(p[7]),.s(p[6]));

endmodule