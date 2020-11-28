-module(custom_set).

-export([add/2, contains/2, difference/2, disjoint/2, empty/1, equal/2, from_list/1, intersection/2, subset/2,
	 union/2]).


add(Elem, Set) -> 
	case lists:member(Elem, Set) of
		true -> Set;
		false -> [Elem | Set]
	end.

contains(Elem, Set) -> lists:member(Elem, Set).

difference(Set1, Set2) -> difference(Set1, Set2, []).
difference([], _Set2, Difference) -> lists:reverse(Difference);
difference([H|T], Set2, Difference) -> difference(T, Set2, build_difference(H, Set2, Difference)).

build_difference(H, Set2, Difference) ->
	case lists:member(H, Set2) of
			true -> Difference;
			false -> [H | Difference]
	end.

disjoint(Set1, Set2) -> intersection(Set1, Set2) == [].

empty(Set) -> length(Set)==0.

equal(Set1, Set2) -> length(Set1)==length(Set2) andalso difference(Set1, Set2) == [].

from_list(List) -> from_list(List, []).
from_list([], Set) -> lists:sort(Set);
from_list([H|T], Set) -> from_list(T, add(H, Set)).

intersection(Set1, Set2) -> intersection(union(Set1, Set2), Set1, Set2, []).
intersection([], _Set1, _Set2, Intersect) -> lists:sort(Intersect);
intersection([H|T], Set1, Set2, Intersect) -> intersection(T, Set1, Set2, build_intersect(H, Set1, Set2, Intersect)).

build_intersect(H, Set1, Set2, Intersect) ->
	case lists:member(H, Set1) andalso lists:member(H,Set2) of
		true -> [H | Intersect];
		false -> Intersect
	end.

subset(Set1, Set2) -> lists:all(fun(X)->lists:member(X, Set2) end, Set1).

union(Set1, Set2) -> union(Set1, Set2, Set2).
union([], _Set2, Merge) -> lists:sort(Merge);
union([H|T], Set2, Merge) -> union(T, Set2, add(H, Merge)).

