;This G-Code has been generated specifically for the {machine_name}

;SETTINGS
;Nozzle diameter = {machine_nozzle_size}mm
;Filament name = {material_brand} {material_name}
;Filament type = {material_type} {material_diameter}
;Filament weight = {filament_weight}
;Extruder temp = M109 S{material_print_temperature}
;Bed temp = M190 S{material_bed_temperature}

;The following lines can be uncommented for printer specific fine tuning
;More information can be found at https://marlinfw.org/meta/gcode/
;
;M92 E420                                   ;Set Axis Steps-per-unit
;M301 P21.0 I1.78 D61.93                    ;Set Hotend PID
;M906 E160                                  ;Digipot Motor Current ((875mA-750)/5+135) = 160
;M206 Y0                                    ;Set Home Offsets (default:0)
;
M73 P0                                      ; clear GLCD progress bar
M75                                         ; start GLCD timer
M107                                        ; disable fans
M420 S0                                     ; disable leveling matrix
G90                                         ; absolute positioning
M82                                         ; set extruder to absolute mode
G92 E0                                      ; set extruder position to 0
M140 S{material_bed_temperature_layer_0}    ; start bed heating up
G28 XY                                      ; home X and Y
G1 X-19 Y258 F1000                          ; move to safe homing position
M109 R{material_soften_temperature}         ; soften filament before homing Z
G28 Z                                       ; home Z
G1 E-15 F100                                ; retract filament
M109 R{material_wipe_temperature}           ; wait for extruder to reach wiping temp
;M206 X0 Y0 Z0                               ; uncomment to adjust wipe position (+X ~ nozzle moves left)(+Y ~ nozzle moves forward)(+Z ~ nozzle moves down)
G12                                         ; wiping sequence
M206 X0 Y0 Z0                               ; reseting stock nozzle position ### CAUTION: changing this line can affect print quality ###
G1 Z10 F5000                                ; raise nozzle after wipe
M109 R{material_probe_temperature}          ; wait for extruder to reach probe temp
G1 X-10 Y293 F4000                          ; move above first probe point
M204 S100                                   ; set probing acceleration
G29                                         ; start auto-leveling sequence
M420 S1                                     ; enable leveling matrix
M204 S500                                   ; restore standard acceleration
G1 X0 Y0 Z15 F5000                          ; move up off last probe point
G4 S1                                       ; pause
M400                                        ; wait for moves to finish
M117 Heating...                             ; progress indicator message on LCD
M109 R{material_print_temperature_layer_0}  ; wait for extruder to reach printing temp
M190 R{material_bed_temperature_layer_0}    ; wait for bed to reach printing temp
G1 Z2 E0 F75                                ; prime tiny bit of filament into the nozzle
M117 TAZ 6 Printing...                      ; progress indicator message on LCD
;Start G-Code End
