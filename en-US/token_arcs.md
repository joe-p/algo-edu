---
marp: true
paginate: true
backgroundImage: url('../bg.png')
theme: algorand
---
![bg](../title_bg.png)
<div id='title'>Token ARCs</div>
<div id='subtitle'>Overview of token-related ARCs</div>
<div id='date'>September 18, 2022</div>
<div id='name'>Joe Polny</div>

---

# Why ARCs?

* Wallets and Dapps need to know how to view data
  * Standards make this easy to implement
* There are different use cases of ASAs and tokens
  * Different uses require different standards
* Native ASA fefatures is limited
  * Can be expanded with ARCs

---

# ASA Fields
<style scope>
    table {
        font-size: 21px;
    }
</style>
<table>
    <tr>
        <th>Field</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>Total</td>
        <td>uint64</td>
        <td>The total number of base units of the asset to create. This number cannot be changed.</td>
    </tr>
    <tr>
        <td>Decimals</td>
        <td>uint32</td>
        <td>The number of digits to use after the decimal point when displaying the asset.</td>
    </tr>
    <tr>
        <td>DefaultFrozen</td>
        <td>bool</td>
        <td>True to freeze holdings for this asset by default.</td>
    </tr>
    <tr>
        <td>UnitName</td>
        <td>string</td>
        <td>The name of a unit of this asset. Supplied on creation. Example: USDT</td>
    </tr>
    <tr>
        <td>AssetName</td>
        <td>string</td>
        <td>The name of the asset. Supplied on creation.Example: Tether</td>
    </tr>
    <tr>
        <td>URL</td>
        <td>string</td>
        <td>Specifies a URL where more information about the asset can be retrieved.</td>
    </tr>
    <tr>
        <td>MetaDataHash</td>
        <td>[]byte</td>
        <td>This field is intended to be a 32-byte hash of some metadata that is relevant to your asset and/or asset holders. </td>
    </tr>
</table>

---

# ASA Address Fields

<table>
    <tr>
        <th>Field</th>
        <th>Type</th>
        <th>Description</th>
    </tr>
    <tr>
        <td>ManagerAddr</td>
        <td>Address</td>
        <td>The address of the account that can manage the configuration of the asset and destroy it.</td>
    </tr>
    <tr>
        <td>ReserveAddr</td>
        <td>Address</td>
        <td>The address of the account that holds the reserve (non-minted) units of the asset.</td>
    </tr>
    <tr>
        <td>FreezeAddr</td>
        <td>Address</td>
        <td>The address of the account used to freeze holdings of this asset.</td>
    </tr>
    <tr>
        <td>ClawbackAddr</td>
        <td>Address</td>
        <td>The address of the account that can clawback holdings of this asset.</td>
    </tr>
</table>


---

# [ARC-0003](https://arc.algorand.foundation/ARCs/arc-0003)

* General standard for displaying ASA information
* Uses off-chain JSON metadafile
  * Often stored on IPFS
* Defines standards for on-chain configuration fields
* Largely similar to ERC 1155 and Open Sea standards

---

# [ARC-0069](https://arc.algorand.foundation/ARCs/arc-0069)

* Similar to ARC-0003, but metadata is mutable
* Metadata is read from the most recent asset config transaction
  * The metadata is contained inside the note of the transaction
* More limited metadata options due to note size restriction

---

# [ARC-0020](https://arc.algorand.foundation/ARCs/arc-0020)

* ASAs implemented as smart contracts
* Can follow some existing ARCs, such as ARC3
* Allows more functionality than ASAs
  * Transfer logic
  * Royalties
  * Mutability
* Should only be used when ASAs aren't an option
  * Smart contracts have much more security considerations

---

# [ARC-0018](https://arc.algorand.foundation/ARCs/arc-0018)

* Leverages ARC-0020 (smart contracts)
* On-chain royalty enforcement
  * Asset cannot be moved unless royalties are paid
  * OR the admin calls the royalty-free move function
* Enables royalties for payments in ALGO or ASAs
* Compatible with secondary marketplaces

---

# How to decide?

* Start with ARC-0003
* Need on-chain mutability?
  * ARC-0069
* Need functionality ASAs don't provide?
  * ARC-0020
* Need enforced royalties on all sales?
  * ARC-0018