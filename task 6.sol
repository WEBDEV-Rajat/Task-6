// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

contract StudentGrades {
    uint public studentCount = 0;
    Grade [] public students;

    struct Grade {
        uint id;
        string studentName;
        string subject;
        uint grade;
    }
    Grade public student;
    address public owner;
    constructor(uint id, string memory studentName, string memory subject, uint grade) {
        owner = msg.sender;
        student = Grade(id, studentName, subject, grade);
    }
    modifier onlyOwner() {
        require(msg.sender == owner, "Not the contract owner");
        _;
    }
    function addGrade(uint id, string memory studentName, string memory subject, uint grade) public onlyOwner{
       require(id > studentCount);
       studentCount += 1;
       Grade memory newStudent = Grade(id, studentName, subject, grade);
       students.push(newStudent);
       student = newStudent;
    }
    function updateGrade(uint _id, string memory _studentName, string memory _subject ,uint _grade) public onlyOwner{
        Grade storage g = students[_id];
        g.studentName = _studentName;
        g.subject = _subject;
        g.grade = _grade;
    }
    function getGrade(uint _id, string memory _studentName, string memory _subject) public returns(uint){
        for(uint i = 0; i < students.length; ){
            if(i == _id){
               student = students[_id];
               student.studentName = _studentName;
               student.subject = _subject;
               return student.grade;
            }
            i = i+1;
        }
        return 0;
    }
    uint avgGrade = 0;
    function averageGrade(string memory _subject) public returns(uint){
        
        for(uint i = 0; i < students.length; ){
            avgGrade += getGrade(i, students[i].studentName, _subject);
            i = i+1;
        }
        uint result = avgGrade/studentCount;
        return result;
    }
    
}
