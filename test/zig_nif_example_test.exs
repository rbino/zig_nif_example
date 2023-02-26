defmodule ZigNifExampleTest do
  use ExUnit.Case
  doctest ZigNifExample

  test "adds number" do
    assert ZigNifExample.add(10, 32) == 42
  end
end
