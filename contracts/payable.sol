// Functions and addresses declared payable can receive ether into the contract.


//SPX-License-Identifier:MIT
pragma solidity ^0.8.0;

contract Payable{

  address payable public owner;

    constructor()payable{
        owner= payable(msg.sender);
    }
    function deposit()  public payable{}
    function notPayable() public{}

    function withdraw() public{
         uint amount = address(this).balance;
        (bool success,) = owner.call{value:amount}("");
        require(success, "Failed to send ether");
    }

    // Function to transfer Ether from this contract to address from input
    function transfer(address payable _to, uint256 _amount) public {
        // Note that "to" is declared as payable
        (bool success,) = _to.call{value: _amount}("");
        require(success, "Failed to send Ether");
    }
}