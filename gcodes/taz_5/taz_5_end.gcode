M400                         ; wait for moves to finish
M104 S0                      ; disable hotend
M140 S0                      ; disable bed heater
M107                         ; disable fans
G91                          ; relative positioning
G1 E-1 F300                  ; filament retraction to release pressure
G1 Z0.5 E-5 X-20 Y-20 F3000  ; lift up and retract even more filament
M77			                 ; stop GLCD timer
G90                          ; absolute positioning
G1 X0 Y250                   ; move to cooling position
M84                          ; disable steppers
G90                          ; absolute positioning
M117 Print Complete.         ; print complete message
