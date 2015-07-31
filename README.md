AliasMany
=========

A simple macro for aliasing multiple modules under the same namespace.
Instead of writing:
```
alias NameSpace.SubmoduleOne
alias NameSpace.SubmoduleTwo
alias NameSpace.SubmoduleThree
```
... and so on. You can
```
require AliasMany
AliasMany.alias [SubmoduleOne, SubModuleTwo, SubmoduleThree], from: NameSpace
```
