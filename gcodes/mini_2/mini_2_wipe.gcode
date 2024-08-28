;This G-Code has been generated specifically for the LulzBot Mini 2
G21					; set units to Millimetres
M107					; disable fans
G90					; absolute positioning
M82					; set extruder to absolute mode
G92 E0					; set extruder position to 0
G28					; home all axes
G0 X0 Y187 Z156 F200			; move away from endstops
M109 R{material_wipe_temperature}	; wait for extruder to reach wiping temp
;M206 X0 Y0 Z0              ; uncomment to adjust wipe position (+X ~ nozzle moves left)(+Y ~ nozzle moves forward)(+Z ~ nozzle moves down)
G12                         ; wiping sequence
M206 X0 Y0 Z0               ; reseting stock nozzle position ### CAUTION: changing this line can affect print quality ###
G28 X0 Y0				; re-home to account for build variance of earlier mini builds
G0 X0 Y187 F200				; move away from endstops
G0 Y152 F4000				; move in front of wiper pad
G4 S1					; pause
M400					; wait for moves to finish
G1 E0 F75				; prime tiny bit of filament into the nozzle
M400					; wait for moves to finish
