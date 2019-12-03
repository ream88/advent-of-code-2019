defmodule D01Test do
  use ExUnit.Case
  doctest D01

  test "fuel" do
    assert D01.fuel(14) == 2
    assert D01.fuel(1969) == 966
    assert D01.fuel(100_756) == 50346
  end
end
