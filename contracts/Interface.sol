// Interface

// cannot have any functions implemented
// can inherit from other interfaces
// all declared functions must be external
// cannot declare a constructor
// cannot declare state variables

//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
contract Counter {
    uint public count;
    function increment() external{
        count +=1;
    }
}

interface ICounter {
    function count() external view returns(uint);
    function increment() external;
}
contract MyContract {
    function incrementCounter(address _counter) external {
        ICounter(_counter).increment();
    }

    function getCount(address _counter) external view returns (uint256) {
        return ICounter(_counter).count();
    }
}