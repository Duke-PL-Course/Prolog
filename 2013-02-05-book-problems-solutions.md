# Prolog Self-Study

## Day 1: Self-Study

### Find
Some free Prolog tutorials

* [Prolog tutorial by J.R. Fisher](http://www.csupomona.edu/~jrfisher/www/prolog_tutorial/contents.html)
* [Prolog tutorial by A. Aaby](http://www.lix.polytechnique.fr/~liberti/public/computing/prog/prolog/prolog-tutorial.html)
* [A short prolog tutorial](http://www.doc.gold.ac.uk/~mas02gw/prolog_tutorial/prologpages/)
* [Learn Prolog Now!](http://www.learnprolognow.org/lpnpage.php?pageid=online)
* Many more (just google it)

A support forum

* [Old Nabble - Gnu - Prolog forum](http://old.nabble.com/Gnu---Prolog-f1818.html)
* [Stack Overflow - Prolog tag](http://stackoverflow.com/tags/prolog/info)

One online reference for the Prolog version you're using
[GNU-Prolog Manual](http://stackoverflow.com/tags/prolog/info)

### Do

Make a simple knowledge base. Represent some of your favorite books and authors.

```prolog
wrote(charles_dickens, a_tale_of_two_cities).
wrote(j_r_r_tolkien, the_hobbit).
wrote(j_r_r_tolkien, the_lord_of_the_rings).
wrote(dan_brown, the_da_vinci_code).
wrote(dan_brown, angels_and_demons).
wrote(e_b_white, charlottes_web).
wrote(j_k_rowling, harry_potter).

% Find all books in your knowledge base written by one author.
wrote(dan_brown, What).

% Make a knowledge base representing musicians and instruments.
% Also represent musicians and their genre of music.
plays(bob_marley, guitar).
plays(kurt_cobain, guitar).
plays(eddie_van_halen, guitar).
plays(stevie_wonder, piano).
plays(ludwig_van_beethoven, piano).
plays(frederic_chopin, piano).
plays(franz_liszt, piano).
plays(ringo_starr, drums).
plays(travis_barker, drums).
plays(kesha, autotune).
genre(bob_marley, reggae).
genre(kurt_cobain, rock).
genre(eddie_van_halen, rock).
genre(stevie_wonder, soul).
genre(ludwig_van_beethoven, classical).
genre(frederic_chopin, classical).
genre(franz_liszt, classical).
genre(ringo_starr, rock).
genre(travis_barker, rock).
genre(kesha, pop).

% Find all musicians who play the guitar.
plays(Who, guitar).

% Bonus: Find all genres where guitar is played.
plays(X, guitar), genre(X, Genre).
```

## Day 2: Self-Study

### Find

#### Fibonacci

```prolog
fib(0, 0).
fib(1, 1).
fib(F, N) :-
  N1 is N - 1,  % Alternatively, we could use succ(N1, N)
  N2 is N - 2,  % similarly succ(N2, N1); succ(A, B) means B = A + 1
  fib(F1, N1),
  fib(F2, N2),
  F is F1 + F2. % Alternatively plus(F1,F2,F)
% Support negatives by adding following rule, and call it fib2
% Remember: F(-n) = (-1)^(n+1) * F(n)
fib2(F, N) :-
  AN is abs(N),                 % Find AN = abs(N)
  fib(PF, AN),                  % calculate F(abs(n)) as PF
  F is PF * (sign(N) ** (N+1)). % Use sign predicate to determine 1 or -1 from N
                                %  and then raise to (N+1)
```

```prolog
%% Recursion
fib(1, N) :- N < 3.
fib(V, N) :- N > 2, fib(V1, N - 2), fib(V2, N - 1), V is V1 + V2.

%% Tail recursion
fibTail(B, N, _, B) :- N < 3.
fibTail(V, N, A, B) :- N > 2, Sum is A + B, fibTail(V, N - 1, B, Sum).
```

#### Factorial
```prolog
factorial(1, 0).  % 0! = 1
factorial(F, N) :-
  succ(N1, N),
  factorial(F1, N1),
  F is F1 * N.
```

```prolog
%% Recursion
factorial(1, 0).
%% factorial(V, N) :- N > 0, N2 is N - 1, factorial(V2, N2), V is N * V2.
factorial(V, N) :- N > 0, succ(N2, N), factorial(V2, N2), V is N * V2.

%% Tail Recursion
factorialTail(V, 0, V).
factorialTail(V, N, Init) :- N > 0, N2 is N - 1, Accum is N * Init, factorialTail(V, N2, Accum).
```

A real-world community using Prolog. What problems are they solving with it today?

### Do

**Reverse the elements of a list**

```prolog
% note that reverse/2 is already taken
revl([X], [X]).
revl(R, [H|T]) :- revl(RT, T), append(RT, [H], R).
```

Alternative:

```prolog
reverseList([H], [H]).
reverseList([H|T], R) :- reverseList(T, T2), append(T2, [H], R).
```

**Find the smallest element of a list**

```prolog
% Find the smallest element of a list, tail-recursive; note that min_list/2 is already taken
min(Min, X, Y) :- % finds the min of two values
  X < Y, Min is X;
  X >= Y, Min is Y.
% Beware that min_list exists already
minl(Min, [H|T]) :- minl(Min, T, H). % default min is head
minl(Min, [], Min). % Base case is empty list, return calculated min
minl(Min, [H|T], X) :- min(CurrMin, H, X), minl(Min, T, CurrMin).
```

Alternative:

```prolog
%% Find the smallest element of a list.
smallest([H], H).
smallest([Head|Tail], Small) :- smallest(Tail, Small2), Small2 < Head, Small is Small2.
smallest([Head|Tail], Small) :- smallest(Tail, Small2), Head < Small2, Small is Head.
```

**Sort the elements of a list**
```prolog
% Let's use selection sort since we've already built minl
takeout(RetList, X, List) :- list(List), takeout(RetList, X, List, []).
takeout(RetList, H, [H|T], Past) :- append(Past, T, RetList).
takeout(RetList, X, [H|T], Past) :-
  append(Past, [H], P),
  takeout(RetList, X, T, P).

sortl(Sorted, List) :- list(List), sortl(Sorted, List, []).
sortl(Sorted, [], Sorted).
sortl(Sorted, List, Partial) :-
  minl(Min, List),
  takeout(Rest, Min, List),
  append(Partial, [Min], NewList),
  sortl(Sorted, Rest, NewList).

% sortl is O(n^2); it is also stable
```

Alternative:

```prolog
without([], _, []).
without([H|T], H, T).
without([H|T], Item, [H|T2]) :- \+(H = Item), without(T, Item, T2).

%% Doesn't yet support duplicates
sortList([H], [H]).
sortList(L, [H2|T2]) :- smallest(L, H2), without(L, H2, L2), sortList(L2, T2).
```

## Day 3: Blowing Up Vegas

### Find

**Prolog has some input/output features as well. Find print predicates that print out variables.**
[Wiki Books](http://en.wikibooks.org/wiki/Prolog/Input_and_Output)
[Input/Output](http://www.ling.helsinki.fi/kit/2004k/ctl272/Bangor/clbook_60.html)

Reading a File:

```prolog
process(File) :-
        open(File, read, In),
        get_char(In, Char1),
        process_stream(Char1, In),
        close(In).

process_stream(end_of_file, _) :- !.
process_stream(Char, In) :-
        print(Char),
        get_char(In, Char2),
        process_stream(Char2, In).
```

Print variable:

```prolog
| ?- X = 2, write('The value is '), write(X), write('.').
The value is 2.
X = 2 ?
yes
```

**Find a way to use the print predicates to print only successful solutions. How do they work?**



### Do

* Modify the Sudoku solver to work on six-by-six puzzles (squares are 3x2) and 9x9 puzzles.
* Make the Sudoku solver print prettier solutions.

```prolog
%% Replace _ variable so they can be printed properly
replaceUnderscores([], []).
replaceUnderscores([H|L], [H2|L2]) :-
  (\+integer(H) -> H2 = (-) ; H2 = H),
  replaceUnderscores(L, L2).

%% Format output
formatSudoku([]).
formatSudoku(Puzzle) :- formatSudoku(0, Puzzle).

formatSudoku(0, S) :-
    write('┌───────┬───────┬───────┐'), nl,
    formatSudoku(1, S).
formatSudoku(4, S) :-
    write('│───────┼───────┼───────│'), nl,
    formatSudoku(5, S).
formatSudoku(8, S) :-
    write('│───────┼───────┼───────│'), nl,
    formatSudoku(9, S).
formatSudoku(12, _) :-
    write('└───────┴───────┴───────┘'), nl.
formatSudoku(N, [C1, C2, C3, C4, C5, C6, C7, C8, C9 | S]) :-
    \+ member(N, [0, 4, 8, 12]),
    format(
      '│ ~k ~k ~k │ ~k ~k ~k │ ~k ~k ~k │~n',
      [C1, C2, C3, C4, C5, C6, C7, C8, C9]
    ),
    succ(N, N1),
    formatSudoku(N1, S).

%% Validator for each list
valid([]).
valid([Head|Tail]) :-
  fd_all_different(Head),
  valid(Tail).

sudoku(Puzzle) :-

  write('Input:'), nl,
  replaceUnderscores(Puzzle, FormattedInput),
  formatSudoku(FormattedInput),

  Solution = Puzzle,
  Puzzle = [
    S11, S12, S13, S14, S15, S16, S17, S18, S19,
    S21, S22, S23, S24, S25, S26, S27, S28, S29,
    S31, S32, S33, S34, S35, S36, S37, S38, S39,
    S41, S42, S43, S44, S45, S46, S47, S48, S49,
    S51, S52, S53, S54, S55, S56, S57, S58, S59,
    S61, S62, S63, S64, S65, S66, S67, S68, S69,
    S71, S72, S73, S74, S75, S76, S77, S78, S79,
    S81, S82, S83, S84, S85, S86, S87, S88, S89,
    S91, S92, S93, S94, S95, S96, S97, S98, S99
  ],
  fd_domain(Solution, 1, 9),

  R1 = [S11, S12, S13, S14, S15, S16, S17, S18, S19],
  R2 = [S21, S22, S23, S24, S25, S26, S27, S28, S29],
  R3 = [S31, S32, S33, S34, S35, S36, S37, S38, S39],
  R4 = [S41, S42, S43, S44, S45, S46, S47, S48, S49],
  R5 = [S51, S52, S53, S54, S55, S56, S57, S58, S59],
  R6 = [S61, S62, S63, S64, S65, S66, S67, S68, S69],
  R7 = [S71, S72, S73, S74, S75, S76, S77, S78, S79],
  R8 = [S81, S82, S83, S84, S85, S86, S87, S88, S89],
  R9 = [S91, S92, S93, S94, S95, S96, S97, S98, S99],

  C1 = [S11, S21, S31, S41, S51, S61, S71, S81, S91],
  C2 = [S12, S22, S32, S42, S52, S62, S72, S82, S92],
  C3 = [S13, S23, S33, S43, S53, S63, S73, S83, S93],
  C4 = [S14, S24, S34, S44, S54, S64, S74, S84, S94],
  C5 = [S15, S25, S35, S45, S55, S65, S75, S85, S95],
  C6 = [S16, S26, S36, S46, S56, S66, S76, S86, S96],
  C7 = [S17, S27, S37, S47, S57, S67, S77, S87, S97],
  C8 = [S18, S28, S38, S48, S58, S68, S78, S88, S98],
  C9 = [S19, S29, S39, S49, S59, S69, S79, S89, S99],

  Sq1 = [S11, S12, S13, S21, S22, S23, S31, S32, S33],
  Sq2 = [S14, S15, S16, S24, S25, S26, S34, S35, S36],
  Sq3 = [S17, S18, S19, S27, S28, S29, S37, S38, S39],
  Sq4 = [S41, S42, S43, S51, S52, S53, S61, S62, S63],
  Sq5 = [S44, S45, S46, S54, S55, S56, S64, S65, S66],
  Sq6 = [S47, S48, S49, S57, S58, S59, S67, S68, S69],
  Sq7 = [S71, S72, S73, S81, S82, S83, S91, S92, S93],
  Sq8 = [S74, S75, S76, S84, S85, S86, S94, S95, S96],
  Sq9 = [S77, S78, S79, S87, S88, S89, S97, S98, S99],

  valid([
    R1, R2, R3, R4, R5, R6, R7, R8, R9,
    C1, C2, C3, C4, C5, C6, C7, C8, C9,
    Sq1, Sq2, Sq3, Sq4, Sq5, Sq6, Sq7, Sq8, Sq9
  ]),

  write('Solution:'), nl,
  formatSudoku(Solution),

  fail.
```