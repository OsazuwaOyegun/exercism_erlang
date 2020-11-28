-module(sum_of_multiples).

-export([sum/2]).


sum(Factors, Limit) -> sum(Factors, lists:seq(1, Limit-1), []).

sum([], _Limit, Result) -> lists:sum(sets:to_list(sets:from_list(Result)));

sum([0|T], Lim_List, Result) -> sum(T, Lim_List, Result);
sum([H|T], Lim_List, Result) -> sum(T, Lim_List, lists:append(lists:filter(fun(X)-> X rem H == 0 end, Lim_List),Result)).

