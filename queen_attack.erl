-module(queen_attack).

-export([can_attack/2]).

on_diagonal({X,Y}, {J,K})           -> erlang:abs(X-J) == erlang:abs(Y-K).

can_attack(WhiteQueen, BlackQueen)  -> can_attack(WhiteQueen, BlackQueen, on_diagonal(WhiteQueen, BlackQueen)).

can_attack(_,_,true)            -> true;
can_attack({X, _}, {X, _}, _)   -> true;
can_attack({_, Y}, {_, Y}, _)   -> true;
can_attack(_,_,_)               -> false.