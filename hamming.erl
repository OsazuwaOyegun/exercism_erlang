-module(hamming).

-export([distance/2]).

distance(Strand1, Strand2) -> distance(Strand1, Strand2, 0).

distance([], [], Distance) -> Distance;

distance([H|T1], [H|T2], Distance) -> distance(T1, T2, Distance);
distance([_|T1], [_|T2], Distance) -> distance(T1, T2, Distance+1);
distance(_, _, _) -> {error, "left and right strands must be of equal length"}.