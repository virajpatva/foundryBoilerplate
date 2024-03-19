// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

pragma solidity ^0.8.18;
import {Script, console} from "forge-std/Script.sol";

contract HelperConfig is Script {
    uint32 public constant SEPOLIA_CHAIN_ID = 11155111;
    uint32 public constant AMOY_CHAIN_ID = 80002;
    uint32 public constant MUMBAI_CHAIN_ID = 80001;
    uint32 public constant ANVIL_CHAIN_ID = 31337;

    // network helper config to illustrate let our smart contract counter start from ChainID
    struct NetworkConfig {
        uint256 chainId;
        uint32 counter;
    }

    NetworkConfig public activeNetworkConfig;

    constructor() {
        if (block.chainid == SEPOLIA_CHAIN_ID) {
            activeNetworkConfig = getSepoliaEthConfig();
        } else if (block.chainid == MUMBAI_CHAIN_ID) {
            activeNetworkConfig = getMumbaiEthConfig();
        } else if (block.chainid == AMOY_CHAIN_ID) {
            activeNetworkConfig = getAmoyEthConfig();
        } else {
            activeNetworkConfig = getorCreateAnvilEthConfig();
        }
    }

    function getSepoliaEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory sepoliaConfig = NetworkConfig({
            chainId: SEPOLIA_CHAIN_ID,
            counter: 1
        });
        return sepoliaConfig;
    }

    function getMumbaiEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory mumbaiConfig = NetworkConfig({
            chainId: MUMBAI_CHAIN_ID,
            counter: 1
        });
        return mumbaiConfig;
    }

    function getAmoyEthConfig() public pure returns (NetworkConfig memory) {
        NetworkConfig memory amoyConfig = NetworkConfig({
            chainId: AMOY_CHAIN_ID,
            counter: 1
        });
        return amoyConfig;
    }

    function getorCreateAnvilEthConfig() public returns (NetworkConfig memory) {
        vm.startBroadcast();
        //deploy the mocks or any other config if required
        vm.stopBroadcast();

        NetworkConfig memory anvilConfig = NetworkConfig({
            chainId: ANVIL_CHAIN_ID,
            counter: 1
        });

        return anvilConfig;
    }
}
