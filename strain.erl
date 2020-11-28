-module(strain).

-export([keep/2, discard/2]).

keep(Fn, List) -> keep(Fn, List, []).
keep(_Fn, [], Result) -> lists:reverse(Result);
keep(Fn, [H|T], Result) -> keep(Fn, T, build_result(keep, Fn, H, Result)).

build_result(Task, Fn, H, Result) -> 
    case {Task, Fn(H)} of
        {keep, true} ->  [H | Result];
        {discard, false} -> [H | Result];
        {_, _} -> Result
    end.

discard(Fn, List) -> discard(Fn, List, []).
discard(_Fn, [], Result) -> lists:reverse(Result);
discard(Fn, [H|T], Result) -> discard(Fn, T, build_result(discard, Fn, H, Result)).


