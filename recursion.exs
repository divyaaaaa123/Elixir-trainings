#RECURSION
#Loops through recursion
defmodule Recursion do
    def print_n_times(msg, n) when n > 0 do
        IO.puts (msg)
        print_n_times(msg, n-1)
    end

    def print_n_times(msg, 0) do  #termination clause
        :Done
    end
end

IO.inspect(Recursion.print_n_times("Elixir", 5))
# Elixir
# Elixir
# Elixir
# Elixir
# Elixir
# :Done


#Mutating is not possible in Elixir. Instead, functional languages rely on recursion: a function is called recursively until a condition is reached that stops the recursive action from continuing. No data is mutated in this process.





#Reduce and map algorithms
#Example 1 : Sum of list of numbers - Reduce
defmodule Math do
    def sum_list([head | tail], sum)do
        sum_list(tail,head+sum)   #([1, 2, 3], 0)->([2,3],1)->([3],1+2),([],3+3)==6
    end
    def sum_list([], sum) do
        sum
    end
end

IO.inspect(Math.sum_list([1,2,3],6)) #12  

IO.inspect(Enum.reduce([1,2,3],6, fn(x,sum)->x + sum end))#12 -> much used and simple method

#Example2:  Double all of the values in our list --> Mapping
defmodule Math1 do
    def doubleeach([head | tail]) do
        [2*head | doubleeach(tail)] # [2*3]=> [2*2,6]=>[1*2,4,6]=>[2,4,6]
    end
    def doubleeach([]) do
        []
    end
    
end

IO.inspect(Math1.doubleeach([1,2,3]))#[2,4,6]
IO.inspect(Enum.map([1,2,3], &(&1 * 2)))#[2,4,6] -> much used and simple method
#However, when programming in Elixir you will rarely use recursion as above to manipulate lists.

#Example: 3 -> Printing numbers of the list
defmodule Try do
    def traverse([head | tail], ans \\ 0) do
    IO.inspect(ans = head)
    ans = ans + 1
    traverse(tail, head)
    end
    def traverse([],ans) do
    :end
    end
end

    
IO.inspect(Try.traverse([1,2,3,5,7]))


# 1
# 2
# 3
# 5
# 7
# :end
