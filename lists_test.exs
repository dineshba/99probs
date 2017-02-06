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

end
