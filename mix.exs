defmodule ZigNifExample.MixProject do
  use Mix.Project

  def project do
    [
      app: :zig_nif_example,
      version: "0.1.0",
      elixir: "~> 1.14",
      start_permanent: Mix.env() == :prod,
      compilers: [:build_dot_zig] ++ Mix.compilers(),
      deps: deps()
    ]
  end

  # Run "mix help compile.app" to learn about applications.
  def application do
    [
      extra_applications: [:logger]
    ]
  end

  # Run "mix help deps" to learn about dependencies.
  defp deps do
    [
      {:build_dot_zig, "~> 0.1.0", runtime: false}
    ]
  end
end
