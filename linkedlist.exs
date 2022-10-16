# Elixir uses square brackets to specify a list of values. Values can be of any type:
# List uses only ascii values to print
IO.puts([104, 101, 108, 108, 111])                              # hello
IO.puts (length [104, 101, 108, 108, 111])
IO.puts([49,50,51,[116,114,117,101]]++[52, 53, 54])            # Concatanation: 123true456

IO.puts([49,50,51,[116,114,117,101], 52, 53, 54]-- [[116,114,117,101]])      #Subtraction: 123456     

list = [49, 50, 51]   
IO.puts [hd(list)]  #head of the list --> 1
IO.puts [tl(list)]  #tail of the list --> 23

IO.puts ('hello'== "hello")  # single quote charlist is not equal to double quote string  --> false
