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
M73 P0                                             ; clear GLCD progress bar
M75			     	                               ; start GLCD timer
M107                                               ; disable fans
G90                                                ; absolute positioning
M420 S0                                            ; disable previous leveling matrix
M140 S{material_bed_temperature_layer_0}           ; begin bed temping up
M104 S{material_wipe_temperature_0}                ; soften filament
M104 S{material_wipe_temperature_0} T1             ; soften filament
G28O                                               ; home
G0 X50 Y25 Z10 F2000
M117 Heating...
M109 R{material_soften_temperature_0}              ; wait for temp
M106 S255                                          ; turn on fans to speed cooling
M109 R{material_wipe_temperature_0}                ; wait for T0 wipe temp
M104 S{material_probe_temperature_0}               ; cool to probe temp on E0
M104 S{material_probe_temperature_0} T1            ; cool to probe temp on E1
M83                                                ; set extruder to relative mode
G1 E-4 F500                                        ; retract 4mm to help with drool on fresh filament load
M117 Wiping...
G12                                                ; wipe sequence
M107                                               ; turn off fan
G29                                                ; probe sequence (for auto-leveling)
M420 S1                                            ; enable leveling matrix
T{second_extruder_nr}                              ; ensure we're using the SECOND extruder
M104 S{material_print_temperature_layer_0_0} T0    ; set extruder temps
M104 S{material_print_temperature_layer_0_1} T1    ; set extruder temps
G0 {purge_start_location_sec} Z5 F6000                ; move to initial extruder purge start location
M400                                               ; clear buffer
M117 Heating...;                                   ; Note: We purge the second extruder first to avoid an unneeded swap after purging
M109 R{material_print_temperature_layer_0_sec}     ; set extruder temp and wait
M190 R{material_bed_temperature_layer_0}           ; get bed temping up during first layer
M400                                               ; clear buffer
M300 T                                             ; play sound at start of first layer
G92 E0                                             ; set extruder to zero
G0 Z{layer_height_0} F1500                         ; move to initial layer height
G91                                                ; relative positioning
M82                                                ; set extruder to absolute mode
G1 X10 E8 F400                                     ; purge 5mm in a short move to the left
G1 Y1 E8.5 F300                                    ; purge 0.5mm in a short move forward
G1 X-10 E10.5 F250                                 ; purge 2mm in a short move to the right
M8100 M{purge_pattern_sec} N{machine_nozzle_size_sec} F{material_diameter_sec} ; purge material line if selected
M83                                                ; set extruder to relative mode
G1 E-1 F1800                                       ; retract 1mm at 30mm/s
G0 Z10 F1500                                       ; raise extruder
M104 S{material_standby_temperature_sec}           ; set second extruder to standby temperature
T{initial_extruder_nr}                             ; swap to INITIAL extruder
G0 {purge_start_location_init} Z5 F1500               ; move to initial extruder purge start location
M109 R{material_print_temperature_layer_0_init}    ; set extruder temp and wait
G92 E0                                             ; set extruder to zero
G0 Z{layer_height_0} F6000                         ; move to initial layer height
G91                                                ; relative positioning
M82                                                ; set extruder to absolute mode
G1 X10 E8 F400                                     ; purge 5mm in a short move to the left
G1 Y1 E8.5 F300                                    ; purge 0.5mm in a short move forward
G1 X-10 E10.5 F250                                 ; purge 2mm in a short move to the right
M8100 M{purge_pattern_1} N{machine_nozzle_size_1} F{material_diameter_1} ; purge material line if selected
M83                                                ; set extruder to relative mode
G1 E-1 F1800                                       ; retract 1mm at 30mm/s
M82                                                ; set extruder to absolute mode
M117 Printing {print_job_name}...
;Start G-Code End
