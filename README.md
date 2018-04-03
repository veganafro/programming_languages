# Summary

These are all the course materials I created while learning about programming language.s Happy winter break.

## Section 1

This addition was made using Emacs. I'm typically a Vim person, but new year new text editor?

#### Shadowing

There is no assignment in SML, but a variable name can be bound multiple times.
When looking up a variable, the latest binding in the current scope is used.
Any previous bindings are said to be shadowed.
	* A similar shadowing effect occurs in other languages like Java.

```sml
val x = "derp";
(*
 * This is allowed.
 * Another binding is added that shadows the previous binding for later declarations
 *)
```