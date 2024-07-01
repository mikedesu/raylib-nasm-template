# raylib x86_64 asm template

This project is an effort to create a basic x86_64 assembly template for raylib.

What exists here was built from scratch.

The goal is to offer a starting point for creating both 2D and 3D games using raylib and x86_64 assembly.

`nasm` was chosen for simplicity and compatibility with the GNU toolchain.

# Building

To build the project, you will need to have `nasm` and `gcc` installed.

To build the project, run the following command:

```
make
```

# TODO

- [ ] Overcome the hurdle to `BeginMode2D(camera)`
- [ ] Find a way to offer a "position-independent executable"

-----

