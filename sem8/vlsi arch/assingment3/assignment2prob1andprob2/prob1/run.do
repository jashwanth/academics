vlib work
vdel -all
vlib work

vlog sort.v +acc
vlog sort_tb.v +acc
vsim work.tb
run -all
