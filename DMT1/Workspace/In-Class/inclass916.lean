#check And
#check Prod


-- Defining a namespace so that the structure And does not interfere
-- with the defined #check And.
namespace MyAnd

structure And (a b : Prop) : Prop where
  /-- `And.intro : a → b → a ∧ b` is the constructor for the And operation. -/
  intro ::
  /-- Extract the left conjunct from a conjunction. `h : a ∧ b` then
  `h.left`, also notated as `h.1`, is a proof of `a`. -/
  left : a
  /-- Extract the right conjunct from a conjunction. `h : a ∧ b` then
  `h.right`, also notated as `h.2`, is a proof of `b`. -/
  right : b

axiom P : Prop
axiom Q : Prop

def aProof : And P Q := And.intro
-- defining aProof to be a value of type and P Q (And P Q is a type)

#check And.left aProof
#check And.right aProof

end MyAnd

namespace MyProd

structure Prod (α : Type u) (β : Type v) where
  /--
  Constructs a pair. This is usually written `(x, y)` instead of `Prod.mk x y`.
  -/
  mk ::
  /-- The first element of a pair. -/
  fst : α
  /-- The second element of a pair. -/
  snd : β

#check (Prod)
#check Prod Bool String

def aProd : Prod Bool String := Prod.mk true "I love this stuff."

#eval aProd

#check Prod.mk

#eval Prod.fst aProd
#eval Prod.snd aProd

end MyProd

/-
Curry Howard Isomorphism:

It states that formal proofs and computer programs are
fundamentally the same kind of mathematical object.
Specifically, it establishes a direct relationship:

- Propositions (statements that can be proven true or false)
correspond to types in a programming language.

- Proofs of those propositions correspond to programs that
have that specific type.

In essence, proving a theorem is equivalent to writing a program,
and the structure of the proof directly mirrors the structure of
the program. If a proposition is provable, then its corresponding type
is inhabited (a program of that type exists). If a proposition
is unprovable, its corresponding type is empty, meaning no program
can be written that has that type.

-/

namespace MyFuncs

def S : Type := String
def T : Type := Bool

#check S
#check T

#check  S -> T

-- If a function takes S and outputs T, the function takes any
-- string and outputs a bool

-- Defining a function
def aFunc_f : String -> Bool :=
  fun(s : String) => false

def aFunc_t : String -> Bool :=
  fun(s : String) => true

def x : Nat := 3
def y : Nat := 5

#check ∀ (s : S), T -- forall proposition

def aFunc3 : ∀ (s : String), Bool := λ (s : String) => false

end MyFuncs

namespace MyOr

#check Bool

inductive Bool : Type where
  | false : Bool
  | true : Bool

def b1 : Bool := Bool.true
def b2 : Bool := Bool.false

#check Or

axiom P : Prop
axiom Q : Prop
axiom p : P

#check Or P Q

theorem pfPorQ : P ∨ Q := Or.inl p

--theorem pfPorQ2 : P ∨ Q := _ _

axiom q : Q

theorem pfPorQ2' : P ∨ Q := Or.inr q

inductive Or (a b : Prop) : Prop where
  /-- `Or.inl` is "left injection" into an `Or`. If `h : a` then `Or.inl h : a ∨ b`. -/
  | inl (h : a) : Or a b
  /-- `Or.inr` is "right injection" into an `Or`. If `h : b` then `Or.inr h : a ∨ b`. -/
  | inr (h : b) : Or a b


def zeqz : 0 = 0 := rfl -- rfl automatically get the proof of something equivalent

end MyOr

theorem aThm : 0 = 0 ∨ 0 = 1 :=
  let pfZeZ : 0 = 0 := rfl
  Or.inl pfZeZ

/-
Prop                           Type
--------------------------------------
  And PG <-------------------> Prod S T
  P -> Q <-------------------> S -> T
∀(p,P),Q <-------------------> S -> T
  Or P Q <-------------------> Sum S T
-/
