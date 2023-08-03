create_clock -name clock -period 10 -waveform {0 5} [get_ports "clock"]
set_input_delay -max 1.5 [get_ports "IN1"] -clock [get_clocks "clock"]
set_input_delay -max 1.0 [get_ports "IN2"] -clock [get_clocks "clock"]
set_input_transition -max 0.1 [get_ports "IN1"]
set_input_transition -max 0.25 [get_ports "IN2"]
set_output_delay -max 1.0 [get_ports "OUT"] -clock [get_clocks "clock"]
set_load 0.5 [get_ports "OUT"]

