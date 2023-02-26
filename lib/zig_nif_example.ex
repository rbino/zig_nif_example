defmodule ZigNifExample do
  @moduledoc """
  Documentation for `ZigNifExample`.
  """

  @on_load :load_nif
  @nif_path "priv/#{Mix.target()}/lib/zig_math"

  def load_nif do
    path = Application.app_dir(:zig_nif_example, @nif_path)
    :erlang.load_nif(String.to_charlist(path), 0)
  end

  def add(_a, _b), do: :erlang.nif_error(:nif_not_loaded)
end
