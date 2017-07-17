#!/bin/csh -f
vlib work
vdel -all
vlib work
vlog faculty.v faculty_tb.v
vlog $1.v +acc
vsim -do "run -all" work.tb -l $1.log
