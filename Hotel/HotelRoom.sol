
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract HotelRoom {

    enum Statuses {Vacant, Occupied}
    //declares new data tyoe with variations //bnf:
    //‹statuses> ::= <vacant> | <Occupied>

    Statuses public currentStatus;
    //initializes a variable of type Statuses

    event Occupy(address _occupant, uint _value);
    //you can make events that trigger when certain
    //things happen. this basically will make a log
    //for the occupant and how much they paid

    address payable public owner;
    //payable is a modifer that lets 
    //this address recieve crypto

    constructor() {
        owner = payable(msg.sender);
        //setting the owner of this contract to the person
        //who deploys this contract
        currentStatus = Statuses.Vacant;
        //set the current status to vacant
    }

    modifier status {
        //modifers can be made and used to regulate functions
        //the require keyword basically does a boolean check,
        //similar to assert in c++
        require(owner != msg.sender, "You can't book your own room");
        //checks that the owner is not the one trying to book the room
        require(currentStatus == Statuses.Vacant, "Currently occupied");
        //checks for the status of the room
        _;
        //need to include this for modifier to work
    }

    modifier costs(uint _amount) {
        //modidifers can also take in parameters
        //this can allow dynamic functionality and reusability
        require(msg.value >= _amount, "Not enough ether provided.");
        //dynamically checks the price. 
        _;
    }

    function book() public status costs(2 ether) payable {
        //applied the status and costs modifers
        //need to include payable modifer since there is a
        //transaction occuring in this function

        //owner.transfer(msg.value);
        //the transfer attribute is called on the owner
        //msg.value is the amount of ether sent when executing the contract?!?1
        //there can be issues with transfer

        (bool sent, /*bytes memory data*/) = owner.call{value: msg.value}("For booking hotel");
        //call will take a value (value of the booking) and a message?
        //better way for transactions, bascially checks if the transaction 
        //went through or not
        //bool sent will get the status of the transaction
        //bytes memory data will be the data that it returns (nothing in this case)

        require(sent == true);


        currentStatus = Statuses.Occupied;
        //chages status

        emit Occupy(msg.sender, msg.value);
        //have to use the keyword emit to trigger an event

    }



}
