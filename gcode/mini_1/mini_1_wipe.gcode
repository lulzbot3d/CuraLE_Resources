;This G-Code has been generated specifically for the LulzBot Mini with standard extruder
G21                                ; set units to Millimetres
M107                               ; disable fans
G90                                ; absolute positioning
M82                                ; set extruder to absolute mode
G92 E0                             ; set extruder position to 0
G28                                ; home all axes
G0 X0 Y187 Z156 F200               ; move away from endstops
M109 R{material_wipe_temperature}  ; wait for extruder to reach wiping temp
G1 E-30 F75                        ; retract filament
G1 X42 Y173 F11520                 ; move above wiper pad
G1 Z0  F1200                       ; push nozzle into wiper
G1 X42 Y173 Z-.5 F4000             ; wiping
G1 X52 Y171 Z-.5 F4000             ; wiping
G1 X42 Y173 Z0 F4000               ; wiping
G1 X52 Y171 F4000                  ; wiping
G1 X42 Y173 F4000                  ; wiping
G1 X52 Y171 F4000                  ; wiping
G1 X42 Y173 F4000                  ; wiping
G1 X52 Y171 F4000                  ; wiping
G1 X57 Y173 F4000                  ; wiping
G1 X77 Y171 F4000                  ; wiping
G1 X57 Y173 F4000                  ; wiping
G1 X77 Y171 F4000                  ; wiping
G1 X57 Y173 F4000                  ; wiping
G1 X87 Y171 F4000                  ; wiping
G1 X77 Y173 F4000                  ; wiping
G1 X97 Y171 F4000                  ; wiping
G1 X77 Y173 F4000                  ; wiping
G1 X97 Y171 F4000                  ; wiping
G1 X77 Y173 F4000                  ; wiping
G1 X97 Y171 F4000                  ; wiping
G1 X107 Y173 F4000                 ; wiping
G1 X97 Y171 F4000                  ; wiping
G1 X107 Y173 F4000                 ; wiping
G1 X97 Y171 F4000                  ; wiping
G1 X107 Y173 F4000                 ; wiping
G1 X112 Y171 Z-0.5 F1000           ; wiping
G1 Z10                             ; raise extruder
G28 X0 Y0                          ; re-home to account for build variance of earlier mini builds
G0 X0 Y187 F200                    ; move away from endstops
G0 Y152 F4000                      ; move in front of wiper pad
G4 S1                              ; pause
M400                               ; wait for moves to finish
G1 E0 F75                          ; prime tiny bit of filament into the nozzle
M400                               ; wait for moves to finish

