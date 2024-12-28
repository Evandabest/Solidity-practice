

// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract myContract {
    // variables are ways to store information

    //state vs local variables

    //state variables
    uint public myUint = 1;
    //this variable is stored on the blockchain forever.
    //contract scope


    //local variables

    function getValue() public pure returns (uint) {
        //it is a pure function because it does not modify the blockchain
        //just performs some calculation
        uint value = 1; //this is a local variable, function scope only
        return value;
    }

    uint256 two56 = 259; //can store 256 bytes
    uint8 myUint8 = 2; //only 8 byte
    int256 myInt = -90; // numbers can be negative

    string cat = "cat"; //string
    
    bytes32 myBytes32 = "Hello, World!"; //treats like an array?
    

    address myAddress = 0x5B38Da6a701c568545dCfcB03FcB875f56beddC4;
    //stores wallet, token, contract address

    struct myStruct {
        address addy;
        uint balance;
    }
    //structs let you make custom data types

    myStruct mystruct = myStruct(0x5B38Da6a701c568545dCfcB03FcB875f56beddC4, 234);

    uint[] public uintArray = [1,2,3,4];
    string[] public stringArray = ["one", "two"];
    string[] public myArray;

    function addValue (string memory value) public {
        myArray.push(value);
    }

    function arrayCount () public view returns (uint) {
        return myArray.length;
    }

    //2d arrays
    uint[][] public twod = [[1, 3], [4,5]];
    


}