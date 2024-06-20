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
