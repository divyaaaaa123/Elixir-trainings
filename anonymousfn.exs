#anonymous function - sum of two numbers by anonymous function

add = fn a, b -> a + b end
IO.puts(add.(1,2))

IO.puts(is_function(add))

# checking number of arguments in add function = 2 or no

# 1. check if add is a function that expects exactly 2 arguments

IO.puts(is_function(add,2))

# 2. check if add is a function that expects exactly 1 argument

IO.puts(is_function(add,1))