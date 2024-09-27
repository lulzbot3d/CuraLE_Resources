M400
M140 S{material_keep_part_removal_temperature_t}  ; keep temperature or cool downs
M104 S0 T0                                        ; T0 hotend off
M104 S0 T1                                        ; T1 hotend off
M107                                              ; fans off
G91                                               ; relative positioning
T0
G1 E-1 F300                                       ; retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z20 E-5 X-20 Y-20 F3000                        ; move Z up a bit and retract filament even more
G1 E6                                             ; re-prime extruder 1
T1
G1 E-5 F300                                       ; retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 E5                                             ; re-prime extruder 2
T0
M117 Cooling please wait                          ; progress indicator message
G90                                               ; absolute positioning
G1 Y0 F3000                                       ; move to cooling position
M190 R{material_part_removal_temperature}         ; set bed to cool off
G1 Y280 F3000                                     ; present finished print
M77			                                      ; stop GLCD timer
M84                                               ; steppers off
G90                                               ; absolute positioning
M117 Print complete                               ; progress indicator message
