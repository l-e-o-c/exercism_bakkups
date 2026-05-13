const expected_bake_time = 60

preparation_time(layers) = 2 * layers

remaining_time(minutes_in_oven) = expected_bake_time - minutes_in_oven

total_working_time(layers, minutes_in_oven) = preparation_time(layers) + minutes_in_oven

