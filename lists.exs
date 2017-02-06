defmodule Lists do

  def last([h]), do: h
  def last([_h | t]), do: last(t)

  def last_but_one([h1, _h2]), do: h1
  def last_but_one([_h1 | t]), do: last_but_one(t)

  def k_th_element([h | t], 1), do: h
  def k_th_element([_h | t], k), do: k_th_element(t, k - 1)

end
