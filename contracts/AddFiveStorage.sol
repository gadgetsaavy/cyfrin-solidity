// SPDX-License-Identifier: MIT

pragma solidity ^0.8.16;

import { SimpleStorage } from "contracts/SimpleStorage.sol";

contract AddFiveStorage is SimpleStorage {
    // +5
    // overrides
    // virtual override
    function store(uint256 _newNumber) public override {
        myFavoriteNumber = _newNumber + 5;
    }
}