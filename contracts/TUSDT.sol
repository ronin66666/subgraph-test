// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.10;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TUSDT is ERC20 {
    
    string private _name = "Tether USD";
    string private _symbol = "TUSDT";
    

    constructor() ERC20(_name, _symbol) {
        _mint(msg.sender, 10000000 * 10 ** decimals());
        
    }

    function mint(address to, uint256 amount) public {
        _mint(to, amount);
    }


}

