defmodule Recursion do


  def x(0), do: 0
  def x(n), do: n + x(n - 1)


end
