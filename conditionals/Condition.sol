
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Condition {
    //conditionals

    uint[] public nums = [1,2,3,4,5,6,7,8,9,10];

    address public owner;

    constructor() { 
         owner = msg.sender;
    }
    //creates the "owner" of the contract

    //common practice to make contracts "ownable"
    //to give users special privledge

    function isOwner() public view returns (bool) {
        return (msg.sender == owner); 
        //sender of the current sender compared to
        //the owner of the contract (defined in the 
        //constructor
    }

    function isEvenNum (uint _number) public pure returns (bool) {

        if (_number%2 == 0) {
            return true;
        } else {
            return false;
        }
        //return _number%2 == 0;
    }

    function countEvenNum() public view returns (uint) {
        uint count = 0;

        for (uint i = 0; i < nums.length; i++) {
            if (isEvenNum(nums[i]) == true) {
                count++;
            }
        }

        return count;
    }
    

    
}