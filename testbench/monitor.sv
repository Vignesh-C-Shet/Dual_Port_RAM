class monitor;
  mailbox mon2scr;
  virtual dpram_if vinf;
  transaction mx;
  function new(mailbox mon2scr, virtual dpram_if vinf);
    this.mon2scr = mon2scr;
    this.vinf = vinf;
  endfunction
  
  task run();
    forever begin
      @(posedge vinf.clk);
      wait(!vinf.rst);
      
      
      mx = new();
   
      mx.we_a = vinf.we_a;
      mx.we_b = vinf.we_b;
      mx.addr_a = vinf.addr_a;
      mx.addr_b = vinf.addr_b;
      mx.datain_a = vinf.datain_a;
      mx.datain_b = vinf.datain_b;
      @(negedge vinf.clk);
      
      mx.dataout_a = vinf.dataout_a;
      mx.dataout_b = vinf.dataout_b;
      mon2scr.put(mx);
      mx.print("monitor");
    end
  endtask
endclass