% Algorand Layer 1 Features
% github.com/joe-p/algo-edu
% 08/21/2022

# Performance

* ~4 second block time
* Instant finality
* 6,000 TPS
* .001 ALGO fee
* Low energy consumption
  * Algorand is carbon negative

::: notes
The average TPS right now is between 10-20 (for most chains, including Algorand). The fee is subject to increase under congestion
:::

# Algorand Standard Assets (ASA)

* User-created tokens that are primitive to the blockchain
* Allows easy creation of tokens without smart contract risk
  * Supports fungible tokens and non-fungible tokens (NFTs)
* Features
  * Clawback: Allows a specified address to take back an asset
  * Freeze: Allows a specific address to freeze an asset
  * Metadata URL: Point to off-chain metadata for a token
  * Opt-in: Accounts must whitelist assets they wish to receive

# Smart Contracts

* Flat fee until congestion
* Turing complete
  * Hard-coded limitations to keep complexity in check
* Ability to send transactions

# State Proofs

* Attest to state of the chain in a verifiable way
* Can be leveraged by other chains for interoperability
  * Bridge on another chain can verify Algorand state proof on-chain
* Provides quantum security of chain history

# Minimum balance requirement (MBR)

* Every account has a minimum balance
  * Starts at 0.1 ALGO
* Any transaction that would result in an account going under the MBR will fail
  * Exception is when an account makes an account to specifically close out the entire balance

::: notes
MBR is essentially a way of renting space on the blockchain
:::

# MBR Changes

| Action               | Effect                                                     | Effect on MBR                                 |
| -------------------- | ---------------------------------------------------------- | --------------------------------------------- |
| Asset opt-in         | account can receive the asset                              | increased by 0.1 ALGO                         |
| Application opt-in   | application can save state to the account                  | increased proportional to data saved locally  |
| Application creation | application is created                                     | increased proportional to data saved globally |
| Asset opt-out        | account can no longer hold or receive asset                | decreased by 0.1 ALGO                         |
| Application opt-out  | account's local state for the given application is cleared | decreased by same amount as opt-in            |
| Application delete   | no one can interact with the app                           | decreased by same amount as creation          |

# Rekeying

* Allows a different private key to sign for a given address
* Once an account is rekeyed the original private key can no longer sign transactions
* Rekeying can be initiated with any regular transaction