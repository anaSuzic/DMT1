-- Practice with Implies Logical Operator

axiom P : Prop
axiom Q : Prop

#check  P → Q

-- Show that if P is true than Q is true
def aProp (x : Nat) (h : x = 1) : (x + 1) = 2 :=
by
  rw[h] -- rewriting the goal

def aProp' (x : Nat) : (x = 1) → (x + 1 = 2) :=
fun (h : x = 1) => by -- h is the proof that x is = 1
  rw[h]

#check (aProp)
#check (aProp')
-- assume that x is a natural number and that its equal to 1.
-- same function, just a different way to write it.
