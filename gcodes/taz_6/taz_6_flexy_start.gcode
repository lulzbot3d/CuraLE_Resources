;This G-Code has been generated specifically for the {machine_name}

;SETTINGS
;Nozzle diameter = {machine_nozzle_size}mm
;Filament name = {material_brand} {material_name}
;Filament type = {material_type} {material_diameter}
;Filament weight = {filament_weight}
;Extruder temp = M109 S{material_print_temperature}
;Bed temp = M190 S{material_bed_temperature}

M73 P0                       ; clear GLCD progress bar
M75 			             ; start GLCD timer
M107                         ; disable fans
M420 S0                      ; disable leveling matrix
G90                          ; absolute positioning
M82                          ; set extruder to absolute mode
G92 E0                       ; set extruder position to 0
M140 S{print_bed_temperature_layer_0} ; get bed heating up
M907 E67                     ; set safe extruder torque
G28 XY                       ; home X and Y
G1 X-19 Y258 F1000           ; move to safe homing position
M109 R{material_soften_temperature}                   ; soften filament for z homing
G28 Z                        ; home Z
M109 R{material_wipe_temperature}                    ; cool to probing temp during wipe
G1 E-30 F100                 ; suck up XXmm of filament
G1 X-15 Y100 F3000           ; move above wiper pad
G1 Z1                        ; push nozzle into wiper
G1 X-17 Y95 F1000            ; slow wipe
G1 X-17 Y90 F1000            ; slow wipe
G1 X-17 Y85 F1000            ; slow wipe
G1 X-15 Y90 F1000            ; slow wipe
G1 X-17 Y80 F1000            ; slow wipe
G1 X-15 Y95 F1000            ; slow wipe
G1 X-17 Y75 F2000            ; fast wipe
G1 X-15 Y65 F2000            ; fast wipe
G1 X-17 Y70 F2000            ; fast wipe
G1 X-15 Y60 F2000            ; fast wipe
G1 X-17 Y55 F2000            ; fast wipe
G1 X-15 Y50 F2000            ; fast wipe
G1 X-17 Y40 F2000            ; fast wipe
G1 X-15 Y45 F2000            ; fast wipe
G1 X-17 Y35 F2000            ; fast wipe
G1 X-15 Y40 F2000            ; fast wipe
G1 X-17 Y70 F2000            ; fast wipe
G1 X-15 Y30 Z2 F2000         ; fast wipe
G1 X-17 Y35 F2000            ; fast wipe
G1 X-15 Y25 F2000            ; fast wipe
G1 X-17 Y30 F2000            ; fast wipe
G1 X-15 Y25 Z1.5 F1000       ; slow wipe
G1 X-17 Y23 F1000            ; slow wipe
G1 Z10                       ; raise extruder
M109 R{material_probe_temperature}                   ; heat to probe temp
G1 X-9 Y-9                   ; move above probe
M204 S100                    ; set accel for probing
G29                          ; probe sequence (for auto-leveling)
M420 S1                      ; enable leveling matrix
M425 Z			     ; use measured Z backlash for compensation
M425 Z F0		     ; turn off measured Z backlash compensation. (if activated in the quality settings, this command will automatically be ignored)
M204 S500                    ; set accel back to normal
G1 X0 Y0 Z15 F5000           ; get out the way
M400                         ; clear buffer
G4 S1                        ; pause
M117 Heating...              ; LCD status message
M109 R{material_print_temperature_layer_0}  ; wait for extruder to reach printing temp
M190 R{material_bed_temperature_layer_0}; get bed temping up during first layer
G1 Z2 E0 F75                 ; extrude filament back into nozzle
M117 TAZ Printing...         ; LCD status message
;Start G-Code End
