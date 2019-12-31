% To load the functions in this file, run `swipl assignment.pl` or from inside
% the swipl repl, run `['assignment.pl'].`.

% :- initialization hello_world, halt.

hello_world :- write('Hello, world!'), nl.

% Finds the length of a list and puts the result in variable `X`.
list_len([], 0).
list_len([_|T], X) :- list_len(T, Y), X is Y + 1.

% Finds the max of two numbers
max(X, Y, Max) :- X >= Y, Max is X.
max(X, Y, Max) :- X < Y, Max is Y.

% Finds the maximum number in a list
list_max([X], X).
list_max([H|T], Result) :- list_max(T, Y), max(H, Y, Result).

% Finds the last element in a list
list_last([X], X).
list_last([_|T], Result) :- list_last(T, Result).

% Finds the sum of a list
list_sum([], 0).
list_sum([H|T], Result) :- list_sum(T, Y), Result is Y + H.

% Finds the Kth element of the list
list_at([X|_], 0, X).
list_at([_|T], K, Result) :- Y is K - 1, list_at(T, Y, Result).

% Reverses the list
list_reverse([], []).
list_reverse([H|T], Result) :- list_reverse(T, R1), append(R1, [H], Result).

% Counts the number of positive numbers in a list
list_pcnt([], 0).
list_pcnt([H|T], Result) :- H > 0, list_pcnt(T, R1), Result is R1 + 1.
list_pcnt([H|T], Result) :- H < 0, list_pcnt(T, Result).

% Counts the number of negative numbers in a list
list_ncnt([], 0).
list_ncnt([H|T], Result) :- H < 0, list_ncnt(T, R1), Result is R1 + 1.
list_ncnt([H|T], Result) :- H > 0, list_ncnt(T, Result).

% Counts the number of positive and negative numbers in the list
list_npcnt(X, PCnt, NCnt) :- list_pcnt(X, PCnt), list_ncnt(X, NCnt).

% Finds the factorial of a number
factorial(0, 1).
factorial(X, Result) :- Y is X - 1, factorial(Y, Z), Result is X * Z.

% Finds the Kth element of the Fibonacci series.
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(K, Result) :-
    K >= 2, Y is K - 1, Z is K - 2, fibonacci(Y, R1), fibonacci(Z, R2),
    Result is R1 + R2.

% Finds the sum of the fibonacci sequence upto and including the Kth element
fibonacci_sum(0, 0).
fibonacci_sum(X, Result) :-
    X > 0, Y is X - 1, fibonacci_sum(Y, R1), fibonacci(X, R2),
    Result is R1 + R2.
