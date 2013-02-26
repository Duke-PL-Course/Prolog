and(A, B) :- % logic

or(A, B) :- % logic

equ(A, B) :- % logic

nand(A, B) :- % logic

nor(A, B) :- % logic

xor(A, B) :- % logic

bind(true).
bind(false).

table(A, B, Exp) :- bind(A), bind(B), Exp.