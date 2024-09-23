//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;

contract Mapping {
    // Maps are created with the syntax mapping(keyType => valueType).
    // The keyType can be any built-in value type, bytes, string, or any contract.
    // valueType can be any type including another mapping or an array.

    mapping(address => uint) public mymap;

    function get(address _address) public view returns (uint) {
        return mymap[_address];
    }

    function set(address _addr, uint _i) public {
        mymap[_addr] = _i;
    }

    function remove(address _addr) public {
        delete mymap[_addr];
    }
}

//  nested value

contract NestedMapping {
    mapping(address => mapping(uint => bool)) public nested;

    function get(address _addr, uint _i) public view returns (bool) {
        return nested[_addr][_i];
    }

    function set(address _addr1, uint _i, bool _boo) public {
        nested[_addr1][_i] = _boo;
    }

    function remove(address _addr1, uint _i) public {
        delete nested[_addr1][_i];
    }
    
}
