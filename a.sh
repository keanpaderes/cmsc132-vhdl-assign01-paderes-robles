ghdl -a t1l_paderes_robles.vhdl
ghdl -e t1l_paderes_robles

ghdl -a t1l_paderes_robles_tb.vhdl
ghdl -e t1l_paderes_robles_tb
ghdl -r t1l_paderes_robles_tb --vcd=t1l_paderes_robles_tb.vcd