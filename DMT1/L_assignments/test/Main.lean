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
F -> F == F
-/


