
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping {

    //mappings aka dictonary in python
    //mapping(key => value) myMapping ;

    mapping(uint => string) public names;

    constructor () {
        names[1] = "Adam";
        names[2] = "John";
    }

    mapping (uint => Book) public books;
    mapping (address => mapping(uint => Book)) public myBooks;


    struct Book {
        string title;
        string author;
    }

    function addBook (
        uint256 _id,
        string memory _title, 
        string memory _author
        ) public {
        books[_id] = Book(_title,_author);
        //common practice for Solidity to use _ to signify local variables
    }

    function addMyBook (
        uint256 _id,
        string memory _title, 
        string memory _author
        ) public {
        myBooks[msg.sender][_id] = Book(_title,_author);
        //msg is a global variable, msg's sender attribute
        //is the eth address of whoever executes this sc
    }

    

}