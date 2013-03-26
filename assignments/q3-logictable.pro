and(A, B) :- A, B.

or(A, _) :- A.
or(_, B) :- B.

equ(A, B) :- A = B.

nand(A, _) :- \+ A.
nand(_, B) :- \+ B.

nor(A, B) :- \+ A, \+ B.

xor(A, B) :- A, \+ B.
xor(A, B) :- \+ A, B.

bind(true).
bind(false).

table(A, B, Exp) :- bind(A), bind(B), Exp.