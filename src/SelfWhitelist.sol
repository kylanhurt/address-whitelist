// SPDX-License-Identifier: MIT

pragma solidity ^0.8.18;

import {console} from "forge-std/Test.sol";

contract SelfWhitelist {
    address[] public whitelistedAddresses;

    function addToWhitelist() public {
        console.log("adding address", msg.sender);
        for (uint256 i = 0; i < whitelistedAddresses.length; i++) {
            if (msg.sender == whitelistedAddresses[i]) {
                console.log("address already in list:", msg.sender);
                return;
            }
        }
        whitelistedAddresses.push(msg.sender);
    }

    function check() public view returns (bool) {
        for (uint256 i = 0; i < whitelistedAddresses.length; i++) {
            if (msg.sender == whitelistedAddresses[i]) {
                console.log("address already in list:", msg.sender);
                return true;
            }
        }
        return false;
    }

    function getAddresses() public view returns (address[] memory) {
        for (uint8 i = 0; i < whitelistedAddresses.length; i++) {
            console.log(whitelistedAddresses[i]);
        }
        return whitelistedAddresses;
    }
}
