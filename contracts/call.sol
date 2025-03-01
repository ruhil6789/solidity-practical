// call is a low level function to interact with other contracts.

// Few reasons why low-level call is not recommended
// Reverts are not bubbled up
// Type checks are bypassed
// Function existence checks are omitted

//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Reciever {
    event Received(address caller, uint amount, string message);
    fallback() external payable {
        emit Received(msg.sender, msg.value, "Fallback was called");
    }

    function foo(
        string memory _message,
        uint _x
    ) public payable returns (uint) {
        emit Received(msg.sender, msg.value, _message);
        return _x + 1;
    }
}

contract Caller {
    event Response(bool success, bytes data);

    function testCallFoo(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call{
            value: msg.value,
            gas: 5000
        }(abi.encodeWithSignature("foo(string,uint)", "call foo", 123456));

        emit Response(success, data);
    }

    // Calling a function that does not exist triggers the fallback function.
    function testCallDoesNotExist(address payable _addr) public payable {
        (bool success, bytes memory data) = _addr.call{value: msg.value}(
            abi.encodeWithSignature("doesNotExist()")
        );

        emit Response(success, data);
    }
}
