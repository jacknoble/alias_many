defmodule AliasMany do
  @doc """
  Shorthand for aliasing multiple submodules from the same namespace.
  Instead of:
  alias NameSpace.ModuleOne
  alias NameSpace.ModuleTwo
   ...
  alias_many [ModuleONe, ModuleTow, ...], from: NameSpace
  """
  defmacro alias(submodule_aliases, from: namespace_alias) when is_list(submodule_aliases) do
    namespace_atom = atom_from_alias(namespace_alias)
    submodule_aliases |>
      Enum.map(fn(sub) -> add_namespace_to_alias(sub, namespace_atom) end) |>
      quoted_aliases
  end

  defmacro alias(submodule_aliases) when is_list(submodule_aliases) do
    quoted_aliases(submodule_aliases)
  end

  defp quoted_aliases(modules) do
    modules |>
    Enum.map(fn(mod) ->
      quote do
        alias unquote(mod)
      end
    end)
  end

  defp atom_from_alias(alias) do
    {_, _, [name]} = alias
    name
  end

  defp add_namespace_to_alias({:__aliases__, context, atoms}, namespace_atom) do
    {:__aliases__, context, [namespace_atom | atoms]}
  end
end
