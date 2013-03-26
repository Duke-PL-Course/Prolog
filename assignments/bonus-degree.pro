degree(0, _, (_, [])).
degree(N, Vertex, (Vs, [(V1, _)|EL])) :- member(Vertex, Vs), V1 = Vertex, degree(N2, Vertex, (Vs, EL)), N is N2 + 1.
degree(N, Vertex, (Vs, [(V1, _)|EL])) :- member(Vertex, Vs), \+ (V1 = Vertex), degree(N, Vertex, (Vs, EL)).
