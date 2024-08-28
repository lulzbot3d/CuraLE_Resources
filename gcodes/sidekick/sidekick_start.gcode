;This G-Code has been generated specifically for the {machine_name}

;SETTINGS
;Nozzle diameter = {machine_nozzle_size}mm
;Filament name = {material_brand} {material_name}
;Filament type = {material_type} {material_diameter}
;Filament weight = {filament_weight}
;Extruder temp = M109 S{material_print_temperature}
;Bed temp = M190 S{material_bed_temperature}

;The following lines can be uncommented for printer specific fine tuning
;More information can be found at https://marlinfw.org/meta/gcode/ (Note: current values are based on SE Tool Head)
;
;M92 E420                                   ;Set Axis Steps-per-unit
;M301 P21.0 I1.78 D61.93                    ;Set Hotend PID
;M906 E960                                  ;TMC Motor Current
;
G90                                        ; absolute coordinate
M82                                        ; set extruder to absolute mode
G92 E0                                     ; set extruder position to 0
M117 Starting {print_job_name}             ; progress indicator message on LCD
M140 S{material_bed_temperature_layer_0}   ; start bed heating up
M109 R{material_soften_temperature}        ; soften filament before homing Z
G28                                        ; Home all axis
G1 E-15 F100                               ; retract filament
M117 Heating...                            ; progress indicator message on LCD
M104 S{material_probe_temperature}         ; start extruder heating to probe temp
M190 S{material_bed_temperature_layer_0}   ; wait for bed to reach printing temp
M117 Probing...                            ; progress indicator message on LCD
G29                                        ; start auto leveling
M420 S1                                    ; enable leveling matrix
G0 X0 Y0 F5000
M109 R{material_print_temperature_layer_0} ; wait for extruder to reach initial printing temp
M117 Printing {print_job_name}...          ; progress indicator message on LCD
G1 Z2 E0 F75                               ; prime tiny bit of filament into the nozzle
;Start G-Code End