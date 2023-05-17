# Run interaction trees in IO

[![Docker CI][docker-action-shield]][docker-action-link]

Interpret [`itree`][itree] in the `IO` monad of [*simple-io*][io].

[itree]: https://github.com/DeepSpec/InteractionTrees
[io]: https://github.com/Lysxia/coq-simple-io

[docker-action-shield]: https://github.com/Lysxia/coq-itree-io/workflows/Docker%20CI/badge.svg?branch=master
[docker-action-link]: https://github.com/Lysxia/coq-itree-io/actions?query=workflow:"Docker%20CI"

## Overview

```coq
From ITreeIO Require Import ITreeIO.

(* Provides the following function (and a few other variants) *)
Parameter interp_io : forall E : Type -> Type, (E ~> IO) -> (itree E ~> IO).
Arguments interp_io {E} h [T] t.
```
