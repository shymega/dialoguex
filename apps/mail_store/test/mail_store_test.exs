defmodule MailStoreTest do
  use ExUnit.Case
  doctest MailStore

  test "greets the world" do
    assert MailStore.hello() == :world
  end
end
