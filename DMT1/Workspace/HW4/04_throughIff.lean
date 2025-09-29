/- @@@
#1. Suppose P and Q are any propositions.

#1.A: State and prove the conjecture that,
*and* implies *equivalence*. In other words,
if for any propositions, X and Y, X ∧ Y is
true, then it must be that X ↔ Y is as well.
Call your theorem andImpEquiv.
@@@ -/

theorem andImpEquiv {X Y : Prop} : X ∧ Y → (X ↔ Y) := by
  intro h
  apply Iff.intro
  · intro _x
    exact h.right
  · intro _y
    exact h.left


/- @@@
#2: Give the proof in #1 in English. To do this,
just explain clearly what assumptions you make or
use at each step and what inference rules you use
to make progress at each step. We get you started:

Use the implication introduction and assume that X ∧ Y,
calling that assumption "proof".

From proof = X ∧ Y we can use conjunction to obtain the
proof.left : X and proof.right : Y

To prove equivalence, we have to prove that
X -> Y and Y -> X.

We get the arbitrary proof from
λ proof => ⟨(λ (_ : X) => proof.right), (λ (_ : Y) => proof.left)⟩.
This gives X -> Y and Y -> X.

Proof: To prove this *implication* we'll use the
introduction rule for →. So *assume* the premise
is true. What remains to be proved is that, in this
context,  and we will then show that, in that
context, the conclusion must be true as well. So
assume P ∧ Q is true. The conclusion to be proved
is an equivalence. To prove an equivalence we need
to prove both ...
@@@ -/


/- @@@
#3: Use axiom declarations to represent this world.

- X is a proposition
- Y is a proposition
- X ∧ Y is true

Once you've done that, in a #check command, apply
the general theorem we just proved to prove that X
is equivalent to Y.

Do not just copy the proof. The whole point is to
reinforce the idea that one you've proved a theorem
you can use it (by applying it) to prove any special
case (here involving X and Y) of the general claim.
@@@ -/

variable (X Y : Prop)
variable (proof : X ∧ Y)

#check andImpEquiv proof
-- This shows that the proof is used to obtain  a proof of X ↔ Y

/- @@@
#4: Something About False

Recall from class discussion that the proposition,
in Lean, called False, has no proofs at all. That
is what makes it false. Assuming that there is one
assumes something that's impossible. The crucial
conclusion to draw is *not* that the impossible is
suddenly possible, but that the *assumption* itself
must be wrong. Therefore, if at any point in trying
to prove something we can derive a proof of False,
that means we're in a situation that can't actually
happen. So we really don't have to finish the proof!

For example, suppose  K is some unknown proposition.
When we say that (False → K) is true, we are *not*
saying that *K* is true; we're saying that once you
assume or can derive a proof of False, you know you
are in a case that can never happen, so you can just
"bail out" and not worry about constructing a proof
of K, no matter what proposition it is. The keyword
*nomatch* in Lean applied to any proof of false does
exactly bail one of of an impossible case.

Here's a formal proof of it. We assume K is any
proposition, then we prove False → K. To prove
this implication, we assume we're given f, a proof
of false. In any other situation, for *exFalsoK*
to be defined, we'd *have to* return some value of
type K. Here we don't even know what that type is.
And yet the function is well-defined, and as such
*proves* the implication, *False → K*. The trick
of course, is that as soon as we have a proof of
false in (or derivable given) our context, then we
can *bail out* and Lean will accept the definition.
Lean's *nomatch* contruct will bail you out as long
as it's applied to a proof of false, which is the
evidence Lean needs to know it's ok to accept the
definition.
@@@ -/

def exFalsoK {K : Prop} : False → K := by
  intro f
  cases f

/- @@@
Why is it safe to accept tihs definition? What do we
know that's special about *exFalsoK* that makes it ok?

False is a proposition that has no proofs. It never actually
needs to be run on a real value because there are no inputs
of the type False. because f : False can never exist, the function
will never be called in any real context, so defining
it is harmless.


@@@ -/


/- @@@
#5 In Lean, state and prove the proposition that is
P and Q are aribtrary propositions, then False *and*
P implies Q.
@@@-/

theorem falseAndImpliesAny (P Q : Prop) : False ∧ P → Q := by
  intro h
  cases h with
  | intro f _p => cases f

/- @@@
Write a short paragraph stating the proposition to be
proved and the proof of it -- in English.
@@@ -/

/-
Assume False ∧ P, from this we get a proof of false.
Once we have the proof of False, we are in an impossible
context, from False we can derive any prop Q by ex-falso.
Therefore, False ∧ P implies Q for any P and Q.
-/

/- @@@
#6 State and prove the proposition that False → False.
Give both formal and English (natural language) proofs.
@@@ -/

theorem falseImpFalse : False → False := by
  intro f
  exact f

/-
To prove False -> False, assume a proof f : False.
Return the same proof f. This is a function from False
to False, because False has no proofs, the function is
never given a input, but it is a valid function.
-/
