// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//pragma solidity >=0.8.0 <0.9.0;

contract Counter {
    // Code goes here.
    uint public count = 0; // a positive integer. state variable is written to the Blockchain & requires gas

    // constructor() {
    //     count = 0;
    // }

    // function getCount() public view returns(uint) {
    //     return count;
    // }

    function incrementCount() public {
        count = count + 1;
    }


}

