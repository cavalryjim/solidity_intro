// SPDX-License-Identifier: MIT
pragma solidity >=0.8.0 <0.9.0;

contract YachtRental {
    // state variables
    address payable public owner;
    bool public available;
    uint public ratePerDay;

    event Log(address indexed sender, string message);

    constructor() {
        owner = payable(msg.sender);
        available = true;
        ratePerDay = 3 ether;
    }

    // Modifier to check that the caller is the owner of the contract.
    modifier onlyOwner() {
        require(msg.sender == owner, "Must be contract owner to call this function");
        _;
    }

    function bookYacht(uint numDays) public payable {
        // Check availability
        require(available, "Yacht is not available.");

        // Check payment amount
        uint minOffer = ratePerDay * numDays;
        require(msg.value >= minOffer, "Not enough ether provided.");

        // Recieve payment
        // owner.transfer(msg.value);
        (bool sent, bytes memory data) = owner.call{value: msg.value}("");
        if (sent) {
            available = false;
            emit Log(msg.sender, "Yacht has been booked.");
        }
        // available = false;
    }

    function updateRate(uint newRate) public onlyOwner {
        // require(msg.sender == owner, "Only the contract owner can change the rate.");
        ratePerDay = newRate;
        emit Log(msg.sender, "Owner updated yacht rate.");
    }

    function makeYachtAvailable() public onlyOwner {
        // require(msg.sender == owner, "Only the yacht owner can make it available.");
        available = true;
        emit Log(msg.sender, "Be more yachty. Rent my yacht.");
    }

}