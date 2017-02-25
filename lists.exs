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

  def drop_every(list, ref), do: _drop_every(list, ref, 1)
  defp _drop_every([], _, _), do: []
  defp _drop_every([h | t], ref, ref), do: _drop_every(t, ref, 1)
  defp _drop_every([h | t], ref, count), do: [h | _drop_every(t, ref, count + 1)]

  def slice([], _count), do: []
  def slice([h | t], count), do: _slice(t, count - 1, [h])
  defp _slice([h], _, acc), do: [acc ++ [h], []]
  defp _slice([h | t], 1, acc), do: [acc ++ [h], t]
  defp _slice([h | t], count, acc), do: _slice(t, count - 1, acc ++ [h])

  def extract_slice([], _, _), do: []
  def extract_slice([h | t], llimit, ulimit) do
    [lhalf, rhalf] = slice([h | t], llimit)
    [lhalf1, rhalf1] = slice(rhalf, ulimit)
    lhalf1
  end

  def rotate([], _), do: []
  def rotate([h | t], 1), do: t ++ [h]
  def rotate([h | t], count), do: rotate(t ++ [h], count - 1)
end
