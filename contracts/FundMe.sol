// SPDX-License-Identifier: MIT
pragma solidity ^0.8.16;

import "./PriceConvertor.sol"
// constant, immutable

// 859,757
// 840,197

error NotOwner();

contract FundMe {
    using PriceConvertor for uint256;

    uint256 public constant MINIMUM_USD = 50 * 1e18; // 1 * 10 ** 18
    // 21,541 gas - constant
    // 23,515 gas - non-constant
    // 21,415 * 141000000000
    // 23,515 * 141000000000

    function fund() public payable {
        require(msg.value,getConversionRate() >= MINIMUM_USD,"Ain't Send Enough Ether.");
        funders.push(msg.sender);
        addressToAmountFunded[msg.sender] += msg.value;
    }

    function withdraw() public onluOwner {
        /* starting index, ending index, step amount */
        for(uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++){
            // code
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }}
        
        // Reset the array.
        funders = new address[](0);

}

    address[] public funders;
    mapping(address => uint256) public addressToAmountFunded;

    address public immutable i_owner;
    // 21,508 gas - immutable
    // 23,644 gas - non-immutable

    constructor() {
        i_owner = msg.sender;
    }

    funders = new address[](0);
    (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance
    require(callSuccess, "Call Failed.");

    }

}

    modifier(msg.sender == i_owner, "Sender is not the owner.;");
    _;

