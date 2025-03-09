// SPDX-License-Identifier: MIT
pragma solidity ^0.8.18;

contract Fund {

    uint256 public minimumUsd = 5;
    

    function fund() public payable {
    // allow users to send money
    // impose a minimum amount allowed
    // if the sender is not the contract owner, revert
    require(msg.value > 1e18, "$5 Minimum."); // 1e18 = 1 ETH = 1000000000000000000 WEI
    revert 
    }


    function withdraw() public {}
}