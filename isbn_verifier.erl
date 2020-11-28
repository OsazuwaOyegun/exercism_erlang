-module(isbn_verifier).

-export([is_valid/1]).

is_valid(Isbn) -> is_valid(cleanup(Isbn), 0, 0).

is_valid([], 10, Result) -> Result rem 11 =:= 0;
is_valid([], _Count, _Result) -> false;         % Count/=10, valid Isbn but input was either too long or too short
is_valid([$X|[]], Count, Result) -> is_valid([], Count + 1, Result + 10*1);     % X is check digit 
is_valid([$X|_T], _Count, _Result) -> false;                                    % X in isbn but not as check digit
is_valid([H|T], Count, Result) when H>=$0 andalso H=<$9 -> is_valid(T, Count+1, Result + ((length(T)+1) * erlang:list_to_integer([H])));
is_valid([_|[]], _Count, _Result) -> false;     % check digit is letter but not X
is_valid([_|_T], _Count, _Result) -> false.     % letter/invalid character in Isbn

cleanup(String) ->
    lists:filter(fun(X)-> (X>=$0 andalso X=<$9) orelse lists:member(X, lists:seq($A, $Z)) end, String).

