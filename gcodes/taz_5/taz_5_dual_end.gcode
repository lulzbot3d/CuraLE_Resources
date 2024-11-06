M104 T0 S0                     ;extruder heater off
M104 T1 S0                     ;extruder heater off
M140 S0                     ;heated bed heater off (if you have it)
G91                                    ;relative positioning
G1 E-1 F300                            ;retract the filament a bit before lifting the nozzle, to release some of the pressure
G1 Z0.5 E-5 X-20 Y-20 F{speed_travel}  ;move Z up a bit and retract filament even more
M77				       ;Stop GLCD Timer
G28 X0 Y0                              ;move X/Y to min endstops, so the head is out of the way
M84                         ;steppers off
G90
M117 Print Complete.                      ; print complete message
