epilog-ruby
===========

A prototype of an inferrence engine written in Ruby.  The pipe dream for this project is to translate the algorithms into C for cross-environment compatability.

= Road Map

Statements are written in Prolog notation.

| Version		| Statement  | Notes																						|
|-----------|------------|--------------------------------------------------|
| 0.0.1			|  'a' = 'a' | Equality check if two instaniated tersm are true	|
| 0.0.2			|  Var = 'v' | Binding the left variable												|
| 0.0.3			|  'r' = Var | Binding the right variable												|
| 0.0.4		  |	V = X, X = 'c' | Ensure V is bound to 'c'										  |
| 0.0.5		  | member( A, [ 1, 2, 3 ]) | Must provide all solutions to A		  |
| 0.0.6		  | member( A, [ 1, 2, 3 ]), A =!= 2 | Backtracking working as expected |

More to follow!

