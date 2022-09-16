---
marp: true
paginate: true
backgroundImage: url('../bg.png')
theme: algorand
---
![bg](../title_bg.png)
<div id='title'>Algorand Network</div>
<div id='subtitle'>Topology and software powering Algorand</div>
<div id='date'>September 16, 2022</div>
<div id='name'>Joe Polny</div>

---

# Public Networks

* Mainnet
  * The main Algorand network where production applications live
* Testnet
  * A network for specifically made for testing
  * Running same software version as MainNet
* Betanet
  * Running future software versions
  
---
  
# [Configurable Modes](https://developer.algorand.org/docs/run-a-node/setup/types/#:~:text=The%20Algorand%20network%20is%20comprised,all%20connected%20non%2Drelay%20nodes.)

* Participation
  * Used to participate in consensus to secure network
  * Contains last ~1000 blocks
* Archival
  * Contains the entire blockchain
  * Required for indexer, which is used to query blockchain
* Relay
  * Routes data between participation nodes
  * Do not affect consensus

<!--
These modes of configuration are orthogonal, although you typically run one at a time
-->

---

# [Decentralization](https://metrics.algorand.org/#/decentralization/)

* 1000+ nodes
* Participation nodes are permissionless
* Default relay nodes are chosen by Foundation
  * Anyone can run one, but nodes must point to it

---

# [Consensus - Pure Proof of Stake](https://www.algorand.com/technology/algorand-protocol)
* Three Steps
  1. Block proposal: Accounts propose new blocks to the network
  2. Soft Vote: Committee votes on proposals and filters down to one
  3. Certify Vote: Separate committee votes to certify the block
* Selection
  * Each account generates random numbers via VRF
  * The amount of random numbers generated (thus chance of participating) is proportional to ALGO in account
  * New participants are selected for each step

---

# [Participating](https://developer.algorand.org/docs/run-a-node/participate/)

* Requirements
  * Must be running participation node
  * Must register as online with *participation* key
  * Must have 0.1 ALGO
* Information
  * No explicit staking
  * No rewards
  * No slashing

<!--
The incentivization model is based on game theory. Someone with a large stake in the network will want to protect the network by running a node
-->

---

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

---

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

---

# Interacting With Nodes

* [goal](https://developer.algorand.org/docs/clis/goal/goal/)
  * Command-line utility for interacting with algod and kmd
* [SDKs](https://developer.algorand.org/docs/sdks/)
  * Leverage HTTP endpoints to interact with algod and kmd
* [Public API services](https://developer.algorand.org/docs/get-started/devenv/#2-third-party-api-services)
  * Services that expose HTTP endpoints for their node(s) publicly

---

# Installation

* [sandbox](https://developer.algorand.org/docs/get-started/devenv/#1-sandbox)
  * Leverages docker to quickly deploy a node
  * Often used for local networks for development and testing
* Manual installation
  * Compile from [source](https://github.com/algorand/go-algorand)
  * [Update script](https://developer.algorand.org/docs/run-a-node/setup/install/#installation-with-the-updater-script) for automated install
  * [Package manger](https://developer.algorand.org/docs/run-a-node/setup/install/#installation-with-a-package-manager) on debian-based or RedHat-based operating systems
