-module(nucleotide_count).
-export([count/2, nucleotide_counts/1]).

% build map of Strand or error when invalid Nucleotide in Strand
strand_map(Strand)                                       -> strand_map(Strand, #{"A"=>0,"C"=>0,"G"=>0,"T"=>0}).

strand_map([], Result)                                   -> Result;
strand_map([H|T], Result) when H==$A;H==$C;H==$G;H==$T   -> strand_map(T, maps:put([H], maps:get([H], Result) + 1, Result)).

% count how many occurences of Nucleotide in Strand
count(Strand, Nucleotide)       ->  maps:get(Nucleotide, strand_map(Strand)).

% return list of tuples with count of individual Nucleotides in Strand, or error when there is an illegal Nucleotide
nucleotide_counts(Strand)       ->  maps:to_list(strand_map(Strand)).
