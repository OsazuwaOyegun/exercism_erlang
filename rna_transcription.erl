-module(rna_transcription).

-export([to_rna/1]).
-define(GET_RNA(X), maps:get(X, #{$G=>$C, $C=>$G, $T=>$A, $A=>$U})).

to_rna(Strand) -> to_rna(Strand, []).

to_rna([], RNA) -> lists:reverse(RNA);
to_rna([H|T], RNA) -> to_rna(T, [ ?GET_RNA(H) | RNA]).
