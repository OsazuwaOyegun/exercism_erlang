-module(grains).

-export([square/1, total/0]).

square(Square) when Square == 1                     -> 1;
square(Square) when (Square>=1) and (Square=<64)    -> 2 * square(Square - 1);
square(_Square)                                     -> {error, "square must be between 1 and 64"}.

total() -> 
    Squares = lists:seq(1,64),
    ListOfGrains = lists:map(fun(X) -> square(X) end, Squares),
    lists:foldl(fun(X, Sum) -> X + Sum end, 0, ListOfGrains).
