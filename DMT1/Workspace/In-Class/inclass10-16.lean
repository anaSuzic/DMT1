
example { P Q : Prop } : ¬(P ∧ Q) → ¬ P ∨ ¬ Q :=
(
  fun ( h: ¬(P ⋀ Q)) => _
)

axiom em : ∀ P : Prop, P ∨ ¬P

example { P Q : Prop } : ¬(P ∧ Q) → ¬P ∨ ¬Q :=
(
  fun (h : ¬(P ∨ Q)) =>
  let pornp := em P
  match pornp with
  | Or.inl p => match (em Q) with
    | Or.inl q => False.elim (h (And.intro p q))
    | Or.inr np => Or.inr np
  | Or.inr np => Or.inl np
)
