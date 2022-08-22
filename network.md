% Algorand Network
% github.com/joe-p/algo-edu
% 08/21/2022

# Public Networks

* Mainnet
  * The main Algorand network where production applications live
* Testnet
  * A network for specifically made for testing
  * Running same software version as MainNet
* Betanet
  * Running future software versions
  
# Configurable Modes

* Participation
  * Used to participate in consensus to secure network
  * Contains last ~1000 blocks
* Archival
  * Contains the entire blockchain
  * Required for indexer, which is used to query blockchain
* Relay
  * Routes data between participation nodes
  * Do not affect consensus

::: notes
These modes of configuration are orthogonal, although you typically run one at a time
:::

# Decentralization

* 1000+ nodes
* Participation nodes are permissionless
* Default relay nodes are chosen by Foundation
  * Anyone can run one, but nodes must point to it

# Consensus - Pure Proof of Stake
* Three Steps
  1. Block proposal: Accounts propose new blocks to the network
  2. Soft Vote: Committee votes on proposals and filters down to one
  3. Certify Vote: Separate committee votes to certify the block
* Selection
  * Each account generates random numbers via VRF
  * The amount of random numbers generated (thus chance of participating) is proportional to ALGO in account
  * New participants are selected for each step

# Participating

* Requirements
  * Must be running participation node
  * Must register as online with *participation* key
  * Must have 0.1 ALGO
* Information
  * No explicit staking
  * No rewards
  * No slashing

::: notes
The incentivization model is based on game theory. Someone with a large stake in the network will want to protect the network by running a node
:::

# Hardware Requirements

* Minimum requirements
  * 4 vCPU
  * 8GB RAM
  * 100 GB SSD (NVMe SSD recommended)
  * 100 Mbit broadband
* Enterprise-grade
  * 8 vCPU
  * 16GB RAM
  * 500GB NVMe SSD
  * 1Gbps broadband symmetrical with low latency connection to the network

# Software

* algod - Algorand Daemon
  * The node software that connects with the rest of the network
  * HTTP endpoints for submitting transactions and reading state
* kmd - Key Management Daemon
  * Manages account keys
  * HTTP endpoints for managing and querying local accounts
* indexer
  * Software that can run alongside an archival node
  * Saves blockchain state in SQL database
  * Provides HTTP endpoints specifically for querying on-chain data

# Interacting With Nodes

* goal
  * Command-line utility for interacting with algod and kmd
* SDKs
  * Leverage HTTP endpoints to interact with algod and kmd
* Public API services
  * Services that expose HTTP endpoints for their node(s) publicly


# Installation

* sandbox
  * Leverages docker to quickly deploy a node
  * Often used for local networks for development and testing
* Manual installation
  * Compile from [source](https://github.com/algorand/go-algorand)
  * [Update script](https://developer.algorand.org/docs/run-a-node/setup/install/#installation-with-the-updater-script) for automated install
  * [Package manger](https://developer.algorand.org/docs/run-a-node/setup/install/#installation-with-a-package-manager) on debian-based or RedHat-based operating systems
