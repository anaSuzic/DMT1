theorem por {P : Prop} : (P ∨ False) ↔ P :=
(
  Iff.intro
  (
    fun porf =>
  )
  (
    match with porf
    | Or.inl p =>
    | Or.inr =>
  )
  (
    fun (p : P) => Or.inl p
  )
)

axiom X : Prop
axiom Y : Prop

namespace foo

inductive Dool where
| troo
| felse

def neg : Dool -> Dool
| troo => felse
| felse => troo

inductive myNat : Type where
| zero : myNat
| succ (n : Nat) : myNat

open myNat

def three : myNat := succ (succ (succ zero))

#check bool

end foo

def myNag : Bool -> Bool
| true => false
| false => true

#check Unit

def unittounit : Unit -> Unit := fun u => u

inductive Lonely where

#check Empty

def et2 (α : Type): Empty -> α :=
  fun e : Empty => nomatch e

def exfalso (P : Prop): False -> P :=
  fun e : False => nomatch e
