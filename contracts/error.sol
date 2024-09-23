// require is used to validate inputs and conditions before execution.
// revert is similar to require. See the code below for details.
// assert is used to check for code that should never be false. Failing assertion probably means that there is a bug.

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Error {
    function testRequire(uint _i) public pure {
        require(_i > 10, "input must be greater than 10");
    }

    function testRevert(uint _j) public pure {
        if (_j <= 10) {
            revert("input must be greater than 10");
        }
    }

    uint public num;
    function testAssert() public view {
        // Assert should only be used to test for internal errors,
        assert(num == 0);
    }

    // custom error
    error InsufficientBalance(uint256 balance, uint256 withdrawAmount);

    function testbalance(uint balance, uint withdrawAmount) public view {
        uint bal = address(this).balance;
        if (withdrawAmount > bal) {
            revert InsufficientBalance({
                balance: bal,
                withdrawAmount: withdrawAmount
            });
        }
    }
}
