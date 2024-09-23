//SPDx-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Modifier {
    address public owner;
    uint public x = 10;
    bool public locked;

    constructor() {
        owner = msg.sender;
    }

    // Up to 3 parameters can be indexed.
    // Indexed parameters helps you filter the logs by the indexed parameter

    event Log(address indexed sender, string message);
    event AnotherLog();
    modifier onlyOwner() {
        require(msg.sender == owner, "Only owner can call this function");
        // a function modifier and it tells Solidity to
        // execute the rest of the code.
        _;
    }
    modifier changeOwner(address _owner) {
        require(_owner != address(0), "not valid address");
        _;
    }

    function NewOwner(
        address _newOwner
    ) public onlyOwner changeOwner(_newOwner) {
        owner = _newOwner;
    }

    modifier noReentrancy() {
        require(!locked, "no  reetrancy");
        locked = true;
        _;
        locked = false;
    }

    function decrement(uint i) public noReentrancy {
        x -= i;
        if (i > 1) {
            decrement(i - 1);
        }
    }

    // Event filtering and monitoring for real-time updates and analytics
    // Event log analysis and decoding for data extraction and processing
    // Event-driven architectures for decentralized applications (dApps)
    // Event subscriptions for real-time notifications and updates
    
    function testEvent() public {
        emit Log(msg.sender, "hello world");
        emit AnotherLog();
        emit Log(msg.sender, "world");
    }
}
