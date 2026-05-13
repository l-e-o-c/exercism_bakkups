const expected_bake_time = 60

preparation_time(x) = 2 * x

remaining_time(x) = expected_bake_time - x

total_working_time(x, y) = preparation_time(x) + y

