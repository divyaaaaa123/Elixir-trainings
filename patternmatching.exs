#Pattern match on list:

[a, b, c] = [1, :hi ,"boss"]
IO.inspect (a)              #1
IO.inspect (c)              #"boss"

[head|tail] = ["Australia", "India", "England"]      #head and tail pre-built function
IO.inspect (head)          #"Austrailia"      
IO.inspect (tail)          #["India", "England"]


#Pattern match on tuples:
{a, b, c} = {:hello, "world", 42}
IO.inspect (a)           #:hello
IO.inspect (b)           #"world"
IO.inspect (c)           # 42
#A pattern match error will occur if the sides can’t be matched, for example if the tuples have different sizes:

#The [head | tail] format is not only used on pattern matching but also for prepending items to a list:
list = [1, 2, 3]
IO.inspect ([0|list])   #[0,1,2,3]

#Pin operator : Variables in Elixir can be rebound. Use the pin operator ^ when you want to pattern match against a variable’s existing value rather than rebinding the variable.

IO.puts (x=10)
IO.puts (^x = 20)   #Error