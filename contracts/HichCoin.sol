// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract HichCoin {

    address public contract_owner;
    mapping(address => uint) public balances;
    mapping(address => uint256) public allowances;

    constructor() {
        contract_owner = msg.sender;
        balances[contract_owner] = 1000000;
    }

    function name() public pure returns (string memory) {
        return "HichCoin";
    }

    function symbol() public pure returns (string memory){
        return "HICH";
    }

    function decimals() public pure returns (uint8){
        return 8;
    }

    function total_supply() public pure returns (uint256){
        return 1000000;
    }

    function balanceOf(address owner) public view returns (uint256 balance){
        return balances[owner];
    }

    function change_owner(address new_owner) public {
        require(msg.sender == contract_owner, "Operation not allowed");
        contract_owner = new_owner;
    }

    function transfer(address _to, uint _value) public returns (bool success){
        require(this.balanceOf(msg.sender)>= _value, "Insufficient balance");
        balances[_to] += _value;
        balances[msg.sender] -= _value;
        return success;
    }
}
