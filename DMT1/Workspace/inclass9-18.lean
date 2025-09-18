/-
The way to introduce a new definition of a function,
say of type S => T, where S and T are arbitrary types,
you write a program that takes and (s : S) as an input
and that always returns some result, (t : T)
-/

-- function type clear, explicit "fun/λ" expression gives value
def myAdd : Nat -> Nat -> Nat :=
  -- left side binds names to arguments for use on the right side
  -- we can also say "let n1 and n2 be arbitrary"
  fun (n1 n2 : Nat) => n1 + n2

-- function application definition
#eval myAdd 3 4

-- Prefered method of writing functions (pattern matching notation)
def myAdd' : Nat -> Nat -> Nat
| n1, n2 => n1 + n2

-- function application definition
#eval myAdd' 5 5

def myAdd'' (n1 n2 : Nat) : Nat :=
  n1 + n2

-- function application definition
#eval myAdd'' 5 7


def myAdd''' : (n1 : Nat) -> (n2 : Nat) -> Nat :=
  fun n1 n2 => n1 + n2

-- function application definition
#eval myAdd''' 8 9

-- All of the functions above do the same thing

-- We can also define other things:
def n3 : Nat := myAdd 1 2
#eval n3

/-
## Partial Evaluation
Takes a defined function and sets one of the function
inputs to whatever you wish, meaning you have
one less parameter to worry about.
-/

def add1 : Nat -> Nat := myAdd 1
#check add1
#eval add1 2
#eval add1 6

def add10 : Nat -> Nat := myAdd 10
#check add1
#eval add10 2
#eval add10 6

-- Functions such as this are right associative

/-
Additionally if a function takes S, T, U, V, W
and we apply

Function application is left associative: it takes
multiple arguments and takes more arguments after it runs.
(f s) t u v
((f s) t ) u v
(((f s) t) u) v
((((f s) t) u) v)
-/

-- The arrow is right associative
def ifThenElse : Bool -> Bool -> Bool -> Bool
| b1, b2, b3 => if b1 then b2 else b3

#eval ifThenElse true false true
#eval ifThenElse true true false

-- The result is the type of the fucntion
#check ifThenElse
#check ifThenElse true
#check ifThenElse true false
#check ifThenElse false false true


/-
## Type Inference

Giving explicit type judgments makes the code hard to
read and is a pain to implement. Type Inference can fill
in type information if it can tell the type of an object.
-/


-- def newAdd := fun n1 n2 => n1 + n2 (Bad)

def newAdd := fun n1 n2 => (n1 + n2 : Nat)

/-
The little piece of type information allows lean
to determine the type of n1, n2.also it knows that
the '+' sign requires the same types on each end of the sign.
-/

def newAdd' := fun (n1 : Nat) n2 => n1 + n2

#check newAdd
#check newAdd'


-- Implicit Arguments

def weird (α : Type) (a : α) : Bool := true

#eval weird Nat 3
#eval weird String "yay"
#eval weird Bool false

def strange {α : Type} (a : α) : Bool := true

#eval strange 3
#eval strange "Boo"
#eval strange false


/-
Inductive Bool : Type Where

false : Bool
true : Bool

-/

def myNeg (b : Bool) : Bool :=
match b with
| true => false
| false => true

#eval myNeg false

#check Or

/-
inductive Or (a b : Prop) : Prop where
  /-- `Or.inl` is "left injection" into an `Or`. If `h : a` then `Or.inl h : a ∨ b`. -/
  | inl (h : a) : Or a b
  /-- `Or.inr` is "right injection" into an `Or`. If `h : b` then `Or.inr h : a ∨ b`. -/
  | inr (h : b) : Or a b
-/
