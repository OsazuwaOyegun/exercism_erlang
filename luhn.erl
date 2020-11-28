-module(luhn).

-export([valid/1]).

valid(Value) ->
    Input = lists:reverse(lists:filter(fun(X)->X/=$\s end, Value)), % remove spaces 1st, reverse to double every 2nd digit from the right
    case Input of
        [] -> false;
        [_] -> false;
        _ -> valid(Input, 0)
    end.

valid([], Result) -> Result rem 10 =:= 0;

valid([A,B|T], Result) when (A>=$0 andalso A=<$9) andalso (B>=$0 andalso B=<$9) -> valid(T, Result + (A - $0) + product_greater_than_9(B));
valid([A], Result) when (A>=$0 andalso A=<$9) -> valid([], Result + (A - $0));
valid([A,B|_T], _Result) when not ((A>=$0 andalso A=<$9) andalso (B>=$0 andalso B=<$9)) -> false.   % for when input contains non-numeric characters

product_greater_than_9(Char)->
    case (Char-$0)*2 of             % Char-$0 converts convert chars representing numbers to integers
        Prod when Prod>9 -> Prod-9;
        Prod -> Prod
    end.

