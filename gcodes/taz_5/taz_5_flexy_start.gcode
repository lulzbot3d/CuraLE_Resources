;This G-Code has been generated specifically for the {machine_name}

;SETTINGS
;Nozzle diameter = {machine_nozzle_size}mm
;Filament name = {material_brand} {material_name}
;Filament type = {material_type} {material_diameter}
;Filament weight = {filament_weight}
;Extruder temp = M109 S{material_print_temperature}
;Bed temp = M190 S{material_bed_temperature}

M140 S{material_bed_temperature_layer_0}    ; start bed heating up
M73 P0                              ; clear GLCD progress bar
M75			; start GLCD timer
G90                     ; absolute positioning
M82                     ; set extruder to absolute mode
M107                    ; start with the fan off
G28 X0 Y0               ; move X/Y to min endstops
G28 Z0                  ; move Z to min endstops
M907 E67                ; reduce extruder torque for safety
G1 Z15.0 F{speed_travel}; move the platform down 15mm
M117 Heating...                     ; progress indicator message on LCD
M109 R{material_print_temperature_layer_0}  ; wait for extruder to reach printing temp
M190 R{material_bed_temperature_layer_0}    ; wait for bed to reach printing temp
G92 E0                  ; zero the extruded length
G1 F200 E0              ; extrude 3mm of feed stock
G92 E0                  ; zero the extruded length again
G1 F{speed_travel}      ; set travel speed
M203 X192 Y208 Z3       ; speed limits
M117 Printing...        ; send message to LCD
;Start G-Code End
