# Elixir uses curly brackets to define tuples. Like lists, tuples can hold any value:

IO.inspect ({:ok,"hello"})

tuple = {1, 2, 3 , :ok, "D"}
IO.inspect (tuple_size(tuple))
IO.inspect (elem(tuple, 4))   # It is also possible to put an element at a particular index in a tuple, by elem. index value start with 0
IO.inspect(put_elem(tuple,3,4))   #accessing tuple and adding 4 at index =3 

