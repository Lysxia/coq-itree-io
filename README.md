# Run interaction trees in IO

[![CircleCI][circleci-shield]][circleci-link]

Interpret [`itree`][itree] in the `IO` monad of [*simple-io*][io].

[itree]: https://github.com/DeepSpec/InteractionTrees
[io]: https://github.com/Lysxia/coq-simple-io

[circleci-shield]: https://circleci.com/gh/Lysxia/coq-itree-io.svg?style=svg
[circleci-link]:   https://circleci.com/gh/Lysxia/coq-itree-io

## Overview

```coq
From ITreeIO Require Import ITreeIO.

(* Provides the following function (and a few other variants) *)
Parameter interp_io : forall E : Type -> Type, (E ~> IO) -> (itree E ~> IO).
Arguments interp_io {E} h [T] t.
```
