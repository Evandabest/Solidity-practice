
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//inheritence and smart contract interactions

contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _;
        //declares a modifier tha requires the call of 
        //this contract to also be the owner
    }

    

    constructor() {
        owner = msg.sender;
        //person who deployed the contract
    }
}

contract SecretVault {
    //this contract will store secret value
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
        //initalize the secret with the value given
    }

    function getSecret() public view returns(string memory) {
        return secret;
        //getter function for the secret
    }

}

contract con1 is Ownable {
    //is ownable lets this contract inherit the properties,
    //functions and constructors from the Ownable contract 

    //factory: deploys smart contract within another smart contract

    address secretVault;

    constructor(string memory _secret) {
        SecretVault _secretVault = new SecretVault(_secret);
        secretVault = address(_secretVault);
        super;
    }

    function getSecret() public view returns(string memory) {
        return SecretVault(secretVault).getSecret();
    }


}

