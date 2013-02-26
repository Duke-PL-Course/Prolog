# Prolog Assignment

All skeleton files are provided in the `assignments` folder. Please fork this repo to get started. For what forking means or how to fork a repo, please visit [this github help page][help] for a detailed explanation.

Again, please feel free to post questions on [github Issues page][issues] for the repo.

---

## Q1: Flatten a Nested List Structure (33%)

Transform a list, possibly holding lists as elements into a 'flat' list by replacing each list with its elements (recursively).

Example:

```prolog
?- flattenList(L, [a, [b, [c, d], e]]).
L = [a, b, c, d, e]

?- flattenList(L, [1, [1, 2], [3, 4], [5, [6, [7, 8]]]]).
L = [1,1,2,3,4,5,6,7,8]

?- flattenList(L, [[[[9, 10], 11], 12], [1, 2], [3, 4], [5, [6, [7, 8]]]]).
L = [9,10,11,12,1,2,3,4,5,6,7,8]

?- flattenList([1, 2, 3], [1, [2, 3]]).
true
```

### Hint

* Establish the base case for recursion first and build up the logic
* Don't call your rule `flatten/2`, since it's a predefined predicate
* Use `[H|T]` to destruct a list in to the head and tail
* Use the predefined predicates `is_list/1` and `append/3`

---

## Q2: Duplicate the elements of a list (33%)

Produce a list that contains 2 copies of every element in the original list in order.

Example:
```prolog
?- duplicate(L, [1, 2, a, b]).
L = [1,1,2,2,a,a,b,b]

?- duplicate([1,1,2,2,a,a,b,b], [1, 2, a, b]).
true

?- duplicate([1,1,2,2,a,a,b,b], L).
L = [1,2,a,b]
```

### Hint

* Establish the base case for recursion first and build up the logic
* Use `[H|T]` to destruct a list in to the head and tail
* Use the predefined predicate `append/3`

---

## Q2.5: Duplicate the elements of a list N times [Optional]

If you are feeling ambitious, you can write a more generalized version of the function that allows you to specify how many copies of each element you want in the duplicate list.

Example:
```prolog
?- duplicateN(L, [1, 2, a, b], 3).
L = [1,1,1,2,2,2,a,a,a,b,b,b]

?- duplicateN([1,1,1,2,2,2,a,a,a,b,b,b], [1, 2, a, b], 3).
true

?- duplicateN([1,1,1,2,2,2,a,a,a,b,b,b], L, 3).
L = [1,2,a,b]
```

### Hint

* Aside from the same hints above, you should define a rule that appends `N` copies on an item to a list. Something like `prependN(NewList, N, List, Item)`

---

## Q3: Truth tables for logical expressions. (33%)

Define predicates `and/2`, `or/2`, `nand/2`, `nor/2`, `xor/2`, and `equ/2` (for logical equivalence) which succeed or fail according to the result of their respective operations; e.g. `and(A,B)` will succeed, if and only if both `A` and `B` succeed. Note that `A` and `B` can be Prolog goals (not only the constants `true` and `fail`).

A logical expression in two variables can then be written in prefix notation, as in the following example: `and(or(A,B),nand(A,B))`.

Now, write a predicate `table/3` which produces the truth table of a given logical expression in two variables.

Example:

```prolog
?- table(A, B, and(A, B)).
A = true
B = true

?- table(A, B, and(or(A,B),nand(A,B))).

A = true
B = false

A = false
B = true

?- table(A, B, or(and(or(A,B),nand(A,B)), or(nor(A, B), xor(A, B)))).

A = true
B = false

A = true
B = false

A = false
B = true

A = false
B = true

A = false
B = false

%% Same Example as above, except we now restrict A to false
?- A = false, table(A, B, or(and(or(A,B),nand(A,B)), or(nor(A, B), xor(A, B)))).

A = false
B = true

A = false
B = true

A = false
B = false
```

### Hint

* the `bind/1` rule defines the domain for A and B. In this case, we restrict both `A` and `B` to boolean values of `true` and `false`.

* Remember from lecture that `.` in Prolog is equivalent to a logical or and `,` is equivalent to a logical and. So `bind(A)` specifies that `A` can be `true` **or** `false`

---


## [Bonus] Degree of a Node in a Graph (50%)

Write a predicate `degree(Deg, Node, Graph)` that determines the degree, or the number of outgoing edges, of a given node.

`Graph` is a tuple of `(Vertices, Edges)`, where `Vertices` is a **list** of *atoms* that represent vertices in the graph, and `Edges` is a **list** of *tuples* of **2 atoms** that specify a directed edge.

Example:
```prolog
?- degree(N, a, ([a, b, c, d], [(a, b), (b, c), (c, d), (d, a), (a, c), (b, d)])).
N = 2
```

The query asks what's the degree of atom `a`, in the graph that contains 4 nodes (`a`, `b`, `c`, `d`), and 6 directed edges (`a -> b`, `b -> c`, `c -> d`, `d -> a`, `a -> c`, `b -> d`)

In this case the `a` has 2 outgoing edges, `a -> b` and `a -> c`, so the answer should be 2.

Alteratively, you can also ask which nodes have a specific degree.

```prolog
degree(2, N, ([a, b, c, d], [(a, b), (b, c), (c, d), (d, a), (a, c), (b, d)])).

N = a

N = b

degree(1, N, ([a, b, c, d], [(a, b), (b, c), (c, d), (d, a), (a, c), (b, d)])).

N = c

N = d
```

### Hint

* Establish the base case for recursion first and build up the logic
* Use `degree(N, Node, (Vertices, [(V1, V2)|Edges]))` to deconstruct the arguments into variables you can use
* Use `member(N, List)` predicate to check to see if `Node` is a valid vertex
* Use `is` predicate to compute the degree, as we did in the lecture when [computing the sums and averages of lists][listmath]

<!-- links -->

[help]: https://help.github.com/articles/fork-a-repo
[issues]: https://github.com/Duke-PL-Course/Prolog/issues?state=open
[listmath]: http://duke-pl-course.github.com/slides/prolog.html#35