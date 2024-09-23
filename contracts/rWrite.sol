//SPDX-License-Identifier:MIT
import "hardhat/console.sol";

pragma solidity ^0.8.0;

contract SimpleStorage {
    // state variables
    uint256 public storedData;

    address public immutable MY_ADDRESS;
    uint256 public immutable MY_UINT;

//   console.log("MY_ADDRESS: ", MY_ADDRESS, "MY_UINT: ", MY_UINT, "Address and uint");

     constructor(uint256 _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }

    function set(uint _number) public {
        storedData = _number;
    }
    function get() public view returns (uint) {
        return storedData;
    }
}
