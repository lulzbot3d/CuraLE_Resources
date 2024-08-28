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
M900 K{linear_advance}                             ; set linear advance
M900 K{linear_advance} T1                          ; set linear advance
M140 S{material_bed_temperature_layer_0}           ; begin bed temping up
M104 S{material_soften_temperature_0} T0           ; soften filament
M104 S{material_probe_temperature_1} T1            ; soften filament
M117 Homing for Engine Start...
G28                                                ; home
G0 X50 Y25 Z10 F2000
M117 Heating Phase Initiated...
M109 R{material_soften_temperature_0}              ; wait for temp
M82                                                ; set extruder to absolute mode
G92 E0                                             ; set extruder to zero
G1 E-7 F100                                        ; retract 7mm of filament on first extruder
M106                                               ; turn on fans to speed cooling
M117 Wiping...
M109 R{material_wipe_temperature_0}                ; wait for T0 wipe temp
M104 S{material_probe_temperature_0}               ; cool to probe temp
G12                                                ; wipe sequence
M107                                               ; turn off fan
M117 Sending Space Probes...
G29                                                ; probe sequence (for auto-leveling)
M420 S1                                            ; enable leveling matrix
T{initial_extruder_nr}                             ; ensure we're using the first extruder
M104 S{material_print_temperature_layer_0_init}    ; set extruder temp
G0 X5 Y15 Z10 F5000                                ; move to start location
M400                                               ; clear buffer
M117 Reaching Mission Temp...
M109 R{material_print_temperature_layer_0_init}    ; set extruder temp and wait
M190 R{material_bed_temperature_layer_0}           ; get bed temping up during first layer
G1 Z2 E0 F75                                       ; raise head and 0 extruder
M82					                               ; set to absolute mode
M400                                               ; clear buffer
M300 T                                             ; play sound at start of first layer
M117 Printing {print_job_name}...
;Start G-Code End
