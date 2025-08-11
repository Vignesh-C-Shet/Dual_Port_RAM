class test;
  env en;
  function new(virtual dpram_if vif);
    en = new(vif);
  endfunction
  task run();
    en.run();
  endtask
endclass