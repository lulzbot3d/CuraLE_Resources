;This G-Code has been generated specifically for the LulzBot TAZ Workhorse
M75                                 ; start GLCD timer
M107                                ; disable fans
M420 S0                             ; disable previous leveling matrix
G90                                 ; absolute positioning
M82                                 ; set extruder to absolute mode
G92 E0                              ; set extruder position to 0
M109 R{material_soften_temperature} ; soften filament before homing Z
G28                                 ; Home all axis
G1 E-15 F100                        ; retract filament
M109 R{material_wipe_temperature}   ; wait for extruder to reach wiping temp
;M206 X0 Y0 Z0                       ; uncomment to adjust wipe position (+X ~ nozzle moves left)(+Y ~ nozzle moves forward)(+Z ~ nozzle moves down)
G12                                 ; wiping sequence
M206 X0 Y0 Z0                       ; reseting stock nozzle position ### CAUTION: changing this line can affect print quality ###
