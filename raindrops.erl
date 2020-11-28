-module(raindrops).

-export([convert/1, list_of_factors/1]).

list_of_factors(N)  ->  lists:filter(fun(X)->N rem X == 0 end, lists:seq(1, N)).

convert(Number)     -> convert(Number, list_of_factors(Number), "").

convert(Number, [], []) -> integer_to_list(Number);     % finished processing factors and no sounds, so we return Number
convert(_Number, [], Result) -> Result;                 % finished processing factors, return accumulated sounds

convert(Number, [3|T], Result) -> convert(Number, T, Result ++ "Pling");
convert(Number, [5|T], Result) -> convert(Number, T, Result ++ "Plang");
convert(Number, [7|T], Result) -> convert(Number, T, Result ++ "Plong");
convert(Number, [_H|T], Result) -> convert(Number, T, Result).