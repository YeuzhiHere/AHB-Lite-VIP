program test(dut_if i);

environment env; 

initial 
begin
    env =new(i);   
    env.create();  

  #20;

  //Single
  repeat(10)   
    begin 
      env.write();   
    end 

  repeat(10)       
    begin 
      env.read();   
    end 
	
  
  //Undefined, INCR4, INCR8, INCR16 BURST
  /*
  repeat(2)
  begin
  repeat(1) 
  begin
  		env.burst_write(); // calling burst write 

    repeat(15)       
		begin
			env.burst_write_loop(); // looping into the increment write on the address
		end 	
    end
	
  repeat(1) 
	begin
		env.burst_read();   // calling read 2 
      repeat(15)
		begin
			env.burst_read_loop(); // burst read loop function of an environment is called
		end 
    end
  end
  */
  
   //WRAP4
  repeat(1)
  begin
  repeat(1) 
  begin
  		env.burst_write_wrap4();

    repeat(3)       
		begin
			env.burst_write_loop_wrap4(); 
		end 	
    end
	
  repeat(1) 
	begin
		env.burst_read_wrap4();   
      repeat(3)
		begin
			env.burst_read_loop_wrap4(); 
		end 
    end
  end
  
     //WRAP8
  repeat(1)
  begin
  repeat(1) 
  begin
  		env.burst_write_wrap8();

    repeat(7)       
		begin
			env.burst_write_loop_wrap8(); 
		end 	
    end
	
  repeat(1) 
	begin
		env.burst_read_wrap8();   
      repeat(7)
		begin
			env.burst_read_loop_wrap8(); 
		end 
    end
  end
  
   //WRAP16
  repeat(1)
  begin
  repeat(1) 
  begin
  		env.burst_write_wrap16();

    repeat(15)       
		begin
			env.burst_write_loop_wrap16(); 
		end 	
    end
	
  repeat(1) 
	begin
		env.burst_read_wrap16();   
      repeat(15)
		begin
			env.burst_read_loop_wrap16(); 
		end 
    end
  end
  
  //INCR
  repeat(1)
  begin
  repeat(1) 
  begin
  		env.burst_write_incr();

    repeat(9)       
		begin
			env.burst_write_loop_incr(); 
		end 	
    end
	
  repeat(1) 
	begin
		env.burst_read_incr();   
      repeat(9)
		begin
			env.burst_read_loop_incr(); 
		end 
    end
  end
  
  //INCR4
  repeat(1)
  begin
  repeat(1) 
  begin
  		env.burst_write_incr4();

    repeat(3)       
		begin
			env.burst_write_loop_incr4(); 
		end 	
    end
	
  repeat(1) 
	begin
		env.burst_read_incr4();   
      repeat(3)
		begin
			env.burst_read_loop_incr4(); 
		end 
    end
  end
  
     //INCR8
  repeat(1)
  begin
  repeat(1) 
  begin
  		env.burst_write_incr8();

    repeat(7)       
		begin
			env.burst_write_loop_incr8(); 
		end 	
    end
	
  repeat(1) 
	begin
		env.burst_read_incr8();   
      repeat(7)
		begin
			env.burst_read_loop_incr8(); 
		end 
    end
  end
  
   //INCR16
  repeat(1)
  begin
  repeat(1) 
  begin
  		env.burst_write_incr16();

    repeat(15)       
		begin
			env.burst_write_loop_incr16(); 
		end 	
    end
	
  repeat(1) 
	begin
		env.burst_read_incr16();   
      repeat(15)
		begin
			env.burst_read_loop_incr16(); 
		end 
    end
  end
  
	$display($time, "WE ARE DONE ..");  
end
   
endprogram

