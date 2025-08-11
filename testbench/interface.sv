 interface dpram_if (input logic clk);
   logic rst;
   logic we_a;
   logic we_b;
   logic [2:0] addr_a;
   logic [2:0] addr_b;
   logic [7 : 0] datain_a;
   logic [7 : 0] datain_b;
   logic [7 : 0] dataout_a;
   logic [7 : 0] dataout_b;


 endinterface