defmodule Practice.Calc do
  import Enum 

  ## Parse a float, ignoring spaces
  defp parse_float(text) do
    case text |> String.trim |> Float.parse do
      {num, _} -> num
      :error -> raise RuntimeError, message: "couldnt parse float"
    end
  end

  ## Calculates the result of an arithmatic expression following MDAS
  #convention (no parenthesis)
  def calc(expr) do
    calc(expr, "-")
  end

  # Caclculates the expression given the next operation to perform, assumes
  # lower priority operations have already been taken out
  defp calc(expr, next_op) do
    case next_op do
      "-" ->
        [head | tail] = expr |> String.split("-") |> map(&(calc(&1, "+")))
        reduce(tail, head, &(&2 - &1))
      "+" -> expr |> String.split("+") |> map(&(calc(&1, "/"))) |> reduce(0, &+/2)
      "/" -> 
        [head | tail] = expr |> String.split("/") |> map(&(calc(&1, "*")))
        reduce(tail, head, &(&2 / &1))
      "*" -> expr |> String.split("*") |> map(&parse_float/1) |> reduce(1, &*/2)
    end
  end
end
