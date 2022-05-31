From ITree Require Import ITree.
From SimpleIO Require Import SimpleIO.

#[global]
Instance MonadIter_IO : MonadIter IO :=
  fun _ _ f =>
    IO.fix_io (fun self x =>
      IO.bind (f x) (fun y =>
      match y with
      | inl x' => self x'
      | inr r => IO.ret r
      end)).

(** Interpret [itree E] into [IO] given an interpreter of [E].
    This is literally a specialization of [interp]. *)
Definition interp_io {E} : (E ~> IO) -> (itree E ~> IO) :=
  interp.
Arguments interp_io {E} h [T] t.

(** Interpret [itree IO] into [IO]. *)
Definition interp_io' : itree IO ~> IO :=
  interp (E := IO) (M := IO) (fun T (e : IO T) => e).
Arguments interp_io' [T] t.

(** Interpret [itree void1] into [IO]. *)
Definition interp_io_ : itree void1 ~> IO :=
  interp (M := IO) (elim_void1 (E := IO)).
Arguments interp_io_ [T] t.
