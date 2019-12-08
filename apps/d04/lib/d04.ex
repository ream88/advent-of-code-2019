defmodule D04 do
  def part1() do
    input = 183_564..657_474

    100_000..999_999
    |> Enum.count(fn password ->
      six_digit?(password) &&
        in_range?(password, input) &&
        adjacent?(password) &&
        increase?(password)
    end)
    |> IO.inspect(label: "Passwords matching criteria")
  end

  @doc """
  Checks whether the password is 6 digits long.

    iex> D04.six_digit?(111111)
    true

    iex> D04.six_digit?(11111)
    false
  """
  def six_digit?(password), do: password in 100_000..999_999

  @doc """
  Checks whether the password is in the given range.

    iex> D04.in_range?(111111, 100_000..999_999)
    true

    iex> D04.in_range?(111111, 200_000..999_999)
    false
  """
  def in_range?(password, range), do: password in range

  @doc """
  Checks whether the password has same two adjacent digits.

    iex> D04.adjacent?(111111)
    true

    iex> D04.adjacent?(122345)
    true

    iex> D04.adjacent?(123456)
    false
  """
  def adjacent?(password) do
    digits = Integer.digits(password)

    digits
    |> Enum.with_index()
    |> Enum.any?(fn {digit, index} ->
      Enum.at(digits, index + 1) == digit
    end)
  end

  @doc """
  Checks whether the digits in the password only increase, never decrease.

    iex> D04.increase?(111123)
    true

    iex> D04.increase?(135679)
    true

    iex> D04.increase?(223450)
    false
  """
  def increase?(password) do
    digits = Integer.digits(password)

    digits
    |> Enum.with_index()
    |> Enum.all?(fn {digit, index} ->
      case Enum.at(digits, index + 1) do
        nil -> true
        next -> digit <= next
      end
    end)
  end
end
