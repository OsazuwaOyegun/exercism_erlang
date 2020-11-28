-module(run_length_encoding).

-export([decode/1, encode/1]).

decode(String) -> decode(String, [], []).

decode([], _Numbers, Result) -> unicode:characters_to_list(Result);
decode([$\s|T], [], Result) -> decode(T, [], Result ++ [$\s]);
decode([$\s|T], Numbers, Result) -> decode(T, [], Result ++ expand(Numbers, [$\s]));
decode([H|T], Numbers, Result) when H>=$0,H=<$9 -> decode(T, Numbers++[H], Result); % This string is never more than 3 chars long. Numbers++[H] is ok
decode([H|T], [], Result) when (H>=$a andalso H=<$z) orelse (H>=$A andalso H=<$Z) orelse H=:=[$\s] -> decode(T, [], Result ++ [H]);
decode([H|T], Numbers, Result) when (H>=$a andalso H=<$z) orelse (H>=$A andalso H=<$Z) orelse H=:=[$\s] -> 
    decode(T, [], Result ++ expand(Numbers,H)).

encode(String) -> encode(String, [], [], []).

encode([], _Previous, _Acc, Result) -> Result;
encode([H|[]], [], [], []) -> encode([], [], [], [H]);
encode([H|T], [], [], []) -> encode(T, H, [H], []);
encode([H|[]], H, Acc, Result) -> encode([], H, [], Result ++ contract(Acc++[H]));
encode([H|[]], _, Acc, Result) when length(Acc)>1 -> encode([], H, [H], Result ++ contract(Acc) ++ [H]); % Letter in String has changed, format and add Acc into Result
encode([H|[]], _, Acc, Result) -> encode([], H, [H], Result ++ [hd(Acc)] ++ [H]);
encode([H|T], H, Acc, Result) -> encode(T, H, [H]++Acc, Result);
encode([H|T], _, Acc, Result) when length(Acc)>1 -> encode(T, H, [H], Result++contract(Acc));    % Letter in String has changed, format and add Acc into Result
encode([H|T], _, Acc, Result) -> encode(T, H, [H], Result ++ [hd(Acc)]).

% contract("AAAA") -> 4A.
contract(List) -> erlang:integer_to_list(length(List)) ++ [hd(List)].

% expand("3", "A") -> "AAA"
expand(Count, Letter) -> expand(element(1,string:to_integer(Count)), Letter, []).
expand(0, _Letter, Result) -> Result;
expand(Count, Letter, Result) -> expand(Count-1, Letter, Result ++ [Letter]).

