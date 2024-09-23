//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
contract DataTypes {
    // boolean
    // uint256
    // int256
    // address

    bool public foo = true;

    uint public u8 = 1;
    uint public u256 = 456;
    uint public u = 123;

    int8 public i8 = -1;
    int256 public i256 = 456;
    int256 public i = -123; // int is same as int256

    // minimum and maximum of int
    int256 public minInt = type(int256).min;
    int256 public maxInt = type(int256).max;

    address public addr = 0xCA35b7d915458EF540aDe6068dFe2F44E8fa733c;

    // Default values
    // Unassigned variables have a default value
    bool public defaultBoo; // false
    uint256 public defaultUint; // 0
    int256 public defaultInt; // 0
    address public defaultAddr; // 0x0000000000000000000000000000000000000000

    // variables  in solidity

    // local variables:
    //  declare inside the function
    //  not stored on the blockchain

    // state variable:
    //     declared outside the function
    //  stored on the blockchain

    // global variables:
    // provides information about the  blockchain

    uint256 public num = 123;
    string public text = "hello";

    function doSomething() public {
        // local variables

        uint i = 123;

        //  global variables
        uint timestamp = block.timestamp;
        address sender = msg.sender;
    }

    // constant: are variables that cannt be modified
    // it can save gas

    address public constant myaddress =
        0x777788889999AaAAbBbbCcccddDdeeeEfFFfCcCc;
    uint public constant no = 1234567890;

    // immutable:  can be modified only once  , they are just like constant, they are set inside the constructor but cannot be modified afterwards
    address public immutable MY_ADDRESS;
    uint256 public immutable MY_UINT;

    constructor(uint256 _myUint) {
        MY_ADDRESS = msg.sender;
        MY_UINT = _myUint;
    }
}
