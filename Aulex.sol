// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract BonifaceERC20 {
    string public name = "boniface";
    string public symbol = "BUNN";
    uint8 public decimals = 18;
    uint256 public totalSupply = 1000e18;
    mapping(address => uint256) public balanceOf;
    address public owner;

    constructor() {
        balanceOf[msg.sender] = totalSupply;
        owner = msg.sender;
    }

    function transfer(address _to, uint256 _value) public returns (bool success) {
        require(balanceOf[msg.sender] >= _value, "Insufficient balance");
        balanceOf[msg.sender] -= _value;
        balanceOf[_to] += _value;
        return true;
    }

    function _mint(uint256 _value) public {
        require(msg.sender == owner, "Only the owner can mint tokens");
        totalSupply += _value;
        balanceOf[owner] += _value;
    }

    function _burn(uint256 _value) public {
        require(msg.sender == owner, "Only the owner can burn tokens");
        require(balanceOf[owner] >= _value, "Insufficient balance to burn");
        totalSupply -= _value;
        balanceOf[owner] -= _value;
    }
}
