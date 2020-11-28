-module(pangram).

-export([is_pangram/1]).

-define(Alphabets, lists:seq($a, $z)).  % we'll use Alphabets to screen out numbers etc from Input

is_pangram([]) -> false;
is_pangram(Input) ->
    % use a map with alphabets as keys. Convert this map to a list and length = 26 implies "is_pangram==true"
    length(maps:to_list(charMapFromInput([Sentence || Sentence <- string:to_lower(Input), lists:member(Sentence, ?Alphabets)], #{}))) =:=26.

charMapFromInput([], CharsMap) -> CharsMap;
charMapFromInput([H | T], CharsMap) ->
    charMapFromInput(T, CharsMap#{H => maps:get(H, CharsMap, 0) + 1}).
