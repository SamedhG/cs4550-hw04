defmodule PracticeWeb.PageController do
  use PracticeWeb, :controller

  def index(conn, _params) do
    render(conn, "index.html")
  end

  def double(conn, %{"x" => x}) do
    case Float.parse(x) do
      {x, _} -> 
        y = Practice.double(x)
        render conn, "double.html", x: x, y: y
      :error -> 
        render conn, "error.html", input: x, msg: "not a number" 
    end
  end

  def calc(conn, %{"expr" => expr}) do
    try do
      y = Practice.calc(expr)
      render conn, "calc.html", expr: expr, y: y
    rescue
      e -> render conn, "error.html", input: expr, msg: e.message
    end
  end

  def factor(conn, %{"x" => x}) do
    case Integer.parse(x) do
      {x, _} -> 
        y = x |> Practice.factor |> Enum.join(", ")
        render conn, "factor.html", x: x, y: y
      :error -> 
        render conn, "error.html", input: x, msg: "not an integer" 
    end
  end

  def palindrome(conn, %{"str" => str}) do 
    pal? = Practice.palindrome?(str)
    render conn, "palindrome.html", str: str, palindrome: pal?
  end
end
