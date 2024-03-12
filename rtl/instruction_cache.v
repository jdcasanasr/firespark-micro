`include "riscv.vh"

module instruction_cache
(
    input                       clock_i,
    input                       reset_ni,

    input                       read_address_i,

    output reg [`XLEN - 1:0]    read_port_o
);

endmodule