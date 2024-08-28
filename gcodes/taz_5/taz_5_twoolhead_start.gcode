;This G-Code has been generated specifically for the {machine_name}
M73 P0 ; clear GLCD progress bar
M107 ; disable fans
G90 ; absolute positioning
M82 ; set extruder to absolute mode
G92 E0 ; set extruder position to 0
M140 S{material_bed_temperature_layer_0} ; start bed heating up
M117 Heating... ; progress indicator message on LCD
T0 ; switch to extruder 1
M104 S{material_print_temperature_layer_0} ; set but don't wait
T1 ; switch to extruder 2
M109 R{material_print_temperature_layer_0}  ; wait for extruder to reach printing temp
M190 R{material_bed_temperature_layer_0} ; wait for bed to reach printing temp
G28   ; home printer
G1 Z2 E0 F75 ; prime tiny bit of filament into the nozzle
M117 TAZ 5 Printing... ; progress indicator message on LCD
;Start G-Code End
