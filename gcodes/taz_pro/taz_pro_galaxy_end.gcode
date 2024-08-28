M400                                              ; wait for moves to finish
M140 S{material_part_removal_temperature}         ; start bed cooling
M104 S0                                           ; disable hotend
M107                                              ; disable fans
G92 E5                                            ; set extruder to 5mm for retract on print end
M117 Cooling Thrusters. Stand by for Print Bed Presentation.; progress indicator message on LCD
G28 Z                                             ; homing Z axis
G1 X5 Y5 E0 F3000                                 ; move to cooling position
M190 R{material_part_removal_temperature}         ; wait for bed to cool down to removal temp
G1 X145 F1000                                     ; move extruder out of the way
G1 Y260 F1000                                     ; present finished print
M140 S{material_keep_part_removal_temperature_t}  ; keep temperature or cool down
M77                                               ; End LCD Print Timer
G90                                               ; absolute positioning
M18 X E                                           ; turn off x and e axis
M117 Print Complete ;                             ; print complete message
