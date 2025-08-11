class driver;
  
  mailbox gen2drv;
  virtual dpram_if vinf;
  transaction tx;
  
  function new(mailbox gen2drv, virtual dpram_if vinf);
    this.gen2drv = gen2drv;
    this.vinf = vinf;
  endfunction
  
  task run();
    
  forever begin
    gen2drv.get(tx);
    wait(!vinf.rst);
    @(posedge vinf.clk);
    
    
    vinf.addr_a = tx.addr_a;
    vinf.addr_b = tx.addr_b;
    vinf.datain_a = tx.datain_a;
    vinf.datain_b = tx.datain_b;
    vinf.we_a = tx.we_a;
    vinf.we_b = tx.we_b;
    //tx.print("driver");
  end
    
  endtask

endclass