// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import {Test, console} from "forge-std/Test.sol";
import {Example} from "../src/Example.sol";
import {StdInvariant} from "forge-std/StdInvariant.sol";

contract ExampleTest is StdInvariant, Test {
    Example public example;

    function setUp() public {
        example = new Example();
        targetContract(address(example));
    }

    /// ** Unit Test Example
    function testAlwaysZero() public {
        uint256 data = 0;
        example.doStruff(data);
        assertEq(
            example.shouldAlwaysBeZero(),
            0,
            "shouldAlwaysBeZero should be 0"
        );
    }

    /// ** Fuzzing Test Example
    function testAlwaysZeroFuzz(uint256 data) public {
        example.doStruff(data);
        assertEq(
            example.shouldAlwaysBeZero(),
            0,
            "shouldAlwaysBeZero should be 0, fuzz test"
        );
    }

    /// ** Invariant Test Example
    /// * 1. Import StdInvariant
    /// * 2. Inherit StdInvariant
    /// * 3. Tell foundry which contract to call random functions on. Since we have on contract with one function, we're going to tell foundry that the contract should be called and it's allowed to call any of the functions in the contract. // targetContract()

    function invariant_testAlwaysZero() public {
        assertEq(
            example.shouldAlwaysBeZero(),
            0,
            "shouldAlwaysBeZero should be 0, invariant test"
        );
    }
}
