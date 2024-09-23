//SPDX-License-Identifier:MIT

pragma solidity ^0.8.0;
contract gas {
    //  how much ether do you need to pay for the tx;
    //  gas spent * gas price
    //  gas= unit of computation
    //  gas  spent=  total amount of gas is used in a transaction
    //  gas price = is how much  ether you are willing to pay per gas
    // Transactions with higher gas price have higher priority to be included in a block.
    // Unspent gas will be refunded.
    //  gas limit = is the maximum amount of gas that can be used in a transaction.
    // Gas spent are not refunded.
    uint public i = 0;

    function forever() public {
        while (true) {
            i += 1;
        }
    }


    function foo(uint256 x) public pure returns (uint256) {
        if (x < 10) {
            return 0;
        } else if (x < 20) {
            return 1;
        } else {
            return 2;
        }
    }

    function ternary(uint256 _x) public pure returns (uint256) {
        // if (_x < 10) {
        //     return 1;
        // }
        // return 2;

        // shorthand way to write if / else statement
        // the "?" operator is called the ternary operator
        return _x < 10 ? 1 : 2;
    }


        function loop() public {
        // for loop
        for (uint256 i = 0; i < 10; i++) {
            if (i == 3) {
                // Skip to next iteration with continue
                continue;
            }
            if (i == 5) {
                // Exit loop with break
                break;
            }
        }

        // while loop
        uint256 j;
        while (j < 10) {
            j++;
        }
    }
}
