-- prove ∧ is associative in general
-- show that ∧ is commutative

axiom P : Prop
axiom Q : Prop
axiom R : Prop

theorem proofAndAssoc : P ∧ (Q ∧ R) ↔ (P ∧ Q) ∧ R :=
  Iff.intro
    -- forward direction
    (fun (h : P ∧ (Q ∧ R)) =>
      let p := h.left
      let q := h.right.left
      let r := h.right.right
      And.intro (And.intro p q) r
    )
    -- backward direction
    (fun (h : (P ∧ Q) ∧ R) =>
      let pq := h.left
      let r := h.right
      let p := pq.left
      let q := pq.right
      And.intro p (And.intro q r)
    )
