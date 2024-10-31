// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract YachtRental {

    address payable public owner;
    bool public available;
    uint public ratePerDay;

    event Log(address indexed sender, string message);

    constructor() {
        owner = payable(msg.sender);
        available = true;
        ratePerDay = 2 ether;
    }

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be the owner!");
        _;
    }

    function bookYacht(uint numDays) public payable {
        uint minOffer = ratePerDay * numDays;
        require(msg.value >= minOffer, "Take yo broke butt home");
        // owner.transfer(msg.value);
        (bool sent, ) = owner.call{value: msg.value}("");
        require(sent, "The transaction did not complete");
        available = false;
    }

    function makeYachtAvailable() public onlyOwner {
        // require(msg.sender == owner, "Only the owner can make it available.");
        available = true;
    }

    function updateRate(uint newRate) public onlyOwner {
        ratePerDay = newRate;
        emit Log(msg.sender, "Owner updated yacht rate.");
    }

}