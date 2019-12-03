defmodule D01 do
  def run() do
    {:ok, file} =
      Path.join(__ENV__.file, "../../input")
      |> Path.expand()
      |> File.read()

    file
    |> String.split()
    |> Enum.map(&String.to_integer/1)
    |> Enum.map(&fuel/1)
    |> Enum.sum()
  end

  def fuel(mass) do
    trunc(:math.floor(mass / 3) - 2)
  end
end
