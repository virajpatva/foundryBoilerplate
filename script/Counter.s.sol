// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Script, console} from "forge-std/Script.sol";
import {HelperConfig} from "./HelperConfig.s.sol";
import {Counter} from "../src/Counter.sol";

contract CounterScript is Script {
    // if required can create a setup here
    function setUp() public {}

    function run() external returns (Counter) {
        HelperConfig helperConfig = new HelperConfig();
        (uint256 chainId, uint32 counter) = helperConfig.activeNetworkConfig();
        console.log(chainId, counter);
        console.log(msg.sender);
        vm.startBroadcast();
        Counter counterContract = new Counter(chainId, counter);
        vm.stopBroadcast();
        return counterContract;
    }
}
