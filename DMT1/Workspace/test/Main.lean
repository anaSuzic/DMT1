import Test

-- vtq5nn

axiom P : Prop
axiom Q: Prop
axiom R: Prop

namespace DMT1.L00_reasoning

#check P
#check Q
#check R

def PandQ : Prop := And P Q
def PandQ' : Prop := P ∧ Q

#check PandQ
#check PandQ'

def PandQ2 : Prop := PandQ ∧ PandQ
def PandQ3 : Prop := PandQ2 ∧ PandQ2
def PandQ4 : Prop := PandQ3 ∧ PandQ3

axiom p : P
axiom q : Q
axiom r : R

#check P
#check p

/- @@@
### Ordinary Program Types
- Bool : True or False
- Nat : 1, 2, 3
- String : "NAjndsfjsdfosj"

All of the ordinary data types have the type (short for type0). They
are computational types.

### Logical Reasoning Types
- P : p
- Q : q
- R : r

The propositions P, Q, R are types Prop (Propositions). While their types are
proofs, they are the values of types (p, q, r).
-/

#check 5
#check p
#check P
#check Prop
#check Type

structure Point where
(t : Type)
(x : Nat)
(y : Nat)

-- (having issues with this line) def pt : Point := (Nat, 1, 5)

#check Point
-- Point lives in type 1 because it contains something that
-- lives in type 0 (Nat)

/-
*Proof Holders (Intro Rules)*
Ex.
- And.intro

and *Proof Consumers (Elimination Rules)*
Ex.
- And.left (It takes in the proof of an and and returns the right hand proof)
- And.right

Other operators:
- OR v
- IMPLIES ->
- NOT -
- IFF (if and only if) <->

*Implies*
**If** P is **true**, **then** Q. P -> Q

x = 5 -> x+1 = 6, which is true

T -> T == T
T -> F == F
F -> T == T
F -> F == T
-/

/-
### Logical Connections

Logical Connections imply:
*Implies*

T -> T == T
T -> F == F
F -> T == T
F -> F == T

x = 5 -> x + 2 = 7
**How to prove this?**
We will assume that x = 5 (no proof), by the assumption
that x = 5 we can add 5 + 2 = 7, therefore 7 = 7 which is true.

You *assume* that there is a proof of P and *show* the proof of Q
- If P is true, Q must be true

In both cases where yhr premise is false, there is no need to think about the rest
of the proposition
- It will always be true, because the premise will not be violated

And truth table:
T -> T == T
T -> F == F
F -> T == F
F -> F == F

-/

axiom P : Prop
axiom Q : Prop

def Z : Prop := P ∧ Q → Q ∧ P

-- Proof of an implication is a function
def z : Z :=
  fun (pq : P ∧ Q) =>
  And.intro
    (pq.right)
    (pq.left)

axiom pq : P ∧ Q

#check z pq

-- Prove that P implies Q
-- \and for the and symbol

def ex : Prop := P ∧ Q
def wy : Prop := Q ∧ P
def ze : Prop := ex → wy
