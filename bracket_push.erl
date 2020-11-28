-module(bracket_push).

-export([is_paired/1]).


is_paired(String) -> is_paired(String, []).

is_paired([], []) -> true;
is_paired([], _)  -> false;

% insert opening tags into list Temp in LIFO order
is_paired([H|T], Temp) when H==$(;H==${;H==$[   -> is_paired(T, [H|Temp]);

% check closing tags against opening tags to determine matches, then search list with matching tags dropped
is_paired([$}|T], [${|Temp])                    -> is_paired(T, Temp);
is_paired([$]|T], [$[|Temp])                    -> is_paired(T, Temp);
is_paired([$)|T], [$(|Temp])                    -> is_paired(T, Temp);

% closing tags without matching opening tags
is_paired([H|T], Temp) when H==$);H==$};H==$]   -> is_paired(T, [H|Temp]);

is_paired([_|T], Temp)                          -> is_paired(T, Temp);
is_paired(_, _)                                 -> false.
