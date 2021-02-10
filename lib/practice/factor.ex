defmodule Practice.Factor do
  # Find the prime factors of the given number
  def factors(x), do: factors(x, 2)

  defp factors(1, _), do: []

  defp factors(x, start) do
    if rem(x, start) === 0 do
      [start | factors(div(x, start), start)]
    else 
      factors(x, start + 1)
    end
  end
end
