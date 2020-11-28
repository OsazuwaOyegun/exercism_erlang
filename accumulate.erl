-module(accumulate).

-export([accumulate/2]).

accumulate(Fn, Ls)            -> accumulate(Fn, Ls, []).

accumulate(_Fn, [], Result)   -> lists:reverse(Result);
accumulate(Fn, [H|T], Result) -> accumulate(Fn, T, [Fn(H) | Result]).