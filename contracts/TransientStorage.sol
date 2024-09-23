// //SPDX-License-Identifier:MIT

// pragma solidity ^0.8.0;

// interface ITest{
//     function val() external view returns(uint);
//     function test() external;
// }

// contract callBack{
//     uint public val;
//     fallback() external{
//         val= ITest(msg.sender).val();
//     }

//     function test(address target) external{
//         ITest(target).test();
//    }
// }


// contract TestTransientStorage {
//     bytes32 constant SLOT = 0;

//     function test() public {
//         assembly {
//             tstore(SLOT, 321)
//         }
//         bytes memory b = "";
//         msg.sender.call(b);
//     }

//     function val() public view returns (uint256 v) {
//         assembly {
//             v := tload(SLOT)
//         }
//     }
// }