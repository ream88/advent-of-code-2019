defmodule D03 do
  def part1() do
    [wire1, wire2] = load_wires()

    intersections(wire1, wire2)
    |> shortest_distance()
    |> IO.inspect(label: "Shortest distance")
  end

  def part2() do
    [wire1, wire2] = load_wires()

    intersections(wire1, wire2)
    |> quickest_distance(wire1, wire2)
    |> IO.inspect(label: "Quickest distance")
  end

  defp load_wires() do
    {:ok, file} =
      Path.join(__ENV__.file, "../../input")
      |> Path.expand()
      |> File.read()

    [wire1, wire2] = String.split(file)

    wire1 = move([{0, 0}], wire1)
    wire2 = move([{0, 0}], wire2)

    [wire1, wire2]
  end

  def intersections(wire1, wire2) do
    wire1
    |> Enum.filter(fn point -> point in wire2 end)
    |> Enum.drop(1)
  end

  def shortest_distance(points) do
    points
    |> Enum.map(fn {x, y} -> abs(x) + abs(y) end)
    |> Enum.min()
  end

  def quickest_distance(points, wire1, wire2) do
    points
    |> Enum.map(fn point -> quickest_path(wire1, point) + quickest_path(wire2, point) end)
    |> Enum.min()
  end

  defp quickest_path(wire, point) do
    Enum.find_index(wire, &(&1 == point))
  end

  def move(panel, instructions) when is_binary(instructions) do
    move(panel, String.split(instructions, ","))
  end

  def move(panel, instructions) when is_list(instructions) do
    Enum.reduce(instructions, panel, &move_one(&2, &1))
  end

  defp move_one(panel, instruction) do
    {direction, length} = String.split_at(instruction, 1)
    length = String.to_integer(length)

    panel = Enum.reverse(panel)
    [{x, y} | _] = panel

    case direction do
      "R" ->
        Range.new(x + 1, x + length)
        |> Enum.reduce(panel, fn x, panel -> [{x, y} | panel] end)
        |> Enum.reverse()

      "U" ->
        Range.new(y + 1, y + length)
        |> Enum.reduce(panel, fn y, panel -> [{x, y} | panel] end)
        |> Enum.reverse()

      "L" ->
        Range.new(x - 1, x - length)
        |> Enum.reduce(panel, fn x, panel -> [{x, y} | panel] end)
        |> Enum.reverse()

      "D" ->
        Range.new(y - 1, y - length)
        |> Enum.reduce(panel, fn y, panel -> [{x, y} | panel] end)
        |> Enum.reverse()
    end
  end
end
