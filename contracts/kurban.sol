// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract KurbanContract {
    mapping(address => uint) public balances;

    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function withdraw() public {
        uint balance = balances[msg.sender];
        require(balance > 0);

        (bool sent, ) = msg.sender.call{value: balance}("");
        require(sent, "Failed to send Ether");

        balances[msg.sender] = 0;
    }

}
