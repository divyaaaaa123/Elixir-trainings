#NESTED DATA STRUCTURES

IO.inspect (users = [
  Joey: %{name: "Joey", age: 22, languages: ["Erlang", "Javascript", "Elixir"]},
  Chandler: %{name: "Chandler", age: 23, languages: ["Elixir", "C", "Java"]}
]) 
# [
#   Joey: %{age: 22, languages: ["Erlang", "Javascript", "Elixir"], name: "Joey"},
#   Chandler: %{age: 23, languages: ["Elixir", "C", "Java"], name: "Chandler"}
# ]

IO.inspect (users[:Joey].languages)  #["Erlang", "Javascript", "Elixir"]
IO.inspect (users[:Joey].age) #22

IO.inspect (put_in(users[:Chandler].age, 26))  #using put_in/2, update the value in list
# [
#   Joey: %{age: 22, languages: ["Erlang", "Javascript", "Elixir"], name: "Joey"},
#   Chandler: %{age: 26, languages: ["Elixir", "C", "Java"], name: "Chandler"}
# ]

#Remove “Java” from Chandler’s list of languages:
IO.inspect (update_in users[:Chandler].languages, fn languages -> List.delete(languages, "Java") end )
 #[
#   Joey: %{age: 22, languages: ["Erlang", "Javascript", "Elixir"], name: "Joey"},
#   Chandler: %{age: 23, languages: ["Elixir", "C"], name: "Chandler"}
# ]

#The update_in/2 macro is similar but allows us to pass a function that controls how the value changes. 

