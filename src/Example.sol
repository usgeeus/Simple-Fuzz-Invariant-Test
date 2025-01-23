// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Example {
    uint256 public shouldAlwaysBeZero = 0;

    uint256 private hiddenValue = 0;

    function doStruff(uint256 data) public {
        if (data == 2) {
            shouldAlwaysBeZero = 1;
        }
        if (hiddenValue == 7) {
            shouldAlwaysBeZero = 1;
        }
        hiddenValue = data;
    }
}
