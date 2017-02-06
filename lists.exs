defmodule Lists do

  def last([h]), do: h
  def last([_h | t]), do: last(t)

  def last_but_one([h1, _h2]), do: h1
  def last_but_one([_h1 | t]), do: last_but_one(t)

  def k_th_element([h | _t], 1), do: h
  def k_th_element([_h | t], k), do: k_th_element(t, k - 1)

  def len([]), do: 0
  def len([_h | t]), do: 1 + len(t)

  def len_with_tail_recursion(list), do: _len_with_tail_recursion(list, 0)
  defp _len_with_tail_recursion([], acc), do: acc
  defp _len_with_tail_recursion([_h | t], acc), do: _len_with_tail_recursion(t, acc + 1)

  def reverse(list), do: reverse(list, [])
  defp reverse([], acc), do: acc
  defp reverse([h | t], acc), do: reverse(t, [h | acc])

  def is_palindrome(list), do: list == reverse(list)

end
