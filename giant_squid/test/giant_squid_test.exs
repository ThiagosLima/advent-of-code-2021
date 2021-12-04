defmodule GiantSquidTest do
  use ExUnit.Case
  doctest GiantSquid

  test "greets the world" do
    assert GiantSquid.hello() == :world
  end
end
