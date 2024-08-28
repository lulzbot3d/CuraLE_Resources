M400                                              ; wait for moves to finish
M140 S{material_part_removal_temperature}         ; start cooling bed
M107                                              ; fans off
G91                                               ; relative positioning
G1 E-1 F300                                       ; retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z25 E-1 X20 Y20 F2000                          ; move Z up a bit and retract filament even more
M104 S{material_print_temperature_0} T0           ; T0 to print temp
M104 S{material_print_temperature_1} T1           ; T1 to print temp
G90                                               ; absolute positioning
G0 X285 Y-30 F3000                                ; move to cooling position
G91                                               ; relative positioning
M117 Purging for next print;                        progress indicator message
T0
M109 S{material_print_temperature_0}              ; wait for temp
G92 E0                                            ; set extruder position to purge amount
G1 E15 F75                                        ; purge
M400                                              ; wait for purge
M104 S0                                           ; T0 hotend off
T1
M109 S{material_print_temperature_1}              ; wait for temp
G92 E0                                            ; set extruder position to purge amount
G1 E15 F75                                        ; purge
M400                                              ; wait for purge
M104 S0                                           ; T1 hotend off
T0
M117 Cooling, please wait;                          progress indicator message
M190 R{material_part_removal_temperature}         ; wait for bed to cool off
G0 Y280 F3000                                     ; present finished print
M140 S{material_keep_part_removal_temperature_t}  ; keep temperature or cool downs
M77			                                      ; stop GLCD timer
M18 X E				                              ; turn off x y and e axis
G90                                               ; absolute positioning
M117 Print complete;                                progress indicator message

