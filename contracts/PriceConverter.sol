// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import {AggregatorV3Interface} from "@chainlink/contracts/src/v0.8/shared/interfaces/AggregatorV3Interface.sol";

library PriceConverter {

    function getPrice() internal view returns(uint256) {
        // Address 0x694AA1769357215DE4FAC081bf1f309aDC325306
        // ABI
        AggregatorV3Interface priceFeed = AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306);
        (, int256 price,,,) = priceFeed.latestRoundData();
        // Price Feed In USD
        return uint256 (price * 1e10);
    }

    function getConversionRate(uint256 ethAmount) internal view returns(uint256) {
        uint256 ethPrice = getPrice();
        // 1e18 = 1 ether (0.000000000000000001 ether)
        uint256 ethAmountInUsd = (ethPrice * ethAmount ) / 1e18; // 1 wei for 9 decimals
        return ethAmountInUsd;
    }

    function getVersion() internal view returns (uint256) {
        //AggregatorV3Interface priceFeed =
        return AggregatorV3Interface(0x694AA1769357215DE4FAC081bf1f309aDC325306).version();
        
    }

}