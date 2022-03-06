class monitor;
  transaction trans_2;
  virtual dut_if vif;
  mailbox mts;
  function new(mailbox mts, virtual dut_if vif);
        this.mts = mts;
        this.vif = vif;
  endfunction
  
task watch;
    $display($time, "   enter monitor task");
    trans_2 = new();
    
      @(posedge vif.monitor.hclk_f)
        trans_2.hrdata_t    = vif.mon_cb.hrdata_f; 
        trans_2.hready_t    = vif.mon_cb.hready_f;
        trans_2.hresp_t   = vif.mon_cb.hresp_f; 
  		mts.put(trans_2);
endtask
endclass
