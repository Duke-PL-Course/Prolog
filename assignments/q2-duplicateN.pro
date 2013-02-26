prependN(L, 0, L, _).
prependN(O, N, L, H) :- N > 0, N2 is N - 1, append([H], O2, O), prependN(O2, N2, L, H).

appendN(L, 0, L, _).
appendN(O, N, L, H) :- N > 0, N2 is N - 1, appendN(O2, N2, L, H), append(O2, [H], O).

duplicateN([], [], _).
duplicateN(OL, [H|L], N) :- duplicateN(L2, L, N), prependN(OL, N, L2, H).
