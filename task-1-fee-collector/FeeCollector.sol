//version of solidity
pragma solidity ^0.8.17;
// SPDX-Licence-Identifier: MIT

contract FeeCollector {
    address public owner; // owner of the contract(address)
    uint256 public balance; 

    //assigning msg.sender to owner in constructor
    constructor(){
        owner = msg.sender;      
    }

    receive() payable external {
        balance += msg.value;
    }

    //for get back(withdraw)
    function withdraw(uint amount, address payable destinationAddress) public {
        require(msg.sender == owner, "Only owner can withdraw");
        require(amount <= balance, "Insufficient funds");

        destinationAddress.transfer(amount);
        balance -= amount;
    }
}