:- use_module(library(lists)).

% We reperesent the memory head as a split in 2 lists.
in_s0_s('>', m(Ps-[A]), m([A|Ps]-[0])).
in_s0_s('>', m(Ps-[C0|Rs]), m([C0|Ps]-Rs)) :- Rs \= [].

in_s0_s('<', m([D0|Ps]-Rs), m(Ps-[D0|Rs])).

in_s0_s('+', m(Ps-[255|Rs]), m(Ps-[0|Rs])).
in_s0_s('+', m(Ps-[C0|Rs]), m(Ps-[C|Rs])) :- C0 #< 255, C #= C0 + 1 .

in_s0_s('-', m(Ps-[0|Rs]), m(Ps-[255|Rs])).
in_s0_s('-', m(Ps-[C0|Rs]), m(Ps-[C|Rs])) :- C0 #> 0, C #= C0 - 1 .

ins_s0_s(Is, S0, S) :- foldl(in_s0_s, Is, S0, S).