defmodule D03Test do
  use ExUnit.Case
  doctest D03

  test "example for shortest distance" do
    wire1 = D03.move([{0, 0}], "R8,U5,L5,D3")
    wire2 = D03.move([{0, 0}], "U7,R6,D4,L4")
    assert D03.shortest_distance(D03.intersections(wire1, wire2)) == 6
  end

  test "reverted example for shortest distance" do
    wire1 = D03.move([{0, 0}], "L8,D5,R5,U3")
    wire2 = D03.move([{0, 0}], "D7,L6,U4,R4")
    assert D03.shortest_distance(D03.intersections(wire1, wire2)) == 6
  end

  test "shortest_distance" do
    wire1 = D03.move([{0, 0}], "R75,D30,R83,U83,L12,D49,R71,U7,L72")
    wire2 = D03.move([{0, 0}], "U62,R66,U55,R34,D71,R55,D58,R83")
    assert D03.shortest_distance(D03.intersections(wire1, wire2)) == 159

    wire1 = D03.move([{0, 0}], "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51")
    wire2 = D03.move([{0, 0}], "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7")
    assert D03.shortest_distance(D03.intersections(wire1, wire2)) == 135
  end

  test "example for quickest distance" do
    wire1 = D03.move([{0, 0}], "R8,U5,L5,D3")
    wire2 = D03.move([{0, 0}], "U7,R6,D4,L4")

    assert D03.quickest_distance(D03.intersections(wire1, wire2), wire1, wire2) == 30
  end

  test "quickest_distance" do
    wire1 = D03.move([{0, 0}], "R75,D30,R83,U83,L12,D49,R71,U7,L72")
    wire2 = D03.move([{0, 0}], "U62,R66,U55,R34,D71,R55,D58,R83")
    assert D03.quickest_distance(D03.intersections(wire1, wire2), wire1, wire2) == 610

    wire1 = D03.move([{0, 0}], "R98,U47,R26,D63,R33,U87,L62,D20,R33,U53,R51")
    wire2 = D03.move([{0, 0}], "U98,R91,D20,R16,D67,R40,U7,R15,U6,R7")
    assert D03.quickest_distance(D03.intersections(wire1, wire2), wire1, wire2) == 410
  end
end
