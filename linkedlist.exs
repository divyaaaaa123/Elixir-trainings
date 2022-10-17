# Elixir uses square brackets to specify a list of values. Values can be of any type:

IO.inspect([104, 101, 108, 108, 111])                              # hello
IO.inspect (length [104, 101, 108, 108, 111])                     # length of the list
IO.inspect([49,50,51,[116,114,117,101]]++[52, 53, 54])            # Concatanation after: [49, 50, 51, 'true', 52, 53, 54]

IO.inspect([49,50,51,[116,114,117,101], 52, 53, 54]-- [[116,114,117,101]])      #Subtraction: '123456'

list = [1, 2, 3]
IO.inspect(list)        # [1,2,3]
IO.inspect (hd(list))  #head of the list --> 1
IO.inspect (tl(list))  #tail of the list --> 23

IO.inspect([0] ++ list) # Concatanation before: [0,1,2,3]
IO.inspect ('hello'== "hello")  # single quote charlist is not equal to double quote string  --> false
