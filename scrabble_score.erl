-module(scrabble_score).

-export([score/1]).

score([]) -> 0;
score(Word) -> lists:foldl(fun(X, Score) -> get_points(X) + Score end, 0, string:uppercase(Word)).


get_points(Letter) when Letter==$A;Letter==$E;Letter==$I;Letter==$O;Letter==$U;Letter==$L;Letter==$N;Letter==$R;Letter==$S;Letter==$T -> 1;
get_points(Letter) when Letter==$D;Letter==$G -> 2;
get_points(Letter) when Letter==$B;Letter==$C;Letter==$M;Letter==$P -> 3;
get_points(Letter) when Letter==$F;Letter==$H;Letter==$V;Letter==$W;Letter==$Y -> 4;
get_points(Letter) when Letter==$K -> 5;
get_points(Letter) when Letter==$J;Letter==$X -> 8;
get_points(Letter) when Letter==$Q;Letter==$Z -> 10.
