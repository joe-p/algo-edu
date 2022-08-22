% Algorand Smart Contracts
% github.com/joe-p/algo-edu
% 08/21/2022

# Tech Stack

* [Algorand Virtual Machine (AVM)](https://developer.algorand.org/docs/get-details/dapps/avm/)
  * Running on every node
  * Not compatible with Ethereum Virtual Machine
* [Transaction Execution Approval Language](https://developer.algorand.org/docs/get-details/dapps/avm/teal/)
  * Assembly-like language for writing smart contracts
* [PyTeal](https://developer.algorand.org/docs/get-details/dapps/pyteal/) and [beaker](https://github.com/algorand-devrel/beaker)
  * Python library and framework for writing Algorand smart contracts
  * Ultimately compiles down to teal


# Algorand Virtual Machine

* Available data
  * Transaction information (sender, fee, amount, etc.)
  * Global variables (current round, latest timestamp, etc.)
  * Application state
* AVM and TEAL are turing complete
* Constraints
  * Static fees mean we need to constrain execution in another way
  * Constraints are hardcoded into AVM to limit computational complexity

::: notes
All of these will be discussed in more depth in future slides
:::

# [Modes of Use](https://developer.algorand.org/docs/get-details/dapps/smart-contracts/)

* Stateless - Smart Signature
  * Delegated approval: sign transactions from any account that signs the logic
  * Contract account: sign transactions from contract-specific account
* Stateful - Applications
  * Saved state
  * Logging
  * Inner transactions

::: notes
Applications are strongly preferred for a better user experience and security. Now with inner transactions an app can do most things that you used to need a smart signature for.
:::

# Application Anatomy - State

* Global state
  * 64 key/value pairs
  * Limited to 128 bytes per key/value pair
* Local state
  * 16 key/value pairs *per account*
  * Accounts must opt-in
