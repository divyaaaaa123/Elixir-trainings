#CASE allows us to compare a value against many patterns until we find a matching one:
#Example 1
IO.inspect (
case {1, 2, 3} do
{4,5,6} -> "This clause won't match"
{1,x,3} -> "This clause will match and bind x to 2 in this clause"   #This clause gets printed
_-> "This clause would match any value"
end)

#Example 2
x=1
 IO.inspect(
case x=10 do
^x -> "Won't match" #This gets printed (Pin operator)
_-> "Will match"    
end
 )

#Example 3 - Clauses also allow extra conditions to be specified via guards:

IO.inspect (
    case {1,2,3} do
    {1, x, 3} when x > 0 -> "Will match" #This gets printed
    _-> "Won't match, if guard condition were not satisfied"
    end
)

#Example 4 - If none of the clauses match, an error is raised:

# IO.inspect (
#     case :ok do
#     :error -> "Will match" 
#     end
# ) #(CaseClauseError) no case clause matching: :ok

#Example 5 - anonymous functions can also have multiple clauses and guards:


f = fn 
x,y when x > 0 -> x + y # for 1, this will work
x,y -> x * y # for 2, this will work
end
IO. inspect (f.(1,4)) # 1
IO. inspect (f.(-3,7)) # 2

#Note: The number of arguments in each anonymous function clause needs to be the same, otherwise an error is raised.





#COND :
#case is useful when you need to match against different values. However, in many circumstances, we want to check different conditions and find the first one that does not evaluate to nil or false. In such cases, one may use cond

#Example 1:

IO. inspect (
    cond do
    1 + 4 == 6 -> "This is not true"
    2 * 8 == 17 -> "False"
    1 + 1 == 2 -> "True"   #This gets printed

    end
)

#Example 2 : If all of the conditions return nil or false, an error (CondClauseError) is raised. For this reason, it may be necessary to add a final condition, equal to true, which will always match

IO. inspect (
    cond do
    1 + 4 == 6 -> "This is not true"
    2 * 8 == 17 -> "False"
    true -> "Always true, (equivalent to else)"   #This gets printed by default
    end
)

#Example 3: cond considers any value besides nil and false to be true:

IO. inspect (
    cond do
    hd([1, 2, 3]) -> "1 is considered as true"   # This gets printed
    end
)


#IF AND UNLESS -> which are useful when you need to check for only one condition:

#Example 1
IO. inspect (
    if true do
    "This will work"
    end
) # "This will work"
IO. inspect (
    unless true do
    "This will never be seen"
    end
) # nil


#Example 2

z = 1
IO. inspect (
    if true do
    z = z + 1
    end
) # 2
IO. inspect (z)  # 1

#Example 3: In said cases, if you want to change a value, you must return the value from the if:

a = 1
IO. inspect (
    a = if true do
    a = a + 1
    else
    a
    end
)    # 2
IO . inspect (a) # 2  #Value is been changed



