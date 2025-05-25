`timescale 1ns / 1ps

module top;

    // --- ??????? ---
    wire [7:0] R, S;
    wire       CI;
    wire [1:0] ALB_MI;
    wire [7:0] F_hw;      // ????????? ? ALB
    wire       CO, ZO, NO, VO;
    wire [7:0] F_ref;     // ?????????? ?????????

    reg clk = 0;
    reg resetb = 0;

    // --- ????????? ????????? ---
    always #5 clk = ~clk;

    // --- ????????? reset ---
    initial begin
        resetb = 0;
        #15 resetb = 1;
    end

    // --- ALB: Device Under Test ---
    ALB dut (
        .R(R),
        .S(S),
        .CI(CI),
        .ALB_MI(ALB_MI),
        .F(F_hw),
        .CO(CO),
        .ZO(ZO),
        .NO(NO),
        .VO(VO)
    );

    // --- Stimulus: ????????? ??????? ???????? ---
    stimulus stim (
        .R(R),
        .S(S),
        .CI(CI),
        .ALB_MI(ALB_MI),
        .clk(clk),
        .resetb(resetb)
    );

    // --- Reference model (inline ???????) ---
    function [7:0] reference_model;
        input [7:0] R, S;
        input       CI;
        input [1:0] ALB_MI;
        begin
            case (ALB_MI)
                2'b00: reference_model = R | S;
                2'b01: reference_model = R + S + CI;
                2'b10: reference_model = S + (~R) + CI;
                2'b11: reference_model = R ^ S;
                default: reference_model = 8'b00000000;
            endcase
        end
    endfunction

    assign F_ref = reference_model(R, S, CI, ALB_MI);

    // --- Checker: ?????????? ?????????? ALB ? ???????? ---
    checker_ALB checker (
        .F_hw(F_hw),
        .F_ref(F_ref),
        .clk(clk)
    );

    // --- ???? ??? GTKWave ??? ?????? ????????? ---
    initial begin
        $dumpfile("wave.vcd");
        $dumpvars(0, top);
    end

endmodule

