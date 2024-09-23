// SPDX_License-Identifier:MIT

pragma solidity ^0.8.0;

contract Array {
    uint[] public arr;
    uint[] public arr2 = [1, 2, 3, 4];

    uint[10] public myFixedSizeArr;

    function getArr(uint i) public view returns (uint) {
        return arr[i];
    }

    function getArr() public view returns (uint[] memory) {
        return arr;
    }

    function insertToArray(uint i) public {
        arr.push(i);
    }

    function popFromArray() public {
        arr.pop();
    }

    function getLength() public view returns (uint) {
        return arr.length;
    }

     function remove(uint256 index) public {
      
        delete arr[index];
    }

    function examples() external {
        // create array in memory, only fixed size can be created
        uint256[] memory a = new uint256[](5);
    }
}
