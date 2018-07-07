pragma solidity ^0.4.24;

contract Contract {
    
    string fName;
    uint age;
    address owner;
    
    //Constructor for setting contract owner
    function Coursetro() public{
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        // require  is like an if
        require(msg.sender == owner);
        _;
    }
    
    // Define event
    event Instructor(
        string name,
        uint age
    );
    
    // Sets the instructor's name and age
    function setInstructor(string _fName, uint _age) onlyOwner public {
        fName = _fName;
        age = _age;
        emit Instructor(_fName, _age);
    }
    
    // Gets the instructor's name and age
    function getInstructor() public constant returns (string, uint){
        return (fName, age);
    }
    
    
    
}