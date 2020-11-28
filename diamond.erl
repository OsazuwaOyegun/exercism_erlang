-module(diamond).

-export([rows/1]).

rows(Letter) ->
    UCLetter = hd(string:uppercase(Letter)),
    Letters = lists:seq($A, UCLetter),                  % Letter = "C", Letters = "ABC"
    List = Letters ++ lists:seq(UCLetter-1, $A, -1),    % Letter = "C", List = "ABCBA"
    rows(List, length(Letters), []).

rows([], _Count, Result) -> Result;
rows([H|T], Count, Result) when Result==[] orelse T==[] -> rows(T, Count, get_row(H, Count, true, Result));
rows([H|T], Count, Result) -> rows(T, Count, get_row(H, Count, false, Result)).

get_row(H, Count, Edge, Result) ->
    Space = " ",
    case {Edge,Result} of
        {true, []} -> 
            Str = string:left(Space, Count-(H-$A)-1),
            [Str ++ [H] ++ Str];                        % First row
        {true, _}  -> 
            Str = string:left(Space, Count-(H-$A)-1),
            Result ++ [Str ++ [H] ++ Str];              % Last row
        {false, _} ->
            Length = (2*Count)-1, 
            Str = string:left(Space, Count-(H-$A)-1),
            Middle = Length - (2*length(Str))-2,
            Str_middle = string:left(Space, Middle),
            Result ++ [Str ++ [H] ++ Str_middle ++ [H] ++ Str]  % In-between rows
    end.

