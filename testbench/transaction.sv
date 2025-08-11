class transaction #(parameter ADDER_WIDTH = 3, parameter DATA_WIDTH = 8);
  bit rst;
  rand logic [ADDER_WIDTH-1:0] addr_a;
  rand logic [ADDER_WIDTH-1:0] addr_b;
  rand logic [DATA_WIDTH - 1 : 0] datain_a;
  rand logic [DATA_WIDTH - 1 : 0] datain_b;
  logic [DATA_WIDTH - 1 : 0] dataout_a;
  logic [DATA_WIDTH - 1 : 0] dataout_b;
  rand bit we_a;
  rand bit we_b;
  function void print(string tag = "");
    $display("tag = %s | time = %0t | rst = %b | we_a = %b | datain_a = %d |  addr_a = %d | dataout_a = %d |  we_b = %b |  datain_b = %d | addr_b = %d |  dataout_b = %d ",tag, $time, rst, we_a, datain_a ,addr_a ,dataout_a , we_b, datain_b,addr_b, dataout_b);
  endfunction
endclass