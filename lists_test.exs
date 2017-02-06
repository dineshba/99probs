Code.load_file("lists.exs")

ExUnit.start

defmodule ListsTest do
  use ExUnit.Case

  import Lists

  test "last" do
    assert 1 == last([1])
    assert 4 == last([1, 2, 3, 4])
  end

end
