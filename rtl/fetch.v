`include "riscv.vh"
`include "firespark_micro.vh"

module fetch
(
    input                       clock_i,
    input                       reset_ni,

    output reg [`XLEN - 1:0]    instruction_o
);

    reg [`XLEN - 1:0] pc_r;

    always @ (posedge clock_i, negedge reset_ni)
        if (!reset_ni)
            pc_r = 'd0;
        else
            pc_r = pc_r + 'd4;

endmodule