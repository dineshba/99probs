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

  def flatten([]), do: []
  def flatten([h | t]) when is_list(h), do: flatten(h) ++ flatten(t)
  def flatten([h | t]), do: [h | flatten(t)]

  def eliminate_consecutive_duplicates([]), do: []
  def eliminate_consecutive_duplicates([h, h | t]), do: eliminate_consecutive_duplicates([h | t])
  def eliminate_consecutive_duplicates([h | t]), do: [h | eliminate_consecutive_duplicates(t)]

  def pack_consecutive_duplicates([]), do: []
  def pack_consecutive_duplicates([h, h | t]), do: _pack_consecutive_duplicates([h | t], [h])
  def pack_consecutive_duplicates([h | t]), do: [[h] | pack_consecutive_duplicates(t)]
  defp _pack_consecutive_duplicates([h], acc), do: [h | acc]
  defp _pack_consecutive_duplicates([h, h], acc), do: [h, h | acc]
  defp _pack_consecutive_duplicates([h, h | t], acc), do: _pack_consecutive_duplicates([h|t], [h|acc])
  defp _pack_consecutive_duplicates([h | t], acc), do: [[h|acc] | pack_consecutive_duplicates(t)]

  def run_length_encoder([]), do: []
  def run_length_encoder([h|t]), do: count(h, t, 1)
  defp count(h, [h|t], counter), do: count(h, t, counter + 1)
  defp count(h, [h1|t], 1), do: [h | run_length_encoder([h1 | t])]
  defp count(h, [h1|t], counter), do: [[h, counter] | run_length_encoder([h1 | t])]
  defp count(h, [], 1), do: [h]
  defp count(h, [], counter), do: [h, counter]

  def run_length_decoder([]), do: []
  def run_length_decoder([[h, count] | t]), do: repeat(h, count) ++ run_length_decoder(t)
  def run_length_decoder([h | t]), do: [h | run_length_decoder(t)]
  defp repeat(x, 1), do: [x]
  defp repeat(x, n), do: [x | repeat(x, n-1)]

  def duplicate(list, repeater \\ 2), do: _duplicate(list, repeater)
  defp _duplicate([], _repeater), do: []
  defp _duplicate([h | t], repeater), do: repeat(h, repeater) ++ duplicate(t, repeater)
end
