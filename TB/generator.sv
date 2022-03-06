class generator;
  transaction trans;
  int a_array[*]; 
  logic [31:0] temp_addr; 
  int i =0;
    
  mailbox gtd;
  function new(mailbox gtd);
    this.gtd = gtd;
  endfunction

  task write_gen();
        $display($time," %d ,, task write generator", i);
        trans = new();  
    		if( !trans.randomize() ) 
            $fatal("Gen:: trans randomization failed");
    		a_array[i] = trans.haddr_t;
            trans.hwrite_t = 1;
            trans.hsize_t = 3'b010;            
            trans.hburst_t = 3'b000;
            trans.htrans_t = 2'b10;
            trans.hprot_t = 4'b0001;
            gtd.put(trans);                
            i++;
            if (i == 10) i=0;
    endtask
  
   task read_gen ();
            $display($time, "   task read in generator");
            trans = new();         
     		trans.haddr_t = a_array[i];
            trans.hwrite_t = 0;
            trans.hsize_t = 3'b010;
            trans.hburst_t = 3'b000;
            trans.htrans_t = 2'b10;
            trans.hprot_t = 4'b0001;
            gtd.put(trans);              
            i++;
            if (i == 10) i=0;
    endtask
   
  //Incr
  task write_burst_gen_incr();
			$display($time, "   write burst in generator");
            trans = new();
            if( !trans.randomize() ) 
            $fatal("Gen:: trans randomization failed");
            a_array[0] = trans.haddr_t;
            trans.hwrite_t = 1;
            trans.hsize_t = 3'b010;
            trans.hburst_t = 3'b001;
            trans.htrans_t = 2'b10;
		    trans.hwdata_t = $urandom();
            trans.hprot_t = 4'b0001;
            gtd.put(trans);
	endtask
  
	task write_loop_gen_incr();
	$display($time, "   write burst in generator loop");
		trans = new();
        a_array[i+1] = a_array[i] + 'h4; 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 1;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b001;
		trans.hwdata_t = $urandom();
        trans.hprot_t = 4'b0001;
        gtd.put(trans);
	    i++;
      if (i == 9) i=0;
	endtask
  
	task read_burst_gen_incr();
        $display($time, "   Read burst in generator");
        trans = new();
        trans.haddr_t = a_array[i];
        trans.hwrite_t = 0;
        trans.hsize_t  = 3'b010;
        trans.hburst_t = 3'b001;
        trans.htrans_t = 2'b10;
		trans.hprot_t = 4'b0001;
		temp_addr = trans.haddr_t;     
        gtd.put(trans);
	endtask
  
	task read_loop_gen_incr();
        $display($time, "     Read burst in generator loop");
        trans = new(); 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 0;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b001;
		trans.hprot_t = 4'b0001;
        gtd.put(trans);
        i++;
      if (i == 9) i=0;
	endtask
  
   //Incr4
  task write_burst_gen_incr4();
			$display($time, "   write burst in generator");
            trans = new();
            if( !trans.randomize() ) 
            $fatal("Gen:: trans randomization failed");
            a_array[0] = trans.haddr_t;
            trans.hwrite_t = 1;
            trans.hsize_t = 3'b010;
            trans.hburst_t = 3'b011;
            trans.htrans_t = 2'b10;
		    trans.hwdata_t = $urandom();
            trans.hprot_t = 4'b0001;
            gtd.put(trans);
	endtask
  
	task write_loop_gen_incr4();
	$display($time, "   write burst in generator loop");
		trans = new();
        a_array[i+1] = a_array[i] + 'h4; 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 1;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b011;
		trans.hwdata_t = $urandom();
        trans.hprot_t = 4'b0001;
        gtd.put(trans);
	    i++;
      if (i == 3) i=0;
	endtask
  
	task read_burst_gen_incr4();
        $display($time, "   Read burst in generator");
        trans = new();
        trans.haddr_t = a_array[i];
        trans.hwrite_t = 0;
        trans.hsize_t  = 3'b010;
        trans.hburst_t = 3'b011;
        trans.htrans_t = 2'b10;
		trans.hprot_t = 4'b0001;
		temp_addr = trans.haddr_t;     
        gtd.put(trans);
	endtask
  
	task read_loop_gen_incr4();
        $display($time, "     Read burst in generator loop");
        trans = new(); 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 0;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b011;
		trans.hprot_t = 4'b0001;
        gtd.put(trans);
        i++;
        if (i == 3) i=0;
	endtask
  
  
  //Incr8
  task write_burst_gen_incr8();
			$display($time, "   write burst in generator");
            trans = new();
            if( !trans.randomize() ) 
            $fatal("Gen:: trans randomization failed");
            a_array[0] = trans.haddr_t;
            trans.hwrite_t = 1;
            trans.hsize_t = 3'b010;
            trans.hburst_t = 3'b101;
            trans.htrans_t = 2'b10;
		    trans.hwdata_t = $urandom();
            trans.hprot_t = 4'b0001;
            gtd.put(trans);
	endtask
  
	task write_loop_gen_incr8();
	$display($time, "   write burst in generator loop");
		trans = new();
        a_array[i+1] = a_array[i] + 'h4; 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 1;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b101;
		trans.hwdata_t = $urandom();
        trans.hprot_t = 4'b0001;
        gtd.put(trans);
	    i++;
        if (i == 7) i=0;
	endtask
  
	task read_burst_gen_incr8();
        $display($time, "   Read burst in generator");
        trans = new();
        trans.haddr_t = a_array[i];
        trans.hwrite_t = 0;
        trans.hsize_t  = 3'b010;
        trans.hburst_t = 3'b101;
        trans.htrans_t = 2'b10;
		trans.hprot_t = 4'b0001;
		temp_addr = trans.haddr_t;     
        gtd.put(trans);
	endtask
  
	task read_loop_gen_incr8();
        $display($time, "     Read burst in generator loop");
        trans = new(); 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 0;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b101;
		trans.hprot_t = 4'b0001;
        gtd.put(trans);
        i++;
        if (i == 7) i=0;
	endtask
  
  
  //Incr16
  task write_burst_gen_incr16();
			$display($time, "   write burst in generator");
            trans = new();
            if( !trans.randomize() ) 
            $fatal("Gen:: trans randomization failed");
            a_array[0] = trans.haddr_t;
            trans.hwrite_t = 1;
            trans.hsize_t = 3'b010;
            trans.hburst_t = 3'b111;
            trans.htrans_t = 2'b10;
		    trans.hwdata_t = $urandom();
            trans.hprot_t = 4'b0001;
            gtd.put(trans);
	endtask
  
	task write_loop_gen_incr16();
	$display($time, "   write burst in generator loop");
		trans = new();
        a_array[i+1] = a_array[i] + 'h4; 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 1;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b111;
		trans.hwdata_t = $urandom();
        trans.hprot_t = 4'b0001;
        gtd.put(trans);
	    i++;
      if (i == 15) i=0;
	endtask
  
	task read_burst_gen_incr16();
        $display($time, "   Read burst in generator");
        trans = new();
        trans.haddr_t = a_array[i];
        trans.hwrite_t = 0;
        trans.hsize_t  = 3'b010;
        trans.hburst_t = 3'b111;
        trans.htrans_t = 2'b10;
		trans.hprot_t = 4'b0001;
		temp_addr = trans.haddr_t;     
        gtd.put(trans);
	endtask
  
	task read_loop_gen_incr16();
        $display($time, "     Read burst in generator loop");
        trans = new(); 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 0;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b111;
		trans.hprot_t = 4'b0001;
        gtd.put(trans);
        i++;
      if (i == 15) i=0;
	endtask
  
  //Wrap4
  task write_burst_gen_wrap4();
	        $display($time, "   write burst in generator");
            trans = new();
            if( !trans.randomize() ) 
            $fatal("Gen:: trans randomization failed");
            a_array[0] = trans.haddr_t;
            trans.hwrite_t = 1;
            trans.hsize_t = 3'b010;
            trans.hburst_t = 3'b010;
            trans.htrans_t = 2'b10;
		    trans.hwdata_t = $urandom();
            trans.hprot_t = 4'b0001;
            gtd.put(trans);
	endtask
  
	task write_loop_gen_wrap4();
	$display($time, "   write burst in generator loop");
		trans = new();
        a_array[i+1] = a_array[i] + 'h4; 
        if ((a_array[i+1]%16==0) && (a_array[i+1] !=  a_array[0]))
        begin
          a_array[i+1] = a_array[i+1] - 16;
        end
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 1;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b010;
		trans.hwdata_t = $urandom();
        trans.hprot_t = 4'b0001;
        gtd.put(trans);
	    i++;
        if (i == 3) i=0;
	endtask
  
	task read_burst_gen_wrap4();
	    $display($time, "   Read burst in generator");
        trans = new();
        trans.haddr_t = a_array[i];
        trans.hwrite_t = 0;
        trans.hsize_t  = 3'b010;
        trans.hburst_t = 3'b010;
        trans.htrans_t = 2'b10;
		trans.hprot_t = 4'b0001;
		temp_addr = trans.haddr_t; 
        gtd.put(trans);
	endtask
  
	task read_loop_gen_wrap4();
	    $display($time, "     Read burst in generator loop");
        trans = new(); 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 0;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b010;
		trans.hprot_t = 4'b0001;
        gtd.put(trans);
        i++;
        if (i == 3) i=0;
	endtask
  
  //Wrap8
  task write_burst_gen_wrap8();
	        $display($time, "   write burst in generator");
            trans = new();
            if( !trans.randomize() ) 
            $fatal("Gen:: trans randomization failed");
            a_array[0] = trans.haddr_t;
            trans.hwrite_t = 1;
            trans.hsize_t = 3'b010;
            trans.hburst_t = 3'b100;
            trans.htrans_t = 2'b10;
		    trans.hwdata_t = $urandom();
            trans.hprot_t = 4'b0001;
            gtd.put(trans);
	endtask
  
	task write_loop_gen_wrap8();
	$display($time, "   write burst in generator loop");
		trans = new();
        a_array[i+1] = a_array[i] + 'h4; 
        if ((a_array[i+1]%16==0) && (a_array[i+1] !=  a_array[0]))
        begin
          a_array[i+1] = a_array[i+1] - 16;
        end
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 1;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b100;
		trans.hwdata_t = $urandom();
        trans.hprot_t = 4'b0001;
        gtd.put(trans);
	    i++;
      if (i == 7) i=0;
	endtask
  
	task read_burst_gen_wrap8();
	    $display($time, "   Read burst in generator");
        trans = new();
        trans.haddr_t = a_array[i];
        trans.hwrite_t = 0;
        trans.hsize_t  = 3'b010;
        trans.hburst_t = 3'b100;
        trans.htrans_t = 2'b10;
		trans.hprot_t = 4'b0001;
		temp_addr = trans.haddr_t; 
        gtd.put(trans);
	endtask
  
	task read_loop_gen_wrap8();
	    $display($time, "     Read burst in generator loop");
        trans = new(); 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 0;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b100;
		trans.hprot_t = 4'b0001;
        gtd.put(trans);
        i++;
      if (i == 7) i=0;
	endtask
  
  //Wrap16
  task write_burst_gen_wrap16();
	        $display($time, "   write burst in generator");
            trans = new();
            if( !trans.randomize() ) 
            $fatal("Gen:: trans randomization failed");
            a_array[0] = trans.haddr_t;
            trans.hwrite_t = 1;
            trans.hsize_t = 3'b010;
            trans.hburst_t = 3'b110;
            trans.htrans_t = 2'b10;
		    trans.hwdata_t = $urandom();
            trans.hprot_t = 4'b0001;
            gtd.put(trans);
	endtask
  
	task write_loop_gen_wrap16();
	$display($time, "   write burst in generator loop");
		trans = new();
        a_array[i+1] = a_array[i] + 'h4; 
        if ((a_array[i+1]%16==0) && (a_array[i+1] !=  a_array[0]))
        begin
          a_array[i+1] = a_array[i+1] - 16;
        end
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 1;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b110;
		trans.hwdata_t = $urandom();
        trans.hprot_t = 4'b0001;
        gtd.put(trans);
	    i++;
      if (i == 15) i=0;
	endtask
  
	task read_burst_gen_wrap16();
	    $display($time, "   Read burst in generator");
        trans = new();
        trans.haddr_t = a_array[i];
        trans.hwrite_t = 0;
        trans.hsize_t  = 3'b010;
        trans.hburst_t = 3'b110;
        trans.htrans_t = 2'b10;
		trans.hprot_t = 4'b0001;
		temp_addr = trans.haddr_t; 
        gtd.put(trans);
	endtask
  
	task read_loop_gen_wrap16();
	    $display($time, "     Read burst in generator loop");
        trans = new(); 
        trans.haddr_t = a_array[i+1];
		trans.hwrite_t = 0;
		trans.htrans_t = 2'b11;
		trans.hsize_t = 3'b010;
        trans.hburst_t = 3'b110;
		trans.hprot_t = 4'b0001;
        gtd.put(trans);
        i++;
      if (i == 15) i=0;
	endtask
  
endclass
