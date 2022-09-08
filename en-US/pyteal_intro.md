---
marp: true
header: 'Intro To PyTeal - 09/07/2022 '
footer: 'github.com/joe-p/algo-edu'
paginate: true
---

# Hello World

```py
from pyteal import *

def approval_program():
    return Seq(
        Log(Bytes("Hello World!")),
        Int(1),
        Return()
    )

print(compileTeal(approval_program(), mode=Mode.Application, version=7))
```
--- 

# What's Seq?

```py
    return Seq(
```

* `compileTeal` ultimately expects a PyTeal expression
* Expressions are methods that compile down to TEAL
* All other methods, such as `Log`, also expect PyTeal expression
* `Seq` stands for sequence, meaning a sequence of PyTeal expressions

---

# Why Bytes and Int?

```py
        Log(Bytes("Hello World!")),
        Int(1),
```

* Why not `Log("Hello World")` or `1,`?
* Every PyTeal expression (such as `Log` and `Seq`) expect another PyTeal expression as arguments
* `"Hello World"` and `1` are python `str` and `int` objects, not PyTeal expressions

---

# Why Return?
```py
        Return()
```

* We want our `approval_program()` function to return a `Seq`
* Every argument of the `Seq` must be a PyTeal expression
* `return` would return `approval_program()`, thus we want to use `Return()`

---

# Program Flow - If

```py
from pyteal import *

def approval_program():
    return If(Int(1), Log(Bytes("Expression is true!")), Log(Bytes("Expression is false!")))

print(compileTeal(approval_program(), mode=Mode.Application, version=7))
```
---

# Program Flow - Cond

```py
from pyteal import *

def approval_program():
    option = Txn.application_args[0]
    return Cond(
        [option == Bytes("A"), Log(Bytes("Option A was selected!"))],
        [option == Bytes("B"), Log(Bytes("Option B was selected!"))],
        [option == Bytes("C"), Log(Bytes("Option C was selected!"))]
    )

print(compileTeal(approval_program(), mode=Mode.Application, version=7))
```

---

# ABI Subroutines

---

# Application Arrays

---

# Inner Transactions
