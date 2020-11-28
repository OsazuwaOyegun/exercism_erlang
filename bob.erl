-module(bob).

-export([response/1]).

response(String) -> 
        Trimmed = string:trim(String),
        response(is_yell_andalso_is_question(Trimmed), is_yell(Trimmed), is_question(Trimmed), was_something_said(Trimmed)).

response(true, _, _, _) -> "Calm down, I know what I'm doing!";        % is_yell_andalso_is_question
response(_, true, _, _) -> "Whoa, chill out!";                         % is_yell
response(_, _, true, _) -> "Sure.";                                    % is_question
response(_, _, _, true) -> "Fine. Be that way!";                       % was_something_said
response(_, _, _, _) -> "Whatever.".

is_yell_andalso_is_question(String) ->
        % letters all uppercase and last character is "?" 
        is_yell(String) andalso is_question(String).

is_yell(String) ->
        % verify that all letters in String are in uppercase
        Letters = lists:filter(fun(X)->lists:member(X, all_letters()) end, String),
        Letters/=[] andalso Letters==string:uppercase(Letters).

is_question(String) ->
        % String ends with "?"
        String/=[] andalso lists:last(String) == $?.

was_something_said(String) ->
        not lists:any(fun(X)->lists:member(X, all_letters()) end, String) 
                andalso lists:filter(fun(X)->lists:member(X, lists:seq($0,$9)) end, String)==[].
         
all_letters() ->
        lists:seq($a,$z)++lists:seq($A,$Z).