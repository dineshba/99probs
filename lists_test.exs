Code.load_file("lists.exs")

ExUnit.start

defmodule ListsTest do
  use ExUnit.Case

  import Lists

  test "last" do
    assert 1 == last([1])
    assert 4 == last([1, 2, 3, 4])
  end

  test "last but one" do
    assert 1 == last_but_one([1, 2])
    assert 3 == last_but_one([1, 2, 3, 4])
  end

  test "K'th element" do
    assert 1 == k_th_element([1, 2], 1)
    assert 5 == k_th_element([1, 2, 5, 4], 3)
  end

  test "number of elements" do
    assert 0 == len([])
    assert 4 == len([1, 2, 5, 4])
  end

  test "number of elements in tail recursion" do
    assert 0 == len_with_tail_recursion([])
    assert 4 == len_with_tail_recursion([1, 2, 5, 4])
  end

  test "reverse the list" do
    assert [] == reverse([])
    assert [1] == reverse([1])
    assert [4, 5, 2, 1] == reverse([1, 2, 5, 4])
  end

  test "is_palindrome" do
    assert is_palindrome([])
    assert is_palindrome([1])
    assert is_palindrome([1, 2, 5, 2, 1])
    refute is_palindrome([1, 2, 5])
  end

  test "flatten the list" do
    assert [] == flatten([])
    assert [1, 1] == flatten([1, [1]])
    assert [1, 2, 5, 4] == flatten([1, [[2], 5], 4])
  end

  test "eliminate consecutive duplicates" do
    assert [] == eliminate_consecutive_duplicates([])
    assert [1] == eliminate_consecutive_duplicates([1, 1])
    assert [1, 2, 5, 1] == eliminate_consecutive_duplicates([1, 2, 2, 2, 5, 5, 1, 1])
  end

  test "Pack consecutive duplicates of list elements into sublists" do
    assert [] == pack_consecutive_duplicates([])
    assert [[1, 1], [2]] == pack_consecutive_duplicates([1, 1, 2])
    assert [[1], [2, 2, 2], [5, 5], [1]] == pack_consecutive_duplicates([1, 2, 2, 2, 5, 5, 1])
  end

  test "Run length encoding" do
    assert [] == run_length_encoder([])
    assert [[1, 2], 2] == run_length_encoder([1, 1, 2])
    assert [1, [2, 3], [5, 2], 1] == run_length_encoder([1, 2, 2, 2, 5, 5, 1])
  end

  test "Run length decoding" do
    assert [] == run_length_decoder([])
    assert [1, 1, 2] == run_length_decoder([[1, 2], 2])
    assert [1, 2, 2, 2, 5, 5, 1] == run_length_decoder([1, [2, 3], [5, 2], 1])
  end

  test "duplicate the elements in the list" do
    assert [] == duplicate([])
    assert [1,1,2,2] == duplicate([1,2])
  end

  test "duplicate the elements in the list n times" do
    assert [] == duplicate([], 2)
    assert [1, 1, 1, 2, 2, 2] == duplicate([1,2], 3)
  end

end
