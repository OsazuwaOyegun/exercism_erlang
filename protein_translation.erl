-module(protein_translation).

-export([proteins/1]).


proteins(Strand) -> proteins(Strand, 0, []).

proteins([], _, Result) -> lists:reverse(Result);
proteins(_Strand, true, Result) -> lists:reverse(Result);   % true flag indicates STOP codon found
proteins([X,Y,Z|Tail], 0, Result) -> 
    Protein = get_protein([X]++[Y]++[Z]),
    case Protein of
        "STOP" -> proteins(Tail, true, Result);
        _ -> proteins(Tail, 0, [erlang:list_to_atom(string:lowercase(Protein)) | Result])
    end.

get_protein(Mini_Strand) when Mini_Strand =="AUG" -> "Methionine";
get_protein(Mini_Strand) when Mini_Strand =="UUU";Mini_Strand=="UUC" -> "Phenylalanine";
get_protein(Mini_Strand) when Mini_Strand =="UUA";Mini_Strand=="UUG" -> "Leucine";
get_protein(Mini_Strand) when Mini_Strand =="UCU";Mini_Strand=="UCC";Mini_Strand=="UCA";Mini_Strand=="UCG" -> "Serine";
get_protein(Mini_Strand) when Mini_Strand =="UAU";Mini_Strand=="UAC" -> "Tyrosine";
get_protein(Mini_Strand) when Mini_Strand =="UGU";Mini_Strand=="UGC" -> "Cysteine";
get_protein(Mini_Strand) when Mini_Strand =="UGG" -> "Tryptophan";
get_protein(Mini_Strand) when Mini_Strand =="UAA";Mini_Strand=="UAG";Mini_Strand=="UGA" -> "STOP".

