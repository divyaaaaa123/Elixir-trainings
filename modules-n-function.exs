#MODULES AND FUNCTIONS

#Inorder to create our own module, we use the defmodule macro. 
#The first letter of the module must be in uppercase. 
#We use the def macro to define functions in that module. The first letter of every function must be in lowercase (or underscore):

#Example 1
defmodule Math do
    def sum(a, b) do
        a + b
    end
end

IO.inspect (Math.sum(2,2)) #4

#Example 2
defmodule Maths do
    def cube (a) do
        a * a * a 
    end
end

IO.inspect (Maths.cube(4)) #64


#NAMED FUNCTION
#Example1 : defp -> A function defined with def/2 can be invoked from other modules while a private function can only be invoked locally.
defmodule Add do
  def sum(a, b) do
    do_sum(a, b)
  end

  defp do_sum(a, b) do
    a + b
  end
end

IO.inspect (Add.sum(2,3)) #5
#IO.inspect (Add.do_sum(2,4)) # (UndefinedFunctionError) function Add.do_sum/2 is undefined or private

#Example2 : Check if the function is zero or not

defmodule ZeroC do
    def zero?(0) do
        true
    end 

    def zero?(x) when is_integer(x) do
        false
    end
end
IO.inspect (ZeroC.zero?(0)) #true
IO.inspect (ZeroC.zero?(1)) #false
#The trailing question mark in zero? means that this function returns a boolean;

#Supports both do and do: block
defmodule ZeroCh do
    def zero?(0), do: true

    def zero?(x) when is_integer(x), do: false

end
IO.inspect (ZeroCh.zero?(0)) #true
IO.inspect (ZeroCh.zero?(1)) #false


#FUNCTION CAPTURING
# Elixir makes a distinction between anonymous functions and named functions, where the former must be invoked with a dot (.) between the variable name and parentheses. The capture operator (&) bridges this gap by allowing named functions to be assigned to variables and passed as arguments in the same way we assign, invoke and pass anonymous functions.

IO.inspect (ZeroC.zero?(0)) #true
IO.inspect (fun = &ZeroC.zero?/1) #&ZeroC.zero?/1 #& capture syntax, here boolean - for named function #Format: &Module.function/arity
IO.inspect (is_function(fun)) #true
IO.inspect (fun.(1)) #false

IO.inspect(&is_function/1) #&:erlang.is_function/1 , here : module name: erlang
IO.inspect((&is_function/1).(fun)) #true

#Can also capture operators
IO.inspect (add = &+/2) #&:erlang.+/2
IO.inspect (add.(2,8)) #10

IO.inspect(fun1= &(&1 + 1)) #Function<0.53088174 in file:modules-n-function.exs> #similar to x = x + 1 #&1 -> first argument to be passed 
IO.inspect(fun1.(3)) #4

IO.inspect(fun2 = &("Chandler #{&1}")) #Function<1.133282366 in file:modules-n-function.exs>
IO.inspect(fun2.("Bing")) #"Chandler Bing"


#DEFAULT ARGUMENTS
#Named function supports default arguments

#Example1 : join
defmodule Concat do
    def join(a,b,sep \\" ")do    #join is a default argument  #\\ indicates bydefault if there is no value
        a <> sep <> b
    end
end

IO.inspect(Concat.join("Hello","World")) #"Hello World"
IO.inspect(Concat.join("Hello","World", "_")) #"Hello_World"

#Example2: dowork
defmodule DefaultTest do
    def dowork(x\\"hello")do
        x
    end
end

IO.inspect(DefaultTest.dowork) #hello
IO.inspect(DefaultTest.dowork("D")) #"D"
IO.inspect(DefaultTest.dowork) #hello

#Example3

defmodule Concat1 do
    def join(a,b \\ nil, sep \\ " ") #function head declaring defaults
        def join(a,b,_sep)when is_nil(b) do #The leading underscore in _sep means that the variable will be ignored in this function
            a 
        end
        def join(a, b, sep) do
            a <> sep <> b
        end
    
end

IO.inspect(Concat1.join("Hello","World")) #"Hello World"
IO.inspect(Concat1.join("Hello","World", "_")) #"Hello_World"
IO.inspect(Concat1.join("Hello"))#Hello

#Example3

defmodule Concat2 do
    def join(a, b) do
        IO.puts("First join")
        a <> b
    end

    def join(a, b, sep \\ " ") do
    IO.puts("Second join")
    a <> sep <> b
    end
end

IO.inspect(Concat2.join("Hello","World"))
#First join
#"HelloWorld"
IO.inspect(Concat2.join("Hello","World","_"))
#Second join
#"Hello_World"



