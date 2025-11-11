-- Tactics, existence, relations

-- Term mode vs. Tactic mode

example ( P Q : Prop) : P → Q → P ∧ Q :=
(
  fun p q => And.intro p q
)

-- Tactic mode proof of the same thing

example ( P Q : Prop) : P → Q → P ∧ Q := by
  intro hp hq -- introduce hypotheses
  exact (And.intro hp hq)  -- finish with exact
  apply (And.intro hp hq _)  -- alternative finish with apply, it takes a partial term

def add2 : Nat → Nat := by
  intro n
  exact(n + 2)

#eval add2 6

example (α : Type) (a b c : α) : (a = b) → (b = c) → a = c :=
by
  intro hab hbc
  rewrite [hab] -- rewrite b with a, the command rewrite can be written as rw
  rewrite [hbc] -- rewrite c with b
