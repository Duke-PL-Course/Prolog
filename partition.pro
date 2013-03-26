partition([], [], [], _).
partition(Left, Right, [H|T], Pivot) :- H =< Pivot, partition(L2, Right, T, Pivot), append([H], L2, Left).
partition(Left, Right, [H|T], Pivot) :- H > Pivot, partition(Left, R2, T, Pivot), append([H], R2, Right).

partitionIndex([], [], [], _, _).
partitionIndex(Left, Right, [H|T], Index, BaseIndex) :- BaseIndex =< Index, NextIndex is BaseIndex + 1, partitionIndex(L2, Right, T, Index, NextIndex), append([H], L2, Left).
partitionIndex(Left, Right, [H|T], Index, BaseIndex) :- BaseIndex > Index, NextIndex is BaseIndex + 1, partitionIndex(Left, R2, T, Index, NextIndex), append([H], R2, Right).
