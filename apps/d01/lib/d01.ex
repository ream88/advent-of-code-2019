defmodule D01 do
  def part1() do
    {:ok, file} =
      Path.join(__ENV__.file, "../../input")
      |> Path.expand()
      |> File.read()

    file
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&fuel_naive/1)
    |> Enum.sum()
    |> IO.inspect(label: "Part 1")
  end

  def part2() do
    {:ok, file} =
      Path.join(__ENV__.file, "../../input")
      |> Path.expand()
      |> File.read()

    file
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&fuel/1)
    |> Enum.sum()
    |> IO.inspect(label: "Part 2")
  end

  def fuel_naive(mass) do
    trunc(:math.floor(mass / 3) - 2)
  end

  def fuel(mass) when mass > 0 do
    fuel = fuel_naive(mass)
    fuel + abs(fuel(fuel))
  end

  def fuel(mass), do: mass
end
