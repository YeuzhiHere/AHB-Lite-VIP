class environment;

    mailbox gtd;  
    mailbox dts; 
    mailbox mts;  

    generator gen;         
    driver driv;           
    monitor moni;          
    scoreboard sb;         

    virtual dut_if vif;     

    function new(virtual dut_if vif);
        this.vif = vif;
    endfunction

   function void create();
        gtd = new();
        dts = new();
        mts = new();

        gen     = new (gtd);
        driv    = new (gtd , dts, vif);
        moni    = new (mts , vif);
        sb      = new(dts , mts);

    endfunction

    task write;
            gen.write_gen();
            driv.drive();
            moni.watch();
            sb.data_write();
    endtask

    task read;
        gen.read_gen();
        driv.drive();
        moni.watch();
        sb.data_read();
    endtask
    
	task burst_write_wrap4;
		gen.write_burst_gen_wrap4();
		driv.drive();
        moni.watch();
        sb.data_write();
	endtask

	task burst_write_loop_wrap4;		
        gen.write_loop_gen_wrap4();
		driv.drive();
        moni.watch();
        sb.data_write();   
	endtask

    task burst_read_wrap4;
		gen.read_burst_gen_wrap4();
		driv.drive();
        moni.watch();
        sb.data_read();  
	endtask
	
	task burst_read_loop_wrap4;
		gen.read_loop_gen_wrap4();
		driv.drive();
        moni.watch();
        sb.data_read(); 
    endtask
  
  
  	task burst_write_wrap8;
		gen.write_burst_gen_wrap8();
		driv.drive();
        moni.watch();
        sb.data_write();
	endtask

	task burst_write_loop_wrap8;		
        gen.write_loop_gen_wrap8();
		driv.drive();
        moni.watch();
        sb.data_write();   
	endtask

    task burst_read_wrap8;
		gen.read_burst_gen_wrap8();
		driv.drive();
        moni.watch();
        sb.data_read();  
	endtask
	
	task burst_read_loop_wrap8;
		gen.read_loop_gen_wrap8();
		driv.drive();
        moni.watch();
        sb.data_read(); 
    endtask
  
    	task burst_write_wrap16;
		gen.write_burst_gen_wrap16();
		driv.drive();
        moni.watch();
        sb.data_write();
	endtask

	task burst_write_loop_wrap16;		
        gen.write_loop_gen_wrap16();
		driv.drive();
        moni.watch();
        sb.data_write();   
	endtask

    task burst_read_wrap16;
		gen.read_burst_gen_wrap16();
		driv.drive();
        moni.watch();
        sb.data_read();  
	endtask
	
	task burst_read_loop_wrap16;
		gen.read_loop_gen_wrap16();
		driv.drive();
        moni.watch();
        sb.data_read(); 
    endtask
  
  task burst_write_incr;
		gen.write_burst_gen_incr();
		driv.drive();
        moni.watch();
        sb.data_write();
	endtask

	task burst_write_loop_incr;		
        gen.write_loop_gen_incr();
		driv.drive();
        moni.watch();
        sb.data_write();   
	endtask

    task burst_read_incr;
		gen.read_burst_gen_incr();
		driv.drive();
        moni.watch();
        sb.data_read();  
	endtask
	
	task burst_read_loop_incr;
		gen.read_loop_gen_incr();
		driv.drive();
        moni.watch();
        sb.data_read(); 
    endtask
  
  
  task burst_write_incr4;
		gen.write_burst_gen_incr4();
		driv.drive();
        moni.watch();
        sb.data_write();
	endtask

	task burst_write_loop_incr4;		
        gen.write_loop_gen_incr4();
		driv.drive();
        moni.watch();
        sb.data_write();   
	endtask

    task burst_read_incr4;
		gen.read_burst_gen_incr4();
		driv.drive();
        moni.watch();
        sb.data_read();  
	endtask
	
	task burst_read_loop_incr4;
		gen.read_loop_gen_incr4();
		driv.drive();
        moni.watch();
        sb.data_read(); 
    endtask
  
  	task burst_write_incr8;
		gen.write_burst_gen_incr8();
		driv.drive();
        moni.watch();
        sb.data_write();
	endtask

	task burst_write_loop_incr8;		
        gen.write_loop_gen_incr8();
		driv.drive();
        moni.watch();
        sb.data_write();   
	endtask

    task burst_read_incr8;
		gen.read_burst_gen_incr8();
		driv.drive();
        moni.watch();
        sb.data_read();  
	endtask
	
	task burst_read_loop_incr8;
		gen.read_loop_gen_incr8();
		driv.drive();
        moni.watch();
        sb.data_read(); 
    endtask
  
    	task burst_write_incr16;
		gen.write_burst_gen_incr16();
		driv.drive();
        moni.watch();
        sb.data_write();
	endtask

	task burst_write_loop_incr16;		
        gen.write_loop_gen_incr16();
		driv.drive();
        moni.watch();
        sb.data_write();   
	endtask

    task burst_read_incr16;
		gen.read_burst_gen_incr16();
		driv.drive();
        moni.watch();
        sb.data_read();  
	endtask
	
	task burst_read_loop_incr16;
		gen.read_loop_gen_incr16();
		driv.drive();
        moni.watch();
        sb.data_read(); 
    endtask
    

endclass