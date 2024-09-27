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
M82                                        ; absolute extrusion mode
M73 P0                                     ; clear GLCD progress bar
M75			     	                       ; start GLCD timer
M107                                       ; disable fans
G90                                        ; absolute positioning
M420 S0                                    ; disable leveling matrix
M104 S{material_soften_temperature}        ; start soften filament before retraction
M140 S{material_bed_temperature_layer_0}   ; start bed heating up
M117 Homing for Engine Start...;           ; progress indicator message on LCD
G28O                                       ; home all axes
M900 K{linear_advance}                     ; set linear advance
G90                                        ; absolute positioning
G92 E0                                     ; set extruder position to 0
G0 X145 Y187 Z156 F3000                    ; move away from endstops
M117 Heating Phase Initiated...;           ; progress indicator message on LCD
M109 S{material_soften_temperature}        ; soften filament before retraction
M117 Retracting Hotend Filament...;        ; progress indicator message on LCD
M109 R{material_wipe_temperature}          ; wait for extruder to reach wiping temp
M104 S{material_probe_temperature}         ; start cooling to probe temp during wipe
M106 S255                                  ; turn fan on to help drop temp
M107                                       ; turn off part cooling fan
M104 S{material_probe_temperature}         ; set probe temp
M117 Sending Space Probes...;              ; Progress indicator message on LCD
G34                                        ; tram X-Axis
G29                                        ; start auto-leveling sequence
M104 S{material_print_temperature_layer_0} ; start extruder to reach initial printing temp
M420 S1                                    ; enable leveling matrix
G1 X5 Y0 Z10 F8000                         ; move up off last probe point
G4 S1                                      ; pause
M400                                       ; wait for moves to finish
M190 S{material_bed_temperature_layer_0}   ; wait for bed heating up
M117 Reaching Mission Temp...;             ; progress indicator message on LCD
M109 R{material_print_temperature_layer_0} ; wait for extruder to reach initial printing temp
M300 T                                     ; play sound at start of first layer
G0 Z{layer_height_0} F1500                 ; move to initial layer height and bring extruder to 0
G1 X10 E8 F400                             ; purge 8mm in a short move to the right
G1 Y1 E8.5 F300                            ; purge 0.5mm in a short move forward
G1 X0 E11.5 F250                           ; purge 3mm in a short move to the left
M8100 M{purge_pattern} N{machine_nozzle_size} F{material_diameter} ; purge material line if selected
M82                                        ; set extruder to absolute mode
G92 E1                                     ; set extruder position to 1 for a retract
G1 E0 F1800                                ; retract 1mm at 30mm/s back to E0
M117 {print_job_name};                     ; progress indicator message on LCD
;Start G-Code End