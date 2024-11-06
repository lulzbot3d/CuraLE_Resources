;This G-Code has been generated specifically for the LulzBot TAZ 6
G21                                 ; set units to Millimetres
M107                                ; disable fans
G90                                 ; absolute positioning
M82                                 ; set extruder to absolute mode
G92 E0                              ; set extruder position to 0
M109 S{material_soften_temperature} ; start heating hot end
G28 XY                              ; home X and Y
G1 X-19 Y258 F1000                  ; move to safe homing position
G28 Z                               ; home Z
M109 R{material_soften_temperature} ; soften filament before homing Z
G1 E-15 F100                        ; retract filament
M109 R{material_wipe_temperature}   ; wait for extruder to reach wiping temp
;M206 X0 Y0 Z0                       ; uncomment to adjust wipe position (+X ~ nozzle moves left)(+Y ~ nozzle moves forward)(+Z ~ nozzle moves down)
G12                                 ; wiping sequence
M206 X0 Y0 Z0                       ; reseting stock nozzle position ### CAUTION: changing this line can affect print quality ###
