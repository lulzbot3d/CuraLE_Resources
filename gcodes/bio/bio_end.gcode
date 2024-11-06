M107
M400                 ; wait for moves to finish
G1 Z50 F1000         ; move extruder out of the way
M77                  ; End GLCD Print Timer
G90                  ; absolute positioning
M18 X Y E            ; turn off x y and e axis
M117 Print Complete. ; print complete message
M82                  ; absolute extrusion mode
