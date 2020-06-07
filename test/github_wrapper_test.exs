defmodule GithubWrapperTest do
  use ExUnit.Case
  doctest GithubWrapper

  test "greets the world" do
    assert GithubWrapper.hello() == :world
  end
end
