// 4to1 mux module
module mux1x4 (
    input i1,i2, i3, i4,s0,s1,
    output y
    );
    
    
    not(ns0 , s0);
    not(ns1 , s1);

    and(w0, i1, ns0, ns1);
    and(w1, i2, ns0, s1);
    and(w2, i3, s0, ns1);
    and(w3, i4, s0, s1);

    or(y,w0,w1,w2,w3);

endmodule


module micro (
    input [3:0] a,
    input [3:0] b,
    input s0,s1,
    output [3:0] f
);

    and(i00,a[0],b[0]);
    or(i01,a[0],b[0]);
    xor(i02,a[0],b[0]);
    not(i03,a[0]);
    mux1x4 m0(i00,i01,i02,i03,s0,s1,f[0]);

    and(i10,a[1],b[1]);
    or(i11,a[1],b[1]);
    xor(i12,a[1],b[1]);
    not(i13,a[1]);
    mux1x4 m1(i10,i11,i12,i13,s0,s1,f[1]);

    and(i20,a[2],b[2]);
    or(i21,a[2],b[2]);
    xor(i22,a[2],b[2]);
    not(i23,a[2]);
    mux1x4 m2(i20,i21,i22,i23,s0,s1,f[2]);

    and(i30,a[3],b[3]);
    or(i31,a[3],b[3]);
    xor(i32,a[3],b[3]);
    not(i33,a[3]);
    mux1x4 m3(i30,i31,i32,i33,s0,s1,f[3]);

endmodule


module tb_micro ();
    reg [3:0] a,b;
    reg s0,s1;
    wire [3:0] f;

    micro mic(a,b,s0,s1,f);

    initial begin
        a = 4'b0000;
        b = 4'b1111;
        s0 = 0;
        s1 = 0;
        #100;

        a = 4'b0000;
        b = 4'b1111;
        s0 = 1;
        s1 = 0;
        #100;
        
        a = 4'b0000;
        b = 4'b1111;
        s0 = 0;
        s1 = 1;
        #100;
        
        a = 4'b0000;
        b = 4'b1111;
        s0 = 1;
        s1 = 1;
        #100;

        a = 4'b1111;
        b = 4'b1111;
        s0 = 0;
        s1 = 0;
        #100;
        
        a = 4'b1111;
        b = 4'b1111;
        s0 = 1;
        s1 = 0;
        #100;
        
        a = 4'b1111;
        b = 4'b1111;
        s0 = 0;
        s1 = 1;
        #100;
        
        a = 4'b1111;
        b = 4'b1111;
        s0 = 1;
        s1 = 1;
        #100;
        
        
    end
    
endmodule


