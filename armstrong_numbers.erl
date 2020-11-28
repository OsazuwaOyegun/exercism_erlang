-module(armstrong_numbers).

-export([is_armstrong_number/1]).


is_armstrong_number(Number) -> is_armstrong_number(Number, Number, []).

is_armstrong_number(Number, 0, Result) -> 
    Number == lists:foldl(fun(X, Sum)->Sum + math:pow(X, length(Result)) end, 0, Result);

is_armstrong_number(Number, Num, Result) -> is_armstrong_number(Number, Num div 10, [Num rem 10 | Result]).




% is_armstrong_number(Number) -> 
%     List = [erlang:list_to_integer([Num]) || Num <- erlang:integer_to_list(Number)],
%     Length = length(List),
%     Number == lists:sum([math:pow(Num,Length) || Num <- List]).


