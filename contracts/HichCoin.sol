// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract HichCoin {

    address public contract_owner;
    mapping(address => uint) public balances;
    mapping(address => mapping(address => uint)) public allowances;

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

    function transfer(address _to, uint _value) public returns (bool){
        require(this.balanceOf(msg.sender)>= _value, "Insufficient balance");
        balances[_to] += _value;
        balances[msg.sender] -= _value;
        return true;
    }

    function approve(address _spender, uint256 _value) public returns (bool){
        allowances[msg.sender][_spender] = _value;
        return true;
    }

    function allowance(address _owner, address _spender) public view returns (uint256 remaining){
        return allowances[_owner][_spender];
    }

    function transferFrom(address _from, address _to, uint256 _value) public returns(bool){
        require(allowances[_from][_to] >= _value, "Insufficient allowance");
        require(balances[_from] >= _value, "Insufficient funds");
        balances[_from] -= _value;
        balances[_to] += _value;
        allowances[_from][_to] -= _value;
        return true;
    }
}
