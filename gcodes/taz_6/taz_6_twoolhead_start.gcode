;This G-Code has been generated specifically for the {machine_name}
M73 P0                              ; clear GLCD progress bar
M107                                ; disable fans
G90                                 ; absolute positioning
M82                                 ; set extruder to absolute mode
G92 E0                              ; set extruder position to 0
M140 S{material_bed_temperature_layer_0}    ; start bed heating up
G28 XY                              ; home X and Y
G1 X-19 Y258 F1000                  ; move to safe homing position
T0                                  ; switch to extruder 1
M104 S{material_soften_temperature} ; get the plastic all melty
T1                                  ; switch to extruder 2
M109 R{material_soften_temperature} ; soften filament before homing Z
G28 Z                               ; home Z
T0                                  ; switch to extruder 1
M104 S{material_wipe_temperature}   ; set temp but don't wait
T1                                  ; switch to extruder 2
M109 R{material_wipe_temperature}   ; wait for extruder to reach wiping temp
G92 E0                              ; set extruder location to 0
G1 E-30 F100                        ; retract filament
G1 X-15 Y100 F3000                  ; move above wiper pad
G1 Z0.5                             ; push nozzle into wiper
G1 X-17 Y95 F1000                   ; slow wipe
G1 X-17 Y90 F1000                   ; slow wipe
G1 X-17 Y85 F1000                   ; slow wipe
G1 X-15 Y90 F1000                   ; slow wipe
G1 X-17 Y80 F1000                   ; slow wipe
G1 X-15 Y95 F1000                   ; slow wipe
G1 X-17 Y75 F2000                   ; fast wipe
G1 X-15 Y65 F2000                   ; fast wipe
G1 X-17 Y70 F2000                   ; fast wipe
G1 X-15 Y60 F2000                   ; fast wipe
G1 X-17 Y55 F2000                   ; fast wipe
G1 X-15 Y50 F2000                   ; fast wipe
G1 X-17 Y40 F2000                   ; fast wipe
G1 X-15 Y45 F2000                   ; fast wipe
G1 X-17 Y35 F2000                   ; fast wipe
G1 X-15 Y40 F2000                   ; fast wipe
G1 X-17 Y70 F2000                   ; fast wipe
G1 X-15 Y30 Z2 F2000                ; fast wipe
G1 X-17 Y35 F2000                   ; fast wipe
G1 X-15 Y25 F2000                   ; fast wipe
G1 X-17 Y30 F2000                   ; fast wipe
G1 X-15 Y25 Z1.5 F1000              ; slow wipe
G1 X-17 Y23 F1000                   ; slow wipe
G1 Z10                              ; raise extruder
G1 X155 Y95 F3000                   ; move above other wiper
G1 Z0.5                             ; move down into wiper pad
G1 X155 Y90 F1000                   ; slow wipe
G1 X155 Y85 F1000                   ; slow wipe
G1 X153 Y90 F1000                   ; slow wipe
G1 X155 Y80 F1000                   ; slow wipe
G1 X153 Y95 F1000                   ; slow wipe
G1 X155 Y75 F2000                   ; fast wipe
G1 X153 Y65 F2000                   ; fast wipe
G1 X155 Y70 F2000                   ; fast wipe
G1 X153 Y60 F2000                   ; fast wipe
G1 X155 Y55 F2000                   ; fast wipe
G1 X153 Y50 F2000                   ; fast wipe
G1 X155 Y40 F2000                   ; fast wipe
G1 X153 Y45 F2000                   ; fast wipe
G1 X155 Y35 F2000                   ; fast wipe
G1 X153 Y40 F2000                   ; fast wipe
G1 X155 Y70 F2000                   ; fast wipe
G1 X153 Y30 F2000                   ; fast wipe
G1 X155 Y35 F2000                   ; fast wipe
G1 X153 Y25 F2000                   ; fast wipe
G1 X155 Y30 F2000                   ; fast wipe
G1 X153 Y25 F1000                   ; slow wipe
G1 X155 Y23 F1000                   ; slow wipe
G1 Z15                              ; raise extruder
T0                                  ; switch extruder
M104 S{material_probe_temperature}  ; set but don't wait
T1                                  ; switch extruder
M109 R{material_probe_temperature}  ; wait for extruder to reach probe temp
G28 XY                              ; home X and Y
M204 S100                           ; set probing acceleration
G29                                 ; start auto-leveling sequence
M425 Z			     ; use measured Z backlash for compensation
M425 Z F0		     ; turn off measured Z backlash compensation. (if activated in the quality settings, this command will automatically be ignored)
M204 S350                           ; restore standard acceleration
G1 Z15 F5000                        ; move up off last probe point
G4 S1                               ; pause
M400                                ; wait for moves to finish
M117 Heating...                     ; progress indicator message on LCD
T0                                  ; switch to extruder 1
M104 S{material_print_temperature_layer_0}  ; set but don't wait
T1                                  ; switch to extruder 2
M109 R{material_print_temperature_layer_0}  ; wait for extruder to reach printing temp
M190 R{material_bed_temperature_layer_0} ; wait for bed to reach printing temp
G1 Z2 E0 F75                        ; prime tiny bit of filament into the nozzle
M117 TAZ 6 Printing...             ; progress indicator message on LCD
;Start G-Code End
