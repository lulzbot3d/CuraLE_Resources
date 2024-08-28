G28         ; Home Axis
G0 X160 F9999 ;move toolhead to right
G0 Z5 F6000 ; Move to bottom of printer
G91         ; Set relative motion mode
M211 S0	; Turn off soft endstops
M400 ; Finish moves
M906 Z600 ; Lower current to 600mA
G0 Z-15 F500 ; Skip steppers against lower Z mounts
G90 ; Return to absolute mode
M400 ; Finish moves
M906 Z960 ; Restore default current
M211 S1	; Turn soft endstops back on
M400 ; Finish moves
G28 ; Rehome
M117 X-Axis Leveled
