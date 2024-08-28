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
;
M73 P0                                      ; clear GLCD progress bar
M75                                         ; start GLCD timer
M117 Starting {print_job_name}...           ; progress indicator message on LCD
M107                                        ; disable fans
M420 S0                                     ; disable previous leveling matrix
G90                                         ; absolute positioning
M82                                         ; set extruder to absolute mode
G92 E0                                      ; set extruder position to 0
M140 S{material_bed_temperature_layer_0}    ; start bed heating up
M109 R{material_soften_temperature}         ; soften filament before homing Z
G28                                         ; Home all axis
G1 E-15 F100                                ; retract filament
M109 R{material_wipe_temperature}           ; wait for extruder to reach wiping temp
M104 S{material_probe_temperature}          ; set extruder to probe temp
M106 S255                                   ; turn fan on to help drop temp
; Use M206 below to adjust nozzle wipe position (Replace "{machine_nozz1e_z_offset}" to adjust Z value)
; X ~ (+)left/(-)right, Y ~ (+)front/(-)back, Z ~ (+)down/(-)up
M206 X0 Y0 Z{machine_nozzle_z_offset}
M117 Wiping...                              ; progress indicator message on LCD
G12                                         ; wiping sequence
M206 X0 Y0 Z0                               ; reseting stock nozzle position ### CAUTION: changing this line can affect print quality ###
M107                                        ; turn off part cooling fan
M109 R{material_probe_temperature}          ; wait for extruder to reach probe temp
M117 Probing...                             ; progress indicator message on LCD
G29                                         ; start auto-leveling sequence
M420 S1                                     ; activate bed level matrix
G1 X0 Y0 Z15 F5000                          ; move up off last probe point
G4 S1                                       ; pause
M400                                        ; wait for moves to finish
M117 Heating...                             ; progress indicator message on LCD
M190 R{material_bed_temperature_layer_0}    ; wait for bed to reach printing temp
M109 R{material_print_temperature_layer_0}  ; wait for extruder to reach printing temp
G1 Z2 E0 F75                                ; prime tiny bit of filament into the nozzle
M117 Printing {print_job_name}...           ; progress indicator message on LCD

