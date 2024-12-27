
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Counter {
    uint count; // unsigned integer

    constructor() {
        //constructor to initialize the smart contract
        //constructor gets run once when the smart contract runs
        count = 0;
    }


    function getCount() public view returns (uint) {
    // function name  visability  type. return type

    //read functions are free?

        return count;
    }

    function incrementCount() public {
        //write is not free, costs gas
        count = count + 1;
    }

}