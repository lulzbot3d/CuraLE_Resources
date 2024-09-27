M400
M104 S0                                      ; hotend off
M140 S{material_part_removal_temperature}                                      ; heated bed heater off (if you have it)
M107                                         ; fans off
G92 E5                                       ; set extruder to 5mm for retract on print end
G1 X5 Y5 Z158 E0 F10000                      ; move to cooling positioning
G1 X145 F1000                                ; move to cooling positioning
G1 Y175 F1000                                ; move to cooling positioning
M117 Cooling Please Wait              ; wait for bed to move forward
M140 S{material_keep_part_removal_temperature_t}; Wait for bed to reach cooling temperature
M77 					     ; Stop GLCD Timer
M84                                          ; steppers off
G90                                          ; absolute positioning
M117 Print Complete.                      ; print complete message
