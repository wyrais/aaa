module stimulus(
    output reg [7:0] R,
    output reg [7:0] S,
    output reg       CI,
    output reg [1:0] ALB_MI,
    input            clk,
    input            resetb
);

    initial begin
        // ????????? ????????
        R = 8'b0;
        S = 8'b0;
        CI = 0;
        ALB_MI = 2'b00;

        // ??????? ????????
        wait (resetb == 0);
        wait (resetb == 1);

        // ==== A1 = 01100011, B1 = 10100101 ====

        @ (posedge clk); R = 8'b01100011; S = 8'b10100101; CI = 0; ALB_MI = 2'b00; // R ? S
        @ (posedge clk);                            CI = 1; ALB_MI = 2'b01; // R + S + CI
        @ (posedge clk);                            CI = 1; ALB_MI = 2'b10; // S ? R ? 1 + CI
        @ (posedge clk);                            CI = 0; ALB_MI = 2'b11; // R ? S

        // ==== A2 = 10011100, B2 = 01011010 ====

        @ (posedge clk); R = 8'b10011100; S = 8'b01011010; CI = 1; ALB_MI = 2'b01; // A2 + B2
        @ (posedge clk);                            CI = 1; ALB_MI = 2'b10; // B2 ? A2 ? 1 + CI
        @ (posedge clk);                            CI = 0; ALB_MI = 2'b11; // A2 ? B2
        @ (posedge clk);                            CI = 0; ALB_MI = 2'b00; // A2 ? B2

        // ==== ???? ??????? ====

        @ (posedge clk); R = 8'b00001111; S = 8'b11110000; CI = 1; ALB_MI = 2'b01; // ADD
        @ (posedge clk); ALB_MI = 2'b10; // SUB

        // ?????????? ?????????
        repeat (2) @ (posedge clk);
        $finish;
    end

endmodule

