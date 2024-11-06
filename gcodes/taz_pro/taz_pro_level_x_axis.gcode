M117 Leveling X Axis   ; leveling message
M400                   ; wait for moves to finish
G1 X125 Z250 F2000     ;park toolhead
M400                   ; wait for moves to finish
G28 Z                  ; home Z axis
M400                   ; wait for moves to finish
M117 Leveling Complete ; leveling complete message
