;This G-Code has been generated specifically for the {machine_name}
M73 P0                               ; clear LCD progress bar
M75 					             ; Start LCD Print Timer
M107 					             ; disable fans
M420 S0                              ; disable leveling matrix
G90 					             ; absolute positioning
M82 					             ; set extruder to absolute mode
G92 E0 					             ; set extruder position to 0
G28 					             ; home all axes
G0 X145 Y187 Z156 F3000 			 ; move away from endstops
M117 Heating Up...			         ; progress indicator message on LCD
M109 R{material_soften_temperature}  ; soften filament before retraction
M117 Retracting Filament...		     ; progress indicator message on LCD
G1 E-15 F75 				         ; retract filament
M117 Moving to Position...	         ; progress indicator message on LCD
M109 R{material_wipe_temperature}    ; wait for extruder to reach wiping temp
;M206 X0 Y0 Z0                       ; uncomment to adjust wipe position (+X ~ nozzle moves left)(+Y ~ nozzle moves forward)(+Z ~ nozzle moves down)
G12                                  ; wiping sequence
M206 X0 Y0 Z0                        ; reseting stock nozzle position ### CAUTION: changing this line can affect print quality ###
