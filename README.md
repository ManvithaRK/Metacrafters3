# Reputation Token (RPT) Smart Contract

## Overview

Reputation Token (RPT) is a type of digital token that operates on the Ethereum blockchain. It follows the ERC-20 standard and uses the OpenZeppelin library for its basic functionalities. In addition to standard features like transferring tokens between addresses, it includes special capabilities such as the ability to permanently remove tokens from circulation (burning) and features that allow the owner of the contract to manage ownership rights

## Features

- ERC-20 Compliance: This token adheres to the ERC-20 standard, ensuring compatibility with a wide range of decentralized applications (dApps) and wallets. It supports functionalities such as checking balances (balanceOf), transferring tokens (transfer), and managing spending approvals (allowance).

- Minting: The contract owner has the exclusive ability to create and allocate new tokens to specified addresses. This feature is essential for initial token distribution or subsequent token issuance as needed.

- Burning: Token holders can voluntarily burn their own tokens, permanently removing them from circulation. Burning tokens helps manage the total supply and can be useful for deflationary mechanisms or adjusting tokenomics over time.

- Ownership Management: The contract utilizes the Ownable pattern, allowing designated owners to transfer ownership rights or execute owner-only functions. This enhances security and control over critical contract operations.

## Description

The Reputation.sol smart contract represents a foundational implementation of a reputation token on the Ethereum blockchain. Key functionalities include:

- Constructor: Upon deployment, the contract initializes with the name "Reputation" and the symbol "RPT", providing clear identification within the Ethereum ecosystem.

- Minting: Through the mint function, the contract owner can generate new tokens and allocate them to specified Ethereum addresses. This function is pivotal for managing token supply and distribution.

- Burning: Token holders can invoke the burn function to permanently destroy their tokens, thereby reducing the overall token supply. This functionality empowers token holders to actively participate in supply management.

- Transfers: The standard ERC-20 transfer function is overridden to ensure seamless token transfers between addresses. Each transfer triggers necessary events, providing transparency and auditability on the blockchain.
- 
## Usage
To effectively deploy and interact with the Reputation.sol contract, follow these steps:

- Deployment: Deploy the Reputation.sol contract on any Ethereum-compatible blockchain network (mainnet, testnet, or local test environment) using tools like Remix, Truffle, or a deployment script.

- Interaction: Utilize developer tools such as Remix IDE, Truffle framework, or Web3.js library to interact with the deployed contract instance. Key actions include:

- Minting: Initiate the mint function to create and assign new tokens to designated addresses. This action is restricted to the contract owner for controlled token issuance.

- Burning: Token holders can utilize the burn function to irreversibly eliminate their tokens from circulation, thereby reducing the total token supply. Burning can be beneficial for managing token economics or implementing deflationary mechanisms.

- Transfers: Facilitate token movements between addresses by invoking the transfer function. Ensure that the transferred amount is within the sender's available balance and adheres to any locking or vesting rules implemented within the contract.
     
### Executing the program

To run this program use an online Solidity IDE such as remix wesite : Remix website at https://remix.ethereum.org/.

Next after you are on the Remix website, create a new file with a .sol extension (e.g., avax3.sol) and save it.
In the file you created copy paste the below code:

```solidity
//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/extensions/ERC20Burnable.sol";
import "@openzeppelin/contracts/access/Ownable.sol";


contract Reputation is ERC20, ERC20Burnable,Ownable {
    constructor(address initialOwner)
        ERC20("Reputation", "RPT")
        Ownable(initialOwner)
      
    {}
    
    function mint(address mint_address, uint256 rpt_amount) public onlyOwner {
        _mint(mint_address, rpt_amount);
    }

    function burn(uint256 rpt_amount) public override  {
        _burn(msg.sender,rpt_amount);
        
    }   
    function transfer(address recepient, uint256 rpt_amount) public override returns(bool){
        _transfer(msg.sender, recepient, rpt_amount);
        return true;
    }    
}
```

Compile the code, click on the "Solidity Compiler".The Compiler option should be  set to 0.8.4, and then run the code by clicking on the "Compile avax3.sol" button.

After the code is compiled, click on the "Deploy & Run Transactions" tab. From the dropdown menu choose the "avax3" contract. Finally click on the "Deploy" button.

## Authors

Manvitha R Kabbathi

[manvitha.r.kabbathi@gmail.com]


## License

This project is licensed under the MIT License - see the LICENSE.md file for details
