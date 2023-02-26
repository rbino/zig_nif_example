# Zig NIF example

A simple example showing how to call Zig from Elixir.

`zig_src/zig_math.zig` contains the `add` function, that gets compiled to a NIF shared library using
`build.zig` and the `build_dot_zig` Mix compiler to a NIF.

Then the `ZigNifExample` module loads the NIF and allows to call it.
