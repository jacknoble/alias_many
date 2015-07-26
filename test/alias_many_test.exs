defmodule AliasManyTest do
  use ExUnit.Case

  test "alias_many enables aliasing multiple modules from the same namespace" do
    import AliasMany, only: [alias_many: 2]
    alias_many [First, Second], from: Test
    assert First.working?
    assert Second.working?
  end
end

defmodule Test.First do
  def working? do
    true
  end
end

defmodule Test.Second do
  def working? do
    true
  end
end
