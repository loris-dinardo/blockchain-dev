// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.20;

contract SimpleStorage {
    uint private number;

    function getNumber() external view returns (uint){
        return number;
    }

    function setNumber(uint _number) external {
        number = _number;
    }
}
