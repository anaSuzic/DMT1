/-
H: I am hungry
M: I have money
S: I can buy a sandwich

Being hungry and having money does
not necessarily mean we can get a
sandwich.

H ∧ M → S

This can be done with a function:
Takes in a type and returns another
type.

The function type would be H -> M -> S
function (nth h m): s
(H ∧ M) -> ( H -> M -> S) -> S

-/

theorem hungry (H M S : Prop) : ( H ∧ M ) -> (H -> M -> S) -> S :=
  (
    fun (hm : H ∧ M) =>
      fun (hms : H → M → S) =>
        (
          -- the proof of s
          hms (hm.left) (hm.right)
        )
  )

-- How to use the proof of an OR do to the same thing above
/-
theorem xyz (C M B : Prop) : (C ∨ M) -> (C -> B) -> (M -> B) -> B :=
  (
    corm (cb mb) =>
  )
-/


theorem orComm (P Q : Prop) : (P ∨ Q) ↔ (Q ∨ P) :=
(
  Iff.intro
  -- forward
  (
    fun porq => 
  )
  -- backward
  (

  )
)
