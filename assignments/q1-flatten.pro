flattenList([], []).
flattenList([H|T2], [H|T]) :- \+ is_list(H), flattenList(T2, T).
flattenList(FlattenedList, [H|T]) :- is_list(H), flattenList(HL, H), flattenList(TL, T), append(HL, TL, FlattenedList).