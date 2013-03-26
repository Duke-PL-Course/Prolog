duplicate([], []).
duplicate(OL, [H|L]) :- duplicate(L2, L), append([H, H], L2, OL).
