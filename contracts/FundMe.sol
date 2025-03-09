// SPDX-License-Identifier: MIT

pragma solidity ^0.8.8;

import {PriceConvertor} from "./PriceConvertor.sol";

contract FundMe {
    using PriceConverter for uint256;

    uint256 public minimumUsd = 5e18;

    address[] public funders;
    mapping(address => uint256 amountFunded) public addressToAmountFunded;

    address public immutable owner;

    constructor() {
        owner = msg.sender;
    }

    function fund() public payable {
    require(msg.value.getConversionRate >= minimumUsd, "Didn't send enough ETH."); // 1e18 = 1 eth = 1000000000000000000 wei
    funders.push(msg.sender);
    addressToAmountFunded[msg.sender] += msg.value;
    }

    modifier onlyOwner() {
            require(msg.sender == owner, "Unauthorized.");
            _;
    }

    function withdraw() public onlyOwner {
        //require(msg.sender == owner, "Unauthorized.");
        // for loop
        // 1, 2, 3, 4 element
        // 0, 1, 2, 3 index
        for(/*comments in here */ uint256 funderIndex = 0; funderIndex < funders.length; funderIndex++) {
            address funder = funders[funderIndex];
            addressToAmountFunded[funder] = 0;
        }
        funders = new address[](0);
        // withdraw the funds

        //transfer
        // payable(msg.sender).transfer(address(this).balance);
        // //send
        // bool sendSuccess = payable(msg.sender).send(address(this).balance);
        // require(sendSuccess, "Send Failed.");
        //call
        (bool callSuccess, ) = payable(msg.sender).call{value: address(this).balance}("");
        require(callSuccess, "Call Failed");
        }

        fallback() external payable {
            fund();
        }

        receive() external payable {
            fund();
        }
    }