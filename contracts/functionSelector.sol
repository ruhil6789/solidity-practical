// When a function is called, the first 4 bytes of calldata specifies which function to call.
// This 4 bytes is called a function selector.

// SPDX-License-Identifer:MIT
pragma solidity ^0.8.0;
contract FunctionSelector {
    function getSelector(string calldata _func) external pure returns (bytes4) {
        return bytes4(keccak256(bytes(_func)));
    }
}

// Direct function calls:
// Function selectors allow you to call specific functions using their 4-byte identifier.

contract Example {
    function foo(uint256 a) public pure returns (uint256) {
        return a * 2;
    }

    function callFoo(uint256 a) public returns (bool, bytes memory) {
        return address(this).call(abi.encodeWithSelector(this.foo.selector, a));
    }
}

// function selectors can be used for low-level calls, interface interactions, proxy implementations, gas optimizations, and dynamic dispatching in Solidity smart contracts.

// Interface definitions:
// Function selectors are useful when defining interfaces for external contracts.
interface IERC20 {
    function transfer(
        address recipient,
        uint256 amount
    ) external returns (bool);
}

contract TokenInteraction {
    function interactWithToken(
        address tokenAddress,
        address recipient,
        uint256 amount
    ) external {
        (bool success, ) = tokenAddress.call(
            abi.encodeWithSelector(IERC20.transfer.selector, recipient, amount)
        );
        require(success, "Transfer failed");
    }
}

// Gas optimization:
// Using function selectors can sometimes be more gas-efficient than full function signatures.

contract GasOptimized {
    bytes4 private constant TRANSFER_SELECTOR =
        bytes4(keccak256("transfer(address,uint256)"));

    function optimizedTransfer(
        address token,
        address recipient,
        uint256 amount
    ) external {
        (bool success, ) = token.call(
            abi.encodeWithSelector(TRANSFER_SELECTOR, recipient, amount)
        );
        require(success, "Transfer failed");
    }
}

// keccak256
// bytes32 hash = keccak256(abi.encodePacked(data));

// You can hash various data types by using abi.encodePacked() or abi.encode():
// bytes32 hash = keccak256(abi.encodePacked(string, uint, address));
