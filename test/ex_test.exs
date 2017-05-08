defmodule ExTest do
  use ExUnit.Case
  doctest Ex

  test "add" do
    assert Ex.add(1, 1) == 2
  end
end
