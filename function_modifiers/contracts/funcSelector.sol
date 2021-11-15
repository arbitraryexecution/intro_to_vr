//SPDX-License-Identifier: Unlicense
pragma solidity ^0.8.0;

import "hardhat/console.sol";

contract Something {
    address public owner;
    uint blockNumber = 1337;
    constructor() {
        owner = msg.sender;
    }

    function foo() public view returns (uint) {
        return 1;
    }

    function bar() public pure returns (uint) {
        return 2;
    }

    function baz() external pure returns (uint) {
        return 3;
    }

    function x() internal pure returns (uint) {
        return 4;
    }

    function y() private pure returns (uint) {
        return 5;
    }

    function z() public payable returns (uint) {
        return 6;
    }
}
