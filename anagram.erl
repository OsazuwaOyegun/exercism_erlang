-module(anagram).

-export([find_anagrams/2]).


find_anagrams(Subject, Candidates) -> 
    lists:sort(
        lists:filter
        (fun(X)->lists:sort(string:uppercase(X))==lists:sort(string:uppercase(Subject)) 
        andalso 
        (string:uppercase(X)/=string:uppercase(Subject)) end, Candidates)
    ).

