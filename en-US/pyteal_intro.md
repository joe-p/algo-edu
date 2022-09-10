---
marp: true
header: 'Intro To PyTeal - 09/10/2022 '
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

* We want our `approval_program()` function to return the `Seq`
* Every argument of the `Seq` must be a PyTeal expression
* `Return()` is the PyTeal expression for the `return` opcode
* `Approve()` is shorthand for `Int(1), Return()`

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
        # An error will occur if option != A, B, or C
    )

print(compileTeal(approval_program(), mode=Mode.Application, version=7))
```

---
# App Arrays

```py
def approval_program():
    return Seq(
        Log(Concat(Bytes("The first account is "), Txn.accounts[1])), # Txn.accounts[0] is always sender
        Log(Concat(Bytes("The first asset ID is "), Itob(Txn.assets[0]))),
        Log(Concat(Bytes("The first app ID is "), Itob(Txn.applications[0]))),
        Approve()
    )
```
---

# Inner Txns

```py
def axfer_to_sender():
    return Seq(
        InnerTxnBuilder.Begin(),
        InnerTxnBuilder.SetFields(
            {
                TxnField.type_enum: TxnType.AssetTransfer,
                # Generally set fee to 0 and use fee pooling to cover.
                # Doing so prevents unpredictable fees from having unintended consequences during congestion.
                TxnField.fee: Int(0)
                TxnField.receiver: Txn.sender(),
                TxnField.amount: Int(1),
                TxnField.asset_sender: Global.current_application_address(),
                TxnField.xfer_asset: Txn.assets[0],
            }
        )
    )
```
---

# Maybe Values

```py
def approval_program():
    # Some opcodes, like app_global_get_ex, return two values:
    #   1. The actual value (.value())
    #   2. Boolean to signal whether there actually is a value or not (.hasValue())
    myStatus = App.globalGetEx(Txn.applications[1], Bytes("status"))

    return Seq(
        myStatus, # the function that returns the maybeValue must be in the sequence
        Log(If(myStatus.hasValue(), myStatus.value(), Bytes("none"))),
        Approve()
    )
```

---

# What's Next?

* If you want a full framework for writing ABI-compliant applicaions
  * Learn Beaker!
    * Easily route ABI methods
    * Easily read and write application state
    * Easily write application tests
    * Easily implement logic in TypeScript front-ends
* If you want to know more about PyTeal
  * [Refer to the documentation](https://pyteal.readthedocs.io/en/latest/)
  * [Visit the developer portal](https://developer.algorand.org/docs/get-details/dapps/pyteal/)