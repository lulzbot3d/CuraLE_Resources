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
;M906 E960                                  ;TMC Motor Current
;
G90                                        ; absolute coordinate
M82                                        ; set extruder to absolute mode
G92 E0                                     ; set extruder position to 0
M117 Starting {print_job_name}             ; progress indicator message on LCD
M140 S{material_bed_temperature_layer_0}   ; start bed heating up
M104 S{material_probe_temperature}         ; start extruder heating to probe temp
G28                                        ; Home all axis
M117 Heating...                            ; progress indicator message on LCD
M190 S{material_bed_temperature_layer_0}   ; wait for bed to reach printing temp
M117 Probing...                            ; progress indicator message on LCD
G29                                        ; start auto leveling
M420 S1                                    ; enable leveling matrix
G0 X0 Y0 F5000
M109 R{material_print_temperature_layer_0} ; wait for extruder to reach initial printing temp
G0 Z{layer_height_0} F1500                 ; move to initial layer height and bring extruder to 0
G1 X10 E9 F400                             ; purge 9mm in a short move to the right
G1 Y1 E10 F300                             ; purge 1mm in a short move forward
G1 X0 E16 F250                             ; purge 6mm in a short move to the left
M8100 M{purge_pattern} N{machine_nozzle_size} F{material_diameter} ; purge material line if selected
M82                                        ; set extruder to absolute mode
G92 E1                                     ; set extruder position to 1 for a retract
G1 E0 F1800                                ; retract 1mm at 30mm/s back to E0
M117 {print_job_name};                     ; progress indicator message on LCD
;Start G-Code End