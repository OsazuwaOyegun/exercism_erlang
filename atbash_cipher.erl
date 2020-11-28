-module(atbash_cipher).

-export([decode/1, encode/1]).

decode(Phrase) -> coding(Phrase).

encode(Phrase) -> add_space(coding(Phrase)).

coding(String) -> coding(String, []).
coding([], Result) -> lists:reverse(Result);
coding([H|T], Result) when H==$\s;H==$,;H==$. -> coding(T, Result);
coding([H|T], Result) when H=<$9 andalso H>=$0-> coding(T, [H | Result]);
coding([H|T], Result) when H>=$A andalso H=<$Z -> coding(T, [219 - (H+32) | Result]);
coding([H|T], Result) -> coding(T, [219 - H | Result]).

add_space(String) -> add_space(String, []).
add_space([], Result) -> unicode:characters_to_list(lists:reverse(Result));
add_space([A,B,C,D,E | []], Result) -> add_space([], [E,D,C,B,A | Result]);
add_space([A,B,C,D,E | T], Result) -> add_space(T, [$\s,E,D,C,B,A | Result]);
add_space([H|T], Result) -> add_space([], [[H|T] | Result]).

% Credit to: Mentor & https://exercism.io/tracks/erlang/exercises/atbash-cipher/solutions/5d412b9b2f984a5fac08cc6edfab8fb6

