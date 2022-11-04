// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract Mapping2{
    mapping (address => uint) public balanceReceived;

    
  function getBalance() public view returns(uint){
      return address(this).balance;
  }

     function sendMoney() public payable{
         balanceReceived[msg.sender] += msg.value;
    }
/*
When someone sends money using the "sendMoney" function, we track the msg.value 
(amount in Wei) with the balanceReceived mapping for the person who interacted with the 
Smart Contract.
*/
  
  function widthDrawAllMoney(address payable _to) public {
     uint balanceToSend = balanceReceived[msg.sender];
     balanceReceived[msg.sender] = 0;
     _to.transfer(balanceToSend);
  }

}
