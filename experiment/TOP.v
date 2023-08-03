module TOP (clock,IN1,IN2,OUT);
  input clock,IN1,IN2;
  output OUT;
  wire w1,w2,w3,w4,w5,w6,w7,w8,w9,w10,w11;

  INV_X4 i1(.A(clock),.ZN(w1));
  INV_X2 i2(.A(IN2),.ZN(w2));
  INV_X4 i3(.A(w1),.ZN(w3));
  INV_X4 i4(.A(w1),.ZN(w4));
  INV_X1 i5(.A(w1),.ZN(w5));
  INV_X2 i6(.A(w5),.ZN(w6));
  INV_X4 i7(.A(w6),.ZN(w7));
  DFF_X1 i8(.D(IN1), .CK(w3), .Q(w8));
  DFF_X1 i9(.D(w2), .CK(w4), .Q(w9));
  INV_X4 i10(.A(w9),.ZN(w10));
  NAND2_X1 i11(.A1(w8), .A2(w10), .ZN(w11));
  DFF_X1 i12(.D(w11), .CK(w7), .Q(OUT));
endmodule // top

