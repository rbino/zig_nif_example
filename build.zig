const std = @import("std");
const process = std.process;

pub fn build(b: *std.build.Builder) void {
    // Standard release options allow the person running `zig build` to select
    // between Debug, ReleaseSafe, ReleaseFast, and ReleaseSmall.
    const mode = b.standardReleaseOptions();

    // Get ERTS_INCLUDE_DIR from env, which should be passed by :build_dot_zig
    const erts_include_dir = process.getEnvVarOwned(b.allocator, "ERTS_INCLUDE_DIR") catch blk: {
        // Fallback to extracting it from the erlang shell so we can also execute zig build manually
        const argv = [_][]const u8{
            "erl",
            "-eval",
            "io:format(\"~s\", [lists:concat([code:root_dir(), \"/erts-\", erlang:system_info(version), \"/include\"])])",
            "-s",
            "init",
            "stop",
            "-noshell",
        };

        break :blk b.exec(&argv) catch @panic("Cannot find ERTS include dir");
    };
    defer b.allocator.free(erts_include_dir);

    const lib = b.addSharedLibrary("zig_math", "zig_src/zig_math.zig", .unversioned);
    lib.addSystemIncludePath(erts_include_dir);
    lib.linkLibC();
    lib.setBuildMode(mode);

    // Do this so `lib` doesn't get prepended to the lib name, see https://github.com/ziglang/zig/issues/2231
    const install = b.addInstallLibFile(lib.getOutputLibSource(), "zig_math.so");
    install.step.dependOn(&lib.step);
    b.getInstallStep().dependOn(&install.step);

    const main_tests = b.addTest("zig_src/zig_math.zig");
    main_tests.setBuildMode(mode);

    const test_step = b.step("test", "Run library tests");
    test_step.dependOn(&main_tests.step);
}
