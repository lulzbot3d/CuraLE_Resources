;This G-Code has been generated specifically for the {machine_name}

;SETTINGS
;Nozzle diameter = {machine_nozzle_size}mm
;Filament name = {material_brand} {material_name}
;Filament type = {material_type} {material_diameter}
;Filament weight = {filament_weight}
;Extruder temp = M109 S{material_print_temperature}
;Bed temp = M190 S{material_bed_temperature}

M73 P0                                     ; clear LCD progress bar
M75                                        ; Start LCD Print Timer
M117 Starting {print_job_name}             ; progress indicator message on LCD
M107                                       ; disable fans
M420 S0                                    ; disable leveling matrix
M900 K{linear_advance}
G90                                        ; absolute positioning
M82                                        ; set extruder to absolute mode
G92 E0                                     ; set extruder position to 0
M140 S{material_bed_temperature_layer_0}   ; start bed heating up
G28                                        ; home all axes
M109 R{material_probe_temperature}         ; wait for extruder to reach probe temp
G29                                        ; start auto-leveling sequence
M420 S1                                    ; enable leveling matrix
G1 X5 Y15 Z10 F5000                        ; move up off last probe point
G4 S1                                      ; pause
M400                                       ; wait for moves to finish
M117 Heating...                            ; progress indicator message on LCD
M190 R{material_bed_temperature_layer_0}   ; wait for bed to reach printing temp
M109 R{material_print_temperature_layer_0} ; wait for extruder to reach initial printing temp
G1 Z2 E0 F75                               ; prime tiny bit of filament into the nozzle
M300 T                                     ; play sound at startr of first layer
M117 Long Bed Printing...                  ; progress indicator message on LCD
;Start G-Code End