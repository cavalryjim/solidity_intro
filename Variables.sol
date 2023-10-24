// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//pragma solidity >=0.8.0 <0.9.0;

contract MyContract {
    // State Variables
    uint public myUint = 1; // stored on the Blockchain.  also requires gas!
    uint256 public myUint256 = 1;

    string public myString = "Hello World!";
    
    address public myAddress = 0x71C7656EC7ab88b098defB751B7401B5f6d8976F;

    struct MyStruct {
        uint myUint; 
        string myString;
    }

    MyStruct public myStruct = MyStruct(1, "Joe Momma");

    // Local Variables
    function getValue() public pure returns(uint) {
        uint value = 1;
        return value;
    }

}