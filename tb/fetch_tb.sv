`timescale  1ns / 1ps

module fetch_tb ();
    localparam INSTRUCTION_SIZE         = 32;
    localparam INSTRUCTION_CACHE_DEPTH  = 32;

    logic clock_r;
    logic reset_nr;

    logic [INSTRUCTION_SIZE - 1:0] instruction_w;

    initial
        begin
            $dumpfile("fetch_tb.vcd");
            $dumpvars();
        end

    initial
        begin
            #0  clock_r = '1;
                reset_nr = '1;

            #5  reset_nr = '0;
            #5  reset_nr = '1;
            #10 ;

            #320;
            #20 $stop;
        end

    always
        #10 clock_r = ~clock_r;

    fetch
    #(
        .INSTRUCTION_CACHE_DEPTH(INSTRUCTION_CACHE_DEPTH)
    ) dut
    (
        .clock_i        (clock_r),
        .reset_ni       (reset_nr),

        .instruction_o  (instruction_w)
    );

endmodule