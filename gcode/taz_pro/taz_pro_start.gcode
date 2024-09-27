;This G-Code has been generated specifically for the {machine_name}
;
;SETTINGS
;Nozzle diameter = {machine_nozzle_size}mm
;Filament name = {material_brand} {material_name}
;Filament type = {material_type} {material_diameter}
;Filament weight = {filament_weight}
;Extruder temp = M109 S{material_print_temperature}
;Bed temp = M190 S{material_bed_temperature}
;
;The following lines can be uncommented for printer specific fine tuning
;More information can be found at https://marlinfw.org/meta/gcode/
;
;M92 E420                                  ;Set Axis Steps-per-unit
;M906 E960                                 ;TMC Motor Current
;
G4 S1                                      ; delay for 1 seconds to display file name
M104 S{material_soften_temperature}        ; start soften filament before retraction
M140 S{material_bed_temperature_layer_0}   ; start bed heating up
M117 Homing Axes... Please Wait.;          ; progress indicator message on LCD
G28 O                                      ; home all axes
M73 P0                                     ; clear LCD progress bar
M75                                        ; Start LCD Print Timer
M107                                       ; disable fans
M420 S0                                    ; disable leveling matrix
M900 K{linear_advance}                     ; set linear advance
G90                                        ; absolute positioning
M82                                        ; set extruder to absolute mode
G92 E0                                     ; set extruder position to 0
G0 X145 Y187 Z156 F3000                    ; move away from endstops
M117 Heating Nozzle...;                    ; progress indicator message on LCD
M109 R{material_wipe_temperature}          ; wait for extruder to reach wiping temp
M104 S{material_probe_temperature}         ; start cooling to probe temp during wipe
M83                                        ; set extruder to relative mode
G1 E-3 F500                                ; retract 3mm to help with drool on fresh filament load
M106 S255                                  ; turn fan on to help drop temp
; Use M206 below to adjust nozzle wipe position (Replace "{machine_nozz1e_z_offset}" to adjust Z value)
; X ~ (+)left/(-)right, Y ~ (+)front/(-)back, Z ~ (+)down/(-)up
M206 X0 Y0 Z{machine_nozzle_z_offset}      ; restoring offsets and adjusting offset if AST285 is enabled
M117 Wiping Nozzle...;                     ; progress indicator message on LCD
G12                                        ; wiping sequence
M206 X0 Y0 Z0                              ; reseting stock nozzle position ### CAUTION: changing this line can affect print quality ###
M107                                       ; turn off part cooling fan
M104 S{material_probe_temperature}         ; set probe temp
M117 Leveling Print Bed...;                ; Progress indicator message on LCD
G29                                        ; start auto-leveling sequence
M104 S{material_print_temperature_layer_0} ; start extruder to reach initial printing temp
M420 S1                                    ; enable leveling matrix
G0 X0 Y0 Z10 F6000                         ; move to start location
G4 S1                                      ; pause
M400                                       ; wait for moves to finish
M117 Final Heating... Please Wait.;        ; progress indicator message on LCD
M190 S{material_bed_temperature_layer_0}   ; wait for bed heating up
M109 R{material_print_temperature_layer_0} ; wait for extruder to reach initial printing temp
M300 T                                     ; play sound at start of first layer
G0 Z{layer_height_0} F1500                 ; move to initial layer height and bring extruder to 0
G1 X10 E6 F400                             ; purge 6mm in a short move to the right
G1 Y1 E6.5 F300                            ; purge 0.5mm in a short move forward
G1 X0 E8.5 F250                            ; purge 2mm in a short move to the left
M8100 M{purge_pattern} N{machine_nozzle_size} F{material_diameter} ; purge material line if selected
M82                                        ; set extruder to absolute mode
G92 E1                                     ; set extruder position to 1 for a retract
G1 E0 F1800                                ; retract 1mm at 30mm/s back to E0
M117 {print_job_name};                     ; progress indicator message on LCD
;Start G-Code End