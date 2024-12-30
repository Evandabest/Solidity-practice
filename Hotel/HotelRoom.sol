
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {

    enum Statuses {Vacant, Occupied}

    Statuses currentStatus;

    event Occupy(address _occupant, uint _value);

    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
        currentStatus = Statuses.Vacant;
    }

    modifier status {
        require(owner != msg.sender, "You can't book your own room");
        require(currentStatus == Statuses.Vacant, "Currently occupied");
        _;
    }

    modifier costs(uint _amount) {
        require(msg.value >= 2 ether, "Not enough ether provided.");
        _;
    }

    function book() public status costs(2 ether) payable {
        owner.transfer(msg.value);
        currentStatus = Statuses.Occupied;
        
        emit Occupy(msg.sender, msg.value);
    }



}
