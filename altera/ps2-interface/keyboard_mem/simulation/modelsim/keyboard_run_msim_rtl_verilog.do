transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem {C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/Reset_Delay.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/vga {C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/vga/VGA_Pattern.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem {C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/VGA_Audio_PLL.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem {C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/SEG7_LUT_4.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem {C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/SEG7_LUT.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem {C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/ps2_keyboard.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem {C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/keyboard.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem {C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/ram.v}
vlog -vlog01compat -work work +incdir+C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/vga {C:/Users/Jashwanth/Desktop/4th_sem/altera/ps2-interface/keyboard_mem/vga/VGA_Controller.v}

