defmodule Practice do
  @moduledoc """
  Practice keeps the contexts that define your domain
  and business logic.

  Contexts are also responsible for managing your data, regardless
  if it comes from the database, an external API or others.
  """

  def double(x), do: 2 * x

  def calc(expr), do: Practice.Calc.calc(expr)

  def factor(x), do: Practice.Factor.factors(x)

  def palindrome?(str) do
    s1 = String.downcase str
    s2 = String.reverse s1
    s1 === s2
  end
end
