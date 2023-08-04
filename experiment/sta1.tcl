
global use_custom_delay_model
set use_custom_delay_model 1
read_liberty example_typ.lib
read_verilog TOP.v
link_design TOP
read_sdc q3.sdc

report_checks -path_delay min_max 
#report_checks -through [get_ports IN1] -path_delay min_max
#q9-> report_checks -to [get_ports OUT] -path_delay min_max > q10_reports_1.txt
#q12-> report_checks -from i9 -to i12 -path_delay min_max > q12_reports_1.txt

