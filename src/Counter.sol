// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Counter {
    uint256 public chainId;
    uint256 public counter;

    constructor(uint256 _chainId, uint256 _counter) {
        chainId = _chainId;
        counter = _counter;
    }

    function incrementCounter() public {
        counter++;
    }
}
