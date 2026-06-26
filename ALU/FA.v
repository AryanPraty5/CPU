module FA 
(input x,input y,input cin,
output cout, output s
);
    wire c1,c2,s1;
    HA h1(.a(x),.b(y),.carry(c1),.sum(s1));
    HA h2(.a(s1),.b(cin),.carry(c2),.sum(s));
    assign cout = c1 | c2;
endmodule