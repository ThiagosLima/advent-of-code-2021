defmodule LanternfishTest do
  use ExUnit.Case
  doctest Lanternfish

  test "greets the world" do
    assert Lanternfish.hello() == :world
  end
end
