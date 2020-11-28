-module(word_count).

-export([count_words/1]).

count_words(Sentence) -> 
    List_of_words = get_list_of_words(Sentence),
    lists:foldl(fun(X, Map)->maps:update_with(X, fun(A)->A+1 end, 1, Map) end, #{}, List_of_words).

get_list_of_words(Sentence) -> get_list_of_words(Sentence, []).

get_list_of_words([], Result) -> [lists:reverse(X) || X <- string:split(Result, " ", all), X/=[]];  % to remove space characters

get_list_of_words([$\s|T], Result) -> get_list_of_words(T, [$\s | Result]);
get_list_of_words([$'|T], Result) -> get_list_of_words(T, Result);
get_list_of_words([A,$',C|T], Result) when A>=$a,A=<$z,C>=$a,C=<$z -> get_list_of_words(T, [C,$',A | Result]);
get_list_of_words([$',$\s|T], Result) when hd(Result)/=[] -> get_list_of_words(T, [T | Result]);
get_list_of_words([H|T], Result) when H=<$9,H>=$0 -> get_list_of_words(T, [H | Result]);
get_list_of_words([H|T], Result) when H>=$a,H=<$z -> get_list_of_words(T, [H | Result]);
get_list_of_words([H|T], Result) when H>=$A,H=<$Z -> get_list_of_words(T, [H+32 | Result]);
get_list_of_words([$,,$\s|T], Result) -> get_list_of_words(T, [$\s | Result]);
get_list_of_words([$,|T], Result) -> get_list_of_words(T, [$\s | Result]);
get_list_of_words([_H|T], Result) -> get_list_of_words(T, Result).

