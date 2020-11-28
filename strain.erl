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

% keep(_Fn, []) -> [];
% keep(Fn, List) -> keep(Fn, List, Fn(hd(List)), []).

% keep(_Fn, [], _, Result) -> lists:reverse(Result);
% keep(Fn, [H1, H2|T], true, Result)   -> keep(Fn, [H2|T], Fn(H2), [H1 | Result]);
% keep(Fn, [_H1, H2|T], false, Result) -> keep(Fn, [H2|T], Fn(H2), Result);
% keep(Fn, [H], true, Result) -> keep(Fn, [], false, [H | Result]);
% keep(Fn, [_H], false, Result) -> keep(Fn, [], false, Result).

% discard(_Fn, []) -> [];
% discard(Fn, List) -> discard(Fn, List, Fn(hd(List)), []).

% discard(_Fn, [], _, Result) -> lists:reverse(Result);
% discard(Fn, [_H1, H2|T], true, Result)   -> discard(Fn, [H2|T], Fn(H2), Result);
% discard(Fn, [H1, H2|T], false, Result) -> discard(Fn, [H2|T], Fn(H2), [H1 | Result]);
% discard(Fn, [_H], true, Result) -> discard(Fn, [], false, Result);
% discard(Fn, [H], false, Result) -> discard(Fn, [], false, [H | Result]).

