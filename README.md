# Reputation Token (RPT) Smart Contract

## Overview

Reputation Token (RPT) is an ERC-20 compatible token deployed on the Ethereum blockchain. It utilizes the OpenZeppelin library for ERC-20 implementation, along with additional functionalities for token burning and ownership management.

## Features

- **ERC-20 Compliance**: Implements standard ERC-20 functionalities such as `balanceOf`, `transfer`, and `allowance`.
- **Minting**: Ability for the contract owner to mint new tokens to designated addresses.
- **Burning**: Token holders can burn their own tokens to reduce the total token supply.
- **Ownership**: The contract inherits from `Ownable`, allowing the owner to transfer ownership and execute owner-only functions.

## Description

This smart contract (`Reputation.sol`) provides a basic implementation of a reputation token on Ethereum. It includes the following functionalities:

- **Constructor**: Initializes the token with the name "Reputation" and symbol "RPT".
- **Minting**: The `mint` function allows the contract owner to create new tokens and assign them to any address.
- **Burning**: The `burn` function enables token holders to burn their tokens, reducing the total supply.
- **Transfers**: Standard ERC-20 `transfer` function overridden to ensure proper functionality and emit necessary events.

## Usage

To deploy and interact with this contract:

1. **Deploy**: Deploy the `avax3.sol` contract on an Ethereum-compatible blockchain (mainnet, testnet, or local).
2. **Interact**: Use tools like Remix, Truffle, or Web3.js to interact with deployed instances of the contract.
   - Mint new tokens using the `mint` function.
   - Burn tokens using the `burn` function.
   - Transfer tokens between addresses using the `transfer` function.
   - 
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
