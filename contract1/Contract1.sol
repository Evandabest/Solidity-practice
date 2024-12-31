
// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

//inheritence and smart contract interactions

contract Ownable {
    address public owner;

    modifier onlyOwner() {
        require(msg.sender == owner, "Must be owner");
        _;
    }

    constructor() {
        owner = msg.sender;
        //person who deployed the contract
    }
}

contract SecretVault {
    string secret;

    constructor(string memory _secret) {
        secret = _secret;
    }

    function getSecret() public view returns(string memory) {
        return secret;
    }

}

contract con1 is Ownable {
    //factory

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

