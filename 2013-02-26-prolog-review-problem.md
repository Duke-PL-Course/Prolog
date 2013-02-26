# Ruby Practice Review Problem

## Partition

Write a rule that partitions a list into 2 lists, left and right, where left contains all elements in the original list that are less than or equal to a given pivot value, and right contains all elements that are greater than the pivot value.

Signature: `partition(Left, Right, List, Pivot)`

Example:

```prolog
?- partition(L, R, [1, 2, 3], 2).

L = [1,2]
R = [3]

?- partition(L, R, [1, 2, 3, 4, 5, 6], 6).

L = [1,2,3,4,5,6]
R = []
```

## Partition with Index

Modify the solution from above to partition based on **an index** rather than a pivot value. You can also specify a base index that corresponds to the first element in the list. (i.e. 0 based or n based index)

Signature: `partitionIndex(Left, Right, List, Index, BaseIndex)`

```prolog
?- partitionIndex(L, R, [a, b, c], 1, 0).

L = [a,b]
R = [c]

?- partitionIndex(L, R, [a, b, c], 1, 1).

L = [a]
R = [b,c]
```

## Hint

* In Prolog, less than or equal to is `=<`, instead of `<=`
* Use `[H|T]` to destructure a list
* Use `append/3` to build up a list. Remember than all 3 arguments to `append/3` need to be lists, which means that you need to convert single items into lists using `[Item]`
