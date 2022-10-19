#Keyword lists

#Keyword lists are a data-structure used to pass options to functions. Imagine you want to split a string of numbers.
#1. String.split/2 
IO. inspect (String.split("1 2 3"," ")) #["1", "2", "3"]
IO. inspect (String.split("1  2  3"," ")) #["1", "", "2", "", "3"] #due to additional space
#1.1. trim: in String.split/3 -> keyword list : allows the trim option to be set to true:
IO. inspect (String.split("1  2  3"," ", trim: true)) #["1", "2", "3"] #reducing extra spaces

#keyword lists are 2-item tuples where the first element (the key) is an atom and the second element can be any value. Both representations are the same:
# First element->atom      second element->value
IO.inspect ([{:trim,true}] == [trim: true]) #true #Both representation is ok

#Since keyword lists are lists, we can use all operations available to lists. For example, we can use ++ to add new values to a keyword list:
IO. inspect ([a: 1, b: 2]) #[a: 1, b: 2]
list = [c: 3]
IO.inspect (list1=[a: 1, b: 2]++list) #[a: 1, b: 2, c: 3]
IO.inspect (list1[:a]) # 1 # Accessing list list1 by using bracket syntax
IO.inspect (list1[:c]) # 3

IO.inspect (list2 = [a: 0]++list1) # [a: 0, a: 1, b: 2, c: 3] # duplicate keys, values
IO.inspect (list2[:a]) # 0 # in case of duplicate key value pair, value of first key is been fetched

#IMPORTANT
#Keyword lists are important because they have three special characteristics:
#1. Keys must be atoms.
#2. Keys are ordered, as specified by the developer.
#3. Keys can be given more than once.

# Keyword list is also used to write database queries in Ecto library


IO.inspect ([a: a]=[a: 1]) #[a: 1]
IO.inspect (a) #1

#IO.inspect ([a: a]=[a: 1, b: 2]) #(MatchError) no match of right hand side value: [a: 1, b: 2]
#IO. inspect ([b: b, a: a] = [a: 1, b: 2]) #(MatchError) no match of right hand side value: [a: 1, b: 2]

#keyword lists are simply lists, and as such they provide the same linear performance characteristics as them: the longer the list, the longer it will take to find a key, to count the number of items, and so on.
# keyword lists are used in Elixir mainly for passing optional values.
# If you need to store many items or guarantee one-key associates with at maximum one-value, you should use maps instead.

#MAP
# Whenever you need a key-value store, maps are the “go to” data structure in Elixir. A map is created using the %{} syntax:

IO.inspect (map = %{:a => 1,2 =>:b}) #%{2 => :b, :a => 1}
IO. inspect (map[:a]) #1
IO. inspect (map[2])  #:b
IO. inspect (map[:c]) #nil

#Compared to keyword lists, we can already see two differences:

#Maps allow any value as a key.
#Maps’ keys do not follow any ordering.


# maps are very useful with pattern matching. When a map is used in a pattern, it will always match on a subset of the given value:
IO.inspect (%{} = %{:a => 1,2 =>:b}) #%{2 => :b, :a => 1}
IO.inspect ( %{:a => a} = %{:a => 1, 2 => :b}) #%{2 => :b, :a => 1}
#IO.inspect (%{:c => c} = %{:a => 1, 2 => :b}) #(MatchError) no match of right hand side value: %{2 => :b, :a => 1}

#Variables can be used when accessing, matching and adding map keys
n=1
IO. inspect (map1=%{n => :one}) #%{1 => :one}
IO.inspect (map1[n]) #:one
IO.inspect (%{^n => :one} = %{1 => :one, 2 => :two, 3 => :three}) #%{1 => :one, 2 => :two, 3 => :three}

#Manipulating maps - using Map
IO.inspect(Map.get(%{:a => 1, :b => 2}, :a)) # 1 # Map.get/2 or Map.fetch/2 is used to fetch value of the key
IO.inspect(Map.put(%{:a => 1, :b => 2}, :c, 3)) # %{a: 1, b: 2, c: 3} #Map.put is used to add key-value
IO.inspect(Map.to_list(%{:a => 1, :b => 2}))  #[a: 1, b: 2] # Map.to_list is used to convert it into list
IO.inspect(Map.delete(%{a: 1, b: 2}, :a)) #%{b: 2} #Deletes the entry in map for a specific key.If the key does not exist, returns map unchanged.

#Maps have the following syntax for updating a key’s value:
map = %{:a => 1, 2 => :b}
IO.inspect(%{map | 2 => :two}) #%{2 => :two, :a => 1}
IO.inspect(map.a) # 1
#IO.inspect(map.c) #(KeyError) key :c not found in: %{2 => :b, :a => 1}