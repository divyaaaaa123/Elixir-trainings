#Basic operators 
IO.puts (2 + 3)      #5
IO.puts (div(10,2))  #5 
IO.puts (14 * 3)     #42

#Manipulating list

IO.inspect([1, 2, 3] ++ [:ok])   #[1, 2, 3, :ok]
IO.inspect([1, 2, 3] -- [3])     #[1,2]

#String concatanation
IO.puts ("I am" <> " Bond")    #"I am Bond"

#Boolean operators - or, and, not - strictly for boolean operators

IO.puts(true or false)   # true
IO. puts(true and false)  # false
IO.puts(not false)       #true
