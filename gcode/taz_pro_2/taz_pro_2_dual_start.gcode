;This G-Code has been generated specifically for the {machine_name}

;SETTINGS
;Extruder 1
;Nozzle diameter = {machine_nozzle_size_0}mm
;Filament name = {material_brand_0} {material_name_0}
;Filament type = {material_type_0} {material_diameter_0}
;Filament weight = {filament_weight}
;Extruder temp = M109 S{material_print_temperature_0}

;Extruder 2
;Nozzle diameter = {machine_nozzle_size_1}mm
;Filament name = {material_brand_1} {material_name_1}
;Filament type = {material_type_1} {material_diameter_1}
;Filament weight = {filament_weight_1}
;Extruder temp = M109 S{material_print_temperature_1}

;Bed temp = M190 S{material_bed_temperature}

T0
M82                                                ; absolute extrusion mode
M73 P0                                             ; clear GLCD progress bar
M75			     	                               ; start GLCD timer
M107                                               ; disable fans
G90                                                ; absolute positioning
M420 S0                                            ; disable previous leveling matrix
M140 S{material_bed_temperature_layer_0}           ; begin bed temping up
M104 S{material_soften_temperature_0} T0           ; soften filament
M104 S{material_soften_temperature_1} T1           ; soften filament
G28O                                               ; home all axes
M900 K{linear_advance}                             ; set linear advance
M117 Heating Phase Initiated...;                   ; progress indicator message on LCD
G0 X145 Y187 Z156 F3000                            ; move away from endstops
M107                                               ; turn off fan
M280 P1 S125                                       ; raise extruders for cleaner probing
G34                                                ; tram X-axis
G29                                                ; probe sequence (for auto-leveling)
M280 P1 S75                                        ; bring extruder 1 back down
M420 S1                                            ; enable leveling matrix
M204 S500                                          ; set accel back to normal
M104 S{material_print_temperature_layer_0_0}  T0   ; set extruder temp
M104 S{material_print_temperature_layer_0_1}  T1   ; set extruder temp
T{second_extruder_nr}                              ; swap to INITIAL extruder
G0 {purge_start_location_sec} Z5 F6000             ; move to initial extruder purge start location
M400                                               ; wait for moves to finish
M190 S{material_bed_temperature_layer_0}           ; wait for bed heating up
M117 Reaching Mission Temp...;                     ; progress indicator message on LCD
M109 R{material_print_temperature_layer_0}         ; wait for extruder to reach initial printing temp
M300 T                                             ; play sound at start of first layer
G92 E0                                             ; set extruder to zero
G0 Z{layer_height_0} F1500                         ; move to initial layer height
G91                                                ; relative positioning
M82                                                ; set extruder to absolute mode
G1 X10 E8 F400                                     ; purge 8mm in a short move to the left
G1 Y1 E8.5 F300                                    ; purge 0.5mm in a short move forward
G1 X-10 E11.5 F250                                 ; purge 3mm in a short move to the right
M8100 M{purge_pattern_sec} N{machine_nozzle_size_sec} F{material_diameter_sec} ; purge material line if selected
M83                                                ; set extruder to relative mode
G1 E-1 F1800                                       ; retract 1mm at 30mm/s
G0 Z10 F1500                                       ; raise extruder
M104 S{material_standby_temperature_sec}           ; set second extruder to standby temperature
T{initial_extruder_nr}                             ; swap to INITIAL extruder
G0 {purge_start_location_init} Z5 F6000               ; move to initial extruder purge start location
M109 R{material_print_temperature_layer_0_init}    ; set extruder temp and wait
G92 E0                                             ; set extruder to zero
G0 Z{layer_height_0} F1500                         ; move to initial layer height
G91                                                ; relative positioning
M82                                                ; set extruder to absolute mode
G1 X10 E8 F400                                     ; purge 8mm in a short move to the left
G1 Y1 E8.5 F300                                    ; purge 0.5mm in a short move forward
G1 X-10 E11.5 F250                                 ; purge 3mm in a short move to the right
M8100 M{purge_pattern_1} N{machine_nozzle_size_1} F{material_diameter_1} ; purge material line if selected
M83                                                ; set extruder to relative mode
G1 E-1 F1800                                       ; retract 1mm at 30mm/s
M82                                                ; set extruder to absolute mode
M117 Printing {print_job_name}...
;Start G-Code End