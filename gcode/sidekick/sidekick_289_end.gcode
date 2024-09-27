M400                                             ; wait for moves to finish
M140 S{material_part_removal_temperature}        ; start bed cooling
M104 S0                                          ; disable hotend
M107                                             ; disable fans
M117 Cooling please wait                         ; progress indicator message on LCD
G1 Y-10 Z185 F3000                               ; move to cooling position
M83                                              ; relative extrude
G0 E-14                                          ; retract 14mm
M82                                              ; absolute extrude
M190 R{material_part_removal_temperature}        ; wait for bed to cool down to removal temp
G27                                              ; present finished print
M140 S{material_keep_part_removal_temperature_t} ; keep temperature or cool down
M77                                              ; End LCD Print Timer
G90                                              ; absolute positioning
M18 X E                                          ; turn off x and e axis
M117 Print Complete. ;                           ; print complete message