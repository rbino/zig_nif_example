# Zig NIF example

A simple example showing how to call Zig from Elixir.

`zig_src/zig_math.zig` contains the `add` function, that gets compiled to a NIF shared library using
`build.zig` and the [`build_dot_zig`](https://github.com/rbino/build_dot_zig) Mix compiler.

Then the `ZigNifExample` module loads the NIF and allows to call it.

## License

Copyright (c) 2023 Riccardo Binetti

Licensed under the Apache License, Version 2.0 (the "License"); you may not use this file except in
compliance with the License. You may obtain a copy of the License at
https://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software distributed under the License is
distributed on an "AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or
implied. See the License for the specific language governing permissions and limitations under the
License.
