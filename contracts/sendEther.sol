// transfer (2300 gas, throws error)
// send (2300 gas, returns bool)
// call (forward all gas or set gas, returns bool)

// A contract receiving Ether must have at least one of the functions below

// receive() external payable
// fallback() external payable

//SPDX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract RecieveEther {
    // Function to receive Ether. msg.data must be empty

    // recieve() external payable{};

    // Fallback function is called when msg.data is not empty
    fallback() external payable {}

    function getBalance() public view returns (uint) {
        return address(this).balance;
    }
}

// fallback is a special function that is executed either when

// a function that does not exist is called or
// Ether is sent directly to a contract but receive() does not exist or msg.data is not empty
// fallback has a 2300 gas limit when called by transfer or send.

contract sendEther {
    event Log(string func, uint gas);

    // Fallback function must be declared as external.
    fallback() external payable {
        // send / transfer (forwards 2300 gas to this fallback function)
        // call (forwards all of the gas)
        emit Log("fallback", gasleft());
    }

    // Receive is a variant of fallback that is triggered when msg.data is empty
    receive() external payable {
        emit Log("receive", gasleft());
    }

    // Helper function to check the balance of this contract
    function getBalance() public view returns (uint256) {
        return address(this).balance;
    }

    function sendViaTransfer(address payable _to) public payable {
        _to.transfer(msg.value);
    }

    function sendViaSend(address payable _to) public payable {
        // Send returns a boolean value indicating success or failure.
        // This function is not recommended for sending Ether.
        bool sent = _to.send(msg.value);
        require(sent, "failed to send ether");
    }

    function sendViaCall(address payable _to) public payable {
        (bool sent, bytes memory data) = _to.call{value: msg.value}("");
        require(sent, "Failed to send Ether");
    }

    function withdraw() public {
        uint amount = address(this).balance;
        payable(msg.sender).transfer(amount);
    }

    // Sending Ether with additional data:

    function sendWithData(
        address payable recipient,
        uint amount,
        bytes memory data
    ) public {
        (bool success, ) = recipient.call{value: amount}(data);
        require(success, "Transfer failed");
    }

    // function getBalance() public view returns (uint) {
    //     return address(this).balance;
    // }
}
