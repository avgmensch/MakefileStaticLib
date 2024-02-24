# Makefile for static library

This is a demo project for building a C project with a Makefile and linking a static library.

File | Purpose
-|-
[root](Makefile) | Compile the root-project and link with `lib/libfoo`.
[libfoo](lib/libfoo/Makefile) | Compile `libfoo` and expose a static library and header-file.