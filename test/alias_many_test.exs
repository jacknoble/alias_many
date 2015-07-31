defmodule AliasManyTest do
  use ExUnit.Case

  test "alias enables aliasing multiple modules at once" do
    require AliasMany
    AliasMany.alias [Test.First, Test.Second]
    assert First.working?
    assert Second.working?
  end

  test "alias enables aliasing multiple modules from the same namespace" do
    require AliasMany
    AliasMany.alias [First, Second], from: Test
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
