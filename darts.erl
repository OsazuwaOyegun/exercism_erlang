-module(darts).

-export([score/2]).


distance_from_bullsye(X, Y) -> math:sqrt(X*X + Y*Y).

score(X, Y) -> score(distance_from_bullsye(X, Y)).

score(Distance) when Distance>10    -> 0;
score(Distance) when Distance>5     -> 1;
score(Distance) when Distance>1     -> 5;
score(_)                            ->10.

