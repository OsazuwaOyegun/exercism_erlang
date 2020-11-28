-module(isogram).

-export([is_isogram/1]).

is_isogram(Phrase) ->
    Plist = string:to_lower([X || X <- Phrase, X/=45, X/=32]),
    case Plist == [] of
        true -> true;
        false -> checkPhrase(Plist, [], true)
    end.

checkPhrase([], _TempList, Result) -> Result;
checkPhrase([H | T], TempList, Result) ->
    % io:format("Result: ~p ~p ~w~n", [Result, lists:reverse(TempList), H]),
    checkPhrase(T,
                [H | TempList],
                Result and not lists:member(H, TempList)).
