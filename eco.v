module decoder_3_to_8_with_en(
  input [2:0] sel,
  input en,              // ???????? 0
  output tri [7:0] res   // ????????????? ?????
);

  reg [7:0] decoded;

  always @ (sel)
  begin
    case (sel)
      3'b000: decoded = 8'b00000001;
      3'b001: decoded = 8'b00000010;
      3'b010: decoded = 8'b00000100;
      3'b011: decoded = 8'b00001000;
      3'b100: decoded = 8'b00010000;
      3'b101: decoded = 8'b00100000;
      3'b110: decoded = 8'b01000000;
      default: decoded = 8'b10000000;
    endcase
  end

  // ????????? ??????? ????? EN
  assign res = (en == 1'b0) ? decoded : 8'bzzzz_zzzz;

endmodule
