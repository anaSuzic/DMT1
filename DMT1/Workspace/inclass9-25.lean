/-
Define a function called apply0
- assume something because I cannot read my professors handwriting
-/

def zero {α : Type} : (α -> α) -> (a : α) -> α
| f, a => a

def one {α : Type} : (α -> α) -> (a : α)  -> α
| f, a => (f a)

def two {α : Type} : (α -> α) -> (a : α)  -> α
| f, a => (f (f a))


def three {α : Type} : (α -> α) -> (a : α)  -> α
| f, a => (f (f (f a)))

#check three
#check(@three Nat)

-- Function composition: Take two functions and make a new one.
#reduce ((@two Nat) ∘ (@three Nat))

def inc (n : Nat) := n + 1
#eval two inc 8

#eval two inc 0
#eval three inc 0
#eval three inc (two inc 0)


def four {α : Type} : (α -> α) -> (a : α)  -> α
| f, a => (f (f (f (f a))))

#eval four inc (three inc 0)

def whatIsThis := ((@three Nat) ∘ (@four Nat))
#reduce whatIsThis

/-
Representing natural numbers as
iterated function application, and addition
then as composition of these functions.
-/
