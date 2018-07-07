pragma solidity ^0.4.24;

contract Owned{
    address owner;
    
    function Owned() public {
        owner = msg.sender;
    }
    
    modifier onlyOwner {
        require(msg.sender == owner);
        _;
    }
}

contract Courses is Owned {

    
    // Define Instructor struct
    struct Instructor {
        uint age;
        bytes16 fName;
        bytes16 lName;
    }
    
    // Initialize mapping (hash table) of Instructors and array of InstructorAccounts
    mapping (address => Instructor) instructors;
    address[] public instructorAccts;
    
    event instructorInfo(
        bytes16 fName,
        bytes16 lName,
        uint age
    );
    
    function setInstructor(address _address, uint _age, bytes16 _fName, bytes16 _lName) onlyOwner public {
        Instructor storage instructor = instructors[_address];
        
        instructor.age = _age;
        instructor.fName = _fName;
        instructor.lName = _lName;
        
        instructorAccts.push(_address) - 1;
        emit instructorInfo(_fName,_lName,_age);
    }
    
    // Gets a list of instructors ETH addresses
    function getInstructors() view public returns (address[]){
        return instructorAccts;
    }
    
    // Gets a single instructor age, fname, lname
    function getInstructor(address _address) view public returns (uint, bytes16, bytes16){
        return (instructors[_address].age, instructors[_address].fName ,instructors[_address].lName);
    }
}