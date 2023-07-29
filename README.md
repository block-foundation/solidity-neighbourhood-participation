<div align="right">

  [![license](https://img.shields.io/github/license/block-foundation/solidity-neighbourhood-participation?color=green&label=license&style=flat-square)](LICENSE.md)
  ![stars](https://img.shields.io/github/stars/block-foundation/solidity-neighbourhood-participation?color=blue&label=stars&style=flat-square)
  ![contributors](https://img.shields.io/github/contributors/block-foundation/solidity-neighbourhood-participation?color=blue&label=contributors&style=flat-square)

</div>

---

<div>
    <img align="right" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/logo/logo_gray.png" width="96" alt="Block Foundation Logo">
    <h1 align="left">Neighbourhood Participation</h1>
    <h3 align="left">Block Foundation Smart Contract Series [Solidity]</h3>
</div>

---

<div>
<img align="right" width="75%" src="https://raw.githubusercontent.com/block-foundation/brand/master/src/image/repository_cover/block_foundation-structure-03-accent.jpg"  alt="Block Foundation">
<br>
<details open="open">
<summary>Table of Contents</summary>
  
- [Introduction](#style-guide)
- [Quick Start](#quick-start)
- [Contract](#contract)
- [Development Resources](#development-resources)
- [Legal Information](#legal-information)
  - [Copyright](#copyright)
  - [License](#license)
  - [Warning](#warning)
  - [Disclaimer](#disclaimer)

</details>
</div>

<br clear="both"/>

## Introduction

The Neighborhood Participation smart contract, written in Solidity for the Ethereum blockchain, is designed to facilitate decision-making and participation within a neighbourhood community. It provides a decentralized platform for community members to propose initiatives, vote on them, and check their status.

In this smart contract, each community or neighborhood has a manager, typically the person who deploys the contract. This manager can invite new participants to join the community. Once an individual is invited, they can accept the invitation to join the neighborhood.

Any participant can propose a new initiative. These initiatives then can be voted upon by the community members. The voting mechanism is a simple binary vote, meaning each participant can vote either in favor (yes) or against (no) an initiative.

The contract has a quorum mechanism in place to automatically approve or reject initiatives. If the number of 'yes' votes exceeds the predefined quorum, the initiative gets approved. Similarly, if 'no' votes exceed the quorum, the initiative gets rejected.

Each initiative in the contract holds its description, the address of the initiator, the count of yes and no votes, and its current state (proposed, approved, or rejected).

Remember, while this contract provides core functionalities for community decision-making, it's only a starting point. Depending on the specific requirements, further features can be added and improvements can be made. Also, it's crucial to thoroughly test and audit any smart contract before deploying it to a live network to ensure its security and functionality.

## Quick Start

> Install

``` sh
npm i
```

> Compile

``` sh
npm run compile
```

## Contract


## Development Resources


## Legal Information

### Copyright

Copyright &copy; 2023 [Block Foundation](https://www.blockfoundation.io/ "Block Foundation website"). All Rights Reserved.

### License

Except as otherwise noted, the content in this repository is licensed under the
[Creative Commons Attribution 4.0 International (CC BY 4.0) License](https://creativecommons.org/licenses/by/4.0/), and
code samples are licensed under the [MIT License](https://opensource.org/license/mit/).

Also see [LICENSE](https://github.com/block-foundation/community/blob/master/LICENSE) and [LICENSE-CODE](https://github.com/block-foundation/community/blob/master/LICENSE-CODE).

### Disclaimer

**THIS SOFTWARE IS PROVIDED AS IS WITHOUT WARRANTY OF ANY KIND, EITHER EXPRESS OR IMPLIED, INCLUDING ANY IMPLIED WARRANTIES OF FITNESS FOR A PARTICULAR PURPOSE, MERCHANTABILITY, OR NON-INFRINGEMENT.**
