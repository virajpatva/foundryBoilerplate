// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Counter} from "../src/Counter.sol";
import {HelperConfig} from "../script/HelperConfig.s.sol";

contract CounterTest is Test {
    Counter public counterContract;
    uint256 public ChainId;

    function setUp() public {
        HelperConfig helperConfig = new HelperConfig();
        (uint256 chainId, uint32 counter) = helperConfig.activeNetworkConfig();
        counterContract = new Counter(chainId, counter);
        ChainId = chainId;
    }

    function test_Increment() public {
        counterContract.incrementCounter();
        assertEq(counterContract.counter(), 2);
    }

    function test_ChainId() public view {
        counterContract.chainId();
        assertEq(counterContract.chainId(), ChainId);
    }
}
