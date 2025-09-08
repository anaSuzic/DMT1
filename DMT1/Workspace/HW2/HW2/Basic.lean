-- vtq5nn

axiom P : Prop
axiom Q : Prop

/-
If P ∧ Q, then we can conclude that
Q ∧ P.

Example:
-/

example (pq : P ∧ Q) : Q ∧ P :=
⟨pq.right, pq.left⟩

/-
If we know P ∧ Q, then we can conclude P

Example:
-/

example (p_left : P ∧ Q) : P :=
p_left.left
