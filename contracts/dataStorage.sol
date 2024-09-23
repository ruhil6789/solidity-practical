//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

// storage: variables is a state variable (store on the blockchain)
// memory:  variables is in memory and it exists while a function is being called
// calldata: special data location that contain function arguments
// Transient storage - data is cleared out after a transaction
contract DataStorage {
    uint[] public arr;
    mapping(uint => address) map;

    struct MyStruct {
        uint foo;
    }

    mapping(uint => MyStruct) myStructs;

    function f() public {}

    function _f(
        uint[] storage _arr,
        mapping(uint => address) storage _map
    ) internal returns (string memory) {
        return "hello";
    }

    // You can return memory variables
    function g(uint256[] memory _arr) public returns (uint256[] memory) {}

    function h(uint256[] calldata _arr) external {}

    // Function arguments that don't need modification:
    // Use calldata for function arguments that are read-only and don't need to be changed within the function.
    function sumArray(uint[] calldata numbers) public pure returns (uint) {
        uint sum = 0;
        for (uint i = 0; i < numbers.length; i++) {
            sum += numbers[i];
        }
        return sum;
    }

    // External function parameters:
    // Calldata is typically used for parameters of external functions.
    function processData(bytes calldata data) external {
        // Process the data without modifying it
    }
}
//
//  Use case of storage

// Persistent data storage:
// Use storage for data that needs to persist between function calls and throughout the lifetime of the contract.

contract SimpleStorage {
    uint256 public storedData; // This is a storage variable

    function set(uint256 x) public {
        storedData = x; // Modifies the storage variable
    }
}

// State variables:
// State variables are automatically stored in storage.

contract StateVariables {
    uint256 public stateVar; // Automatically stored in storage
    mapping(address => uint256) public balances; // Also in storage
}

// In mappings:
// Mappings are always stored in storage.

contract MappingStorage {
    mapping(address => uint256) public balances;

    function updateBalance(address user, uint256 newBalance) public {
        balances[user] = newBalance; // Modifies storage directly
    }
}

// Key points to remember:
// Memory is cheaper in terms of gas costs compared to storage.
// Data in memory exists only during function execution and is discarded afterwards.
// Use memory for temporary data that doesn't need to persist on the blockchain.
// Memory is suitable for intermediate calculations and temporary data structures.
