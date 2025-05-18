module test_sum;
wire [5:0] Ain, Bin;
wire [5:0] res_my, res_ref;
reg [5:0] Ain_r, Bin_r;
reg Ci_r;
wire Ci, cm, cr;

my_sum my_block (Ain, Bin, Ci, res_my, cm);
ref_sum ref_block (Ain, Bin, Ci, res_ref, cr);

initial begin
    $display("\t\tTime Ain Bin Ci res_my cm res_ref cr");
    $monitor($time, "\t", Ain, "\t", Bin, "\t", Ci, "\t", res_my, "\t", cm, "\t", res_ref, "\t", cr);
   // #400 $finish;
end

initial begin
    Ain_r = 6'd1;
    #50 Ain_r = 6'd5;
    #50 Ain_r = 6'd15;
    #50 Ain_r = 6'd20;
    #50 Ain_r = 6'd31;
    #50 Ain_r = 6'd45;
    #50 Ain_r = 6'd55;
    #50 Ain_r = 6'd63;
end

initial begin
    Bin_r = 6'd2;
    #100 Bin_r = 6'd10;
    #100 Bin_r = 6'd32;
    #100 Bin_r = 6'd1;
end

initial begin
    Ci_r = 1'b0;
    #200 Ci_r = 1'b1;
end

assign Ain = Ain_r;
assign Bin = Bin_r;
assign Ci = Ci_r;

endmodule