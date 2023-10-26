// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract YachtRental {

    address payable public owner;
    bool public available;

    event Booked(address _occupant, string _message);

    constructor() {
        owner = payable(msg.sender);
        available = true;
    }

    modifier onlyWhenAvailable {
        require(available, "Yacht is not available.");
        _;
    }

    function bookYacht(uint numDays) public payable onlyWhenAvailable {
        // Check status
        // require(available, "Yacht is not available.");

        // Check price
        uint minOffer = 2 ether * numDays;
        require(msg.value >= minOffer, "Not enough ether provided.");

        // owner.transfer(msg.value);
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        require(sent);
        available = false;

        emit Booked(msg.sender, "The yacht has been booked.");
    }

    function makeYachtAvailable() public {
        require(msg.sender == owner, "Only the yacht owner can make it available.");
        available = true;
    }


}