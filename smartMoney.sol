// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract SmartMoney{
    uint public balanceReceived;

    function deposit() public payable{
         balanceReceived += msg.value;
    }

    function getContractBalance() public view returns(uint){
        return address(this).balance;
    }

    function widthdrawAll() public {
        address payable to = payable(msg.sender);
        to.transfer(getContractBalance());
    }

    function widthdrawToAddress(address payable to) public {
        to.transfer(getContractBalance());
    }
}
