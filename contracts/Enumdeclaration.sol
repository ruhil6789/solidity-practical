// SPDX-License-Identifer:MIT

pragma solidity ^0.8.0;

import "./StatusEnum.sol";
contract EnumImport {



    Status public status;



    function setStatus(Status _status) public {
        status = _status;
    }

    function getStatus() public view returns (Status) {
        return status;
    }
}
