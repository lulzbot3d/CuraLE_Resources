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
;M301 P21.0 I1.78 D61.93                   ;Set Hotend PID
;M906 E960                                 ;TMC Motor Current
;
G4 S1                                      ; delay for 1 seconds to display file name
M104 S{material_soften_temperature}        ; start soften filament before retraction
M140 S{material_bed_temperature_layer_0}   ; start bed heating up
M117 Homing Axes... Please Wait.;          ; progress indicator message on LCD
G28O                                       ; home all axes
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
M109 S{material_soften_temperature}        ; soften filament before retraction
M117 Retracting Filament...;               ; progress indicator message on LCD
G1 E-7 F75                                 ; retract filament
G92 E-12                                   ; set extruder position to -12 to account for 5mm retract at end of previous print
M104 S{material_probe_temperature}         ; set probe temp
M117 Leveling Print Bed...;                ; Progress indicator message on LCD
G29                                        ; start auto-leveling sequence
M104 S{material_print_temperature_layer_0} ; start extruder to reach initial printing temp
M420 S1                                    ; enable leveling matrix
G1 X5 Y15 Z10 F8000                        ; move up off last probe point
G4 S1                                      ; pause
M400                                       ; wait for moves to finish
M117 Final Heating... Please Wait.;        ; progress indicator message on LCD
M109 S{material_bed_temperature_layer_0}   ; wait for bed heating up
M109 R{material_print_temperature_layer_0} ; wait for extruder to reach initial printing temp
G1 Z2 E0 F75                               ; prime tiny bit of filament into the nozzle
M300 T                                     ; play sound at start of first layer
M117 {print_job_name};                     ; progress indicator message on LCD
;Start G-Code End