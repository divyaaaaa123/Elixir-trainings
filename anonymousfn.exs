#anonymous function - sum of two numbers by anonymous function

add = fn a, b -> a + b end
IO.puts(add.(1,2))

IO.puts(is_function(add))