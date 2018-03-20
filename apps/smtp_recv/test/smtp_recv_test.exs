defmodule SMTPRecvTest do
  use ExUnit.Case
  doctest SMTPRecv

  test "greets the world" do
    assert SMTPRecv.hello() == :world
  end
end
