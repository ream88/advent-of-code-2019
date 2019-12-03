defmodule D02Test do
  use ExUnit.Case
  doctest D02

  test "example" do
    input = [1, 9, 10, 3, 2, 3, 11, 0, 99, 30, 40, 50]
    output = [3500, 9, 10, 70, 2, 3, 11, 0, 99, 30, 40, 50]

    assert D02.solve(input) == output
  end

  test "solve" do
    assert D02.solve([1, 0, 0, 0, 99]) == [2, 0, 0, 0, 99]
    assert D02.solve([2, 3, 0, 3, 99]) == [2, 3, 0, 6, 99]
    assert D02.solve([2, 4, 4, 5, 99, 0]) == [2, 4, 4, 5, 99, 9801]
    assert D02.solve([1, 1, 1, 4, 99, 5, 6, 0, 99]) == [30, 1, 1, 4, 2, 5, 6, 0, 99]
  end
end
