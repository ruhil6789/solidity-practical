// Contract can call other contracts in 2 ways.

// The easiest way to is to just call it, like A.foo(x, y, z).

// Another way to call other contracts is to use the low-level call.

//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
contract A {
    uint public x;
    uint public value;

    function set(uint _x) public returns (uint) {
        x = _x;
        return x;
    }

    function setXandSendEther(uint _x) public payable returns (uint, uint) {
        x = _x;
        value = msg.value;
        return (x, value);
    }
}

contract B {
    function setX(A _a, uint _x) public {
        uint x = _a.set(_x);
    }

    function setXFromAddress(address _addr, uint _x) public {
        A a = A(_addr);
        a.set(_x);
    }

    function setXAndSendEther(A _a, uint _x) public payable {
        (uint x, uint value) = _a.setXandSendEther{value: msg.value}(_x);
    }
}
