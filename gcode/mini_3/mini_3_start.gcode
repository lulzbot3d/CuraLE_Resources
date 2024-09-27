;This G-Code has been generated specifically for the {machine_name}

;SETTINGS
;Nozzle diameter = {machine_nozzle_size}mm
;Filament name = {material_brand} {material_name}
;Filament type = {material_type} {material_diameter}
;Filament weight = {filament_weight}
;Extruder temp = M109 S{material_print_temperature}
;Bed temp = M190 S{material_bed_temperature}

START EXTRUDER_TEMP={material_print_temperature_layer_0} BED_TEMP={material_bed_temperature_layer_0} START_LAYER_HEIGHT={layer_height_0}
M8100 M{purge_pattern} N{machine_nozzle_size} F{material_diameter} ; purge material line if selected
;Start G-Code End