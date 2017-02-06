defmodule Lists do

  def last([h]), do: h
  def last([_h|t]), do: last(t)

end
