G28           ; Home Axis
G27           ; Move to top of printer
G91           ; Set relative motion mode
M211 S0	      ; Turn off soft endstops
M400          ; Finish moves
M906 Z600     ; Lower current to 600mA
G0 Z10 F500   ; Skip steppers against lower Z mounts
G90           ; Return to absolute mode
M400          ; Finish moves
M906 Z960     ; Restore default current
M211 S1	      ; Turn soft endstops back on
M400          ; Finish moves
G28           ; Rehome
M117 X-Axis Leveled