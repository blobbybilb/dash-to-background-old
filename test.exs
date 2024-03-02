defmodule Recursion do


  def x(0), do: 0
  def x(n), do: n + x(n - 1)


end

# ignore this, this was just to show someone recursion in a functional language when learning about recursion in AP CSA (Java)
