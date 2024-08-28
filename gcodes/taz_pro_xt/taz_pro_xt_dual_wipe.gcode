; This profile is designed specifically for the LulzBot TAZ Pro XT with Dual Extruder Tool Head
M73 P0                                    ; clear GLCD progress bar
M75			     	                      ; start GLCD timer
M107                                      ; disable fans
G90                                       ; absolute positioning
M420 S0                                   ; disable previous leveling matrix
M104 S170 T0                              ; soften filament
M104 S170 T1                              ; soften filament
G28                                       ; home
M117 Heating...                           ; LCD status message
M109 R170 T0                              ; wait for temp
M109 R170 T1                              ; wait for temp
T0                                        ; select this extruder first
M82                                       ; set extruder to absolute mode
G92 E0                                    ; set extruder to zero
G1 E-10 F100                              ; retract 10mm of filament on first extruder
G0 X50 F1000                              ; move over to switch extruders
T1                                        ; switch extruders
M82                                       ; set extruder to absolute mode
G92 E0                                    ; set extruder to zero
G1  E-10 F100                             ; retract 10mm of filament on second extruder
M104 S170 T0                              ; set to wipe temp
M104 S170 T1                              ; set to wipe temp
M106                                      ; turn on fans to speed cooling
T0                                        ; select first extruder for probing
G1 X-16.5 Y100 F2000                      ; move above wiper pad
M117 Cooling...                           ; LCD status message
M109 R170 T0                              ; wait for T0 to reach temp
M109 R170 T1                              ; wait for T1 to reach temp
M107                                      ; turn off fan
G1 Z 1.0                                  ; push nozzle into wiper
G1 X -16.5 Y100 F1000                     ; slow wipe
G1 X -16.5 Y90 F1000                      ; slow wipe
G1 X -15.5 Y86 F2000                      ; fast wipe
G1 X -17.5 Y80 F2000                      ; fast wipe
G1 X -15.5 Y74 F2000                      ; fast wipe
G1 X -17.5 Y70 F2000                      ; fast wipe
G1 X -16.5 Y68 F1000                      ; slow wipe
G1 X -16.5 Y60 F1000                      ; slow wipe
G1 X -14.5 Y60 F1000                      ; slow wipe
G1 X -14.5 Y46 F1000                      ; slow wipe
G1 X -17.5 Y46 F1000                      ; slow wipe
G1 X -17.5 Y60 F1000                      ; slow wipe
G1 X -14.5 Y60 F1000                      ; slow wipe
G1 X -14.5 Y46 F1000                      ; slow wipe
G1 X -17.5 Y46 F1000                      ; slow wipe
G1 X -17.5 Y60 F1000                      ; slow wipe
G1 X -14.5 Y60 F1000                      ; slow wipe
G1 X -14.5 Y46 F1000                      ; slow wipe
G1 X -17.5 Y46 F1000                      ; slow wipe
G1 X -17.5 Y60 F1000                      ; slow wipe
G1 X -16.5 Y60 F1000                      ; slow wipe
G1 X -16.5 Y42 F1000                      ; slow wipe
G1 X -15.5 Y40 F2000                      ; fast wipe
G1 X -17.5 Y38 F2000                      ; fast wipe
G1 X -15.5 Y36 F2000                      ; fast wipe
G1 X -17.5 Y34 F2000                      ; fast wipe
G1 X -16.5 Y30 F1000                      ; slow wipe
G1 X -16.5 Y19 F1000                      ; slow wipe
G1 X -16.5 Y19 Z20 F1000                  ; raise extruder
M106 S255                                 ; turn on fan to blow away fuzzies
G4 S5                                     ; wait 5 seconds
M107                                      ; turn off fan
G0 X50 F1000                              ; move over to switch extruders
T1                                        ; switch to second extruder
G1 X296.5 Y100  F5000                     ; move E2 above second wiper pad
G1 Z 1.0                                  ; push nozzle into wiper
G1 X 296.5 Y100 F1000                     ; slow wipe
G1 X 296.5 Y90 F1000                      ; slow wipe
G1 X 297.5 Y86 F2000                      ; fast wipe
G1 X 295.5 Y80 F2000                      ; fast wipe
G1 X 297.5 Y74 F2000                      ; fast wipe
G1 X 295.5 Y70 F2000                      ; fast wipe
G1 X 296.5 Y68 F1000                      ; slow wipe
G1 X 296.5 Y60 F1000                      ; slow wipe
G1 X 298 Y60 F1000                        ; slow wipe
G1 X 298 Y46 F1000                        ; slow wipe
G1 X 295 Y46 F1000                        ; slow wipe
G1 X 295 Y60 F1000                        ; slow wipe
G1 X 298 Y60 F1000                        ; slow wipe
G1 X 298 Y46 F1000                        ; slow wipe
G1 X 295 Y46 F1000                        ; slow wipe
G1 X 295 Y60 F1000                        ; slow wipe
G1 X 298 Y60 F1000                        ; slow wipe
G1 X 298 Y46 F1000                        ; slow wipe
G1 X 295 Y46 F1000                        ; slow wipe
G1 X 295 Y60 F1000                        ; slow wipe
G1 X 296.5 Y60 F1000                      ; slow wipe
G1 X 296.5 Y42 F1000                      ; slow wipe
G1 X 297.5 Y40 F2000                      ; fast wipe
G1 X 295.5 Y38 F2000                      ; fast wipe
G1 X 297.5 Y36 F2000                      ; fast wipe
G1 X 295.5 Y34 F2000                      ; fast wipe
G1 X 297.5 Y30 F1000                      ; slow wipe
G1 X 296.5 Y19 F1000                      ; slow wipe
G1 X 296.5 Y19 Z20 F1000                  ; raise extruder
M106 S255                                 ; turn on fan to blow away fuzzies
G4 S5                                     ; wait 5 seconds
M107                                      ; turn off fan
G1 E10                                    ; re-prime E2
G1 X-30
T0                                        ; switch to first extruder
G1 E10 F100		    	                  ; re-prime E1
M82					                      ; set to absolute mode
G1 X140 Y140 Z150                         ; position head
M400                                      ; clear buffer
M117 Wiping Complete                      ; LCD status message
