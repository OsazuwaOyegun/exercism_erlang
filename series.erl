-module(series).

-export([slices/2]).

slices(SliceLength, Series) when SliceLength>0,SliceLength=<length(Series) -> slices(SliceLength, Series, false, []).

slices(_SliceLength, [], _, Result)     -> lists:reverse(Result);
slices(_SliceLength, _, true, Result)   -> lists:reverse(Result);

slices(SliceLength, Series, false, Result)  -> 
    slices(SliceLength, tl(Series), SliceLength>length(tl(Series)), [lists:sublist(Series, SliceLength) | Result]).

