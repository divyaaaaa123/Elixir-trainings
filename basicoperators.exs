#Basic operators 
IO.puts (2 + 3)      #5
IO.puts (div(10,2))  #5 
IO.puts (14 * 3)     #42

#Manipulating list

IO.inspect([1, 2, 3] ++ [:ok])   #[1, 2, 3, :ok]
IO.inspect([1, 2, 3] -- [3])     #[1,2]

#String concatanation
IO.puts ("I am" <> " Bond")    #I am Bond

#Boolean operators - or, and, not - strictly for boolean 

IO.puts(true or false)   # true
IO. puts(true and false)  # false
IO.puts(not false)       #true

#other method of boolean operators - not necessary for boolean

IO.puts (true || false)   #true
IO.puts (true && false)   #false
IO.puts (!true)           #false
IO.puts (!nil)            #true
IO.puts (!1)              #false

#Comparison operators : ==, ===, >=, <=, !=, <, >  ==> boolean result

IO.puts (1 == 2)         #false
IO.puts (1 < 4)          #true

#Difference between == and === for integer and float values
IO. puts (1 == 1.0)     #true
IO.puts (1 === 1.0)     #false      

#Comparison of data types is possible
IO.puts (1 < :atom)    #true             # sorting order from lower to higher: number, atom, reference, function, port, pid, tuple, map, list, bitstring


