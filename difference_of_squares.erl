-module(difference_of_squares).
-import(lists, [map/2, seq/2, sum/1]).
-export([difference_of_squares/1, square_of_sum/1, sum_of_squares/1]).


difference_of_squares(N) -> 
    square_of_sum(N)-sum_of_squares(N).

square_of_sum(N) -> 
    Sum = sum(seq(1,N)),
    Sum * Sum.

sum_of_squares(N) -> 
    L = seq(1,N),
    sum(map(fun(X)->X*X end, L)).

