
pragma solidity ^0.8.6;

contract orderPartX{
    
    mapping(address => uint) public amountOrdered;
    
    uint public stock;
    
    function orderPart(uint amount) public{
        amountOrdered[msg.sender] = amountOrdered[msg.sender] + amount;
    }
    
    function cancelOrder(uint amount) public{
        amountOrdered[msg.sender] = amountOrdered[msg.sender] - amount;
    }
    
    function showMyOrders() public view returns (uint){
        return amountOrdered[msg.sender];
    }
    
}
