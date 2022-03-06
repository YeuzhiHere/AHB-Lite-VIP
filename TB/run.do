vsim testbench_top +access+r -dbg
run -all
acdb report 
exec cat acdb_report.txt
