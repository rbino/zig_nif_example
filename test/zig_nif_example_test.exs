defmodule ZigNifExampleTest do
  use ExUnit.Case
  doctest ZigNifExample

  test "greets the world" do
    assert ZigNifExample.hello() == :world
  end
end
