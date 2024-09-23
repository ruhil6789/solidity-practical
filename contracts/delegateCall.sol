// delegatecall is a low level function similar to call.

// When contract A executes delegatecall to contract B, B's code is executed

// with contract A's storage, msg.sender and msg.value.

//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract B {
    uint public num;
    address public sender;
    uint public value;

    function setVars(uint _nums) public payable {
        num = _nums;
        sender = msg.sender;
        value = msg.value;
    }
}

contract A {
    uint256 public num;
    address public sender;
    uint256 public value;

    function setVars(address _contract, uint _num) public payable {
        (bool success, bytes memory data) = _contract.delegatecall(
            abi.encodeWithSignature("setVars(uint)", _num)
        );
    }
}

// delegate call use
//     Upgradeability patterns:
// Delegatecall is commonly used in proxy patterns for upgrading smart contracts without losing data. A proxy contract can delegatecall to an implementation contract, allowing the logic to be upgraded while preserving state.
//     Library usage:
// Solidity libraries are deployed once and their code is reused through delegatecall. This allows multiple contracts to share common functionality without duplicating code.

// Cross-chain communication:
// In some advanced scenarios, delegatecall can be used to enable communication between contracts on different blockchain networks.

// Implementing complex logic:
// When a contract needs to execute complex logic that's stored in another contract without changing the context (msg.sender, msg.value, etc.).
