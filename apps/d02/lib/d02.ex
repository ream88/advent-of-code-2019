defmodule D02 do
  def part1() do
    Path.join(__ENV__.file, "../../input")
    |> Path.expand()
    |> load_program()
    |> List.replace_at(1, 12)
    |> List.replace_at(2, 2)
    |> solve()
    |> Enum.at(0)
    |> IO.inspect(label: "Part 1")
  end

  def part2() do
    for noun <- Range.new(0, 100),
        verb <- Range.new(0, 100) do
      result =
        Path.join(__ENV__.file, "../../input")
        |> Path.expand()
        |> load_program()
        |> List.replace_at(1, noun)
        |> List.replace_at(2, verb)
        |> solve()
        |> Enum.at(0)

      case result do
        19_690_720 ->
          IO.puts("Part 2: 100 * #{noun} + #{verb} = #{100 * noun + verb}")
          Kernel.exit(:normal)

        _ ->
          nil
      end
    end
  end

  defp load_program(file) do
    {:ok, file} = File.read(file)

    file
    |> String.trim()
    |> String.split(",")
    |> Enum.map(&String.to_integer/1)
  end

  def solve(program) do
    solve_helper(program, program, 0)
  end

  defp solve_helper(program, memory, 0) when length(program) == 0, do: memory

  defp solve_helper(program, memory, pointer) do
    case program do
      [1, x, y, z | _] ->
        memory = List.replace_at(memory, z, Enum.at(memory, x) + Enum.at(memory, y))

        memory
        |> Enum.drop(pointer + 4)
        |> solve_helper(memory, pointer + 4)

      [2, x, y, z | _] ->
        memory = List.replace_at(memory, z, Enum.at(memory, x) * Enum.at(memory, y))

        memory
        |> Enum.drop(pointer + 4)
        |> solve_helper(memory, pointer + 4)

      [99 | _] ->
        memory
    end
  end
end
