// Library

// they are  similar to contracts, but you cant declarte any state variable and you cannot send ether

// SPDX-License-Identifer:MIT

pragma solidity ^0.8.0;

library math {
    function sqrt(uint y) internal pure returns (uint z) {
        if (y > 3) {
            z = y;
            uint x = y / 2 + 1;
            while (x < z) {
                z = x;
                x = (y / x + x) / 2;
            }
        } else if (y != 0) {
            z = 1;
        }
    }
}


contract testmath{
    function testSqrt(uint x) public pure returns(uint){
        return math.sqrt(x);
    }
}




