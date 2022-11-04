module sinegen #(
    parameter   A_WIDTH = 8,
                D_WIDTH = 8
)(
    // interface signals
    input logic                 clk,    // clock
    input logic                 rst,    // reset
    input logic                 en,     // enable
    input logic [D_WIDTH-1:0]   offset, // offset for 2nd counter
    output logic [D_WIDTH-1:0]  dout1,  // output data
    output logic [D_WIDTH-1:0]  dout2   // output data 2
);

    logic [A_WIDTH-1:0]         addr1;  // interconnect wire

counter addr1Counter (
    .clk (clk),
    .rst (rst),
    .en (en),
    .incr (1'b1),
    .count (addr1)
);

rom sineRom (
    .clk (clk),
    .addr1 (addr1),
    .addr2 (addr1 + offset),
    .dout1 (dout1),
    .dout2 (dout2)
);

endmodule
