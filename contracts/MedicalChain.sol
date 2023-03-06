pragma solidity ^0.8.0;
/*
contract HealthInsurance {
    address payable public insuranceCompany;
    mapping(address => uint) public claims;

    event Claim(address indexed claimant, uint amount);

    constructor() {
        insuranceCompany = payable(msg.sender);
    }

    function fileClaim() public payable {
        require(msg.value > 0, "Amount must be greater than zero.");
        claims[msg.sender] += msg.value;
        emit Claim(msg.sender, msg.value);
    }

    function payout(address payable recipient) public {
        require(msg.sender == insuranceCompany, "Only the insurance company can make payouts.");
        require(claims[recipient] > 0, "No claim exists for this address.");
        uint payoutAmount = claims[recipient];
        claims[recipient] = 0;
        recipient.transfer(payoutAmount);
    }
} */




contract HealthInsurance {
    
    // Policy holder details
    address public policyHolder;
    string public name;
    uint public dateOfBirth;
    string public gender;
    
    // Policy details
    uint public policyNumber;
    uint public policyStartDate;
    uint public policyEndDate;
    uint public premiumAmount;
    bool public policyStatus;
    
    // Health records
    mapping(uint => string) public healthRecords;
    uint public numberOfHealthRecords;
    
    // Constructor function
    constructor(address _policyHolder, string memory _name, uint _dateOfBirth, string memory _gender, uint _policyNumber, uint _policyStartDate, uint _policyEndDate, uint _premiumAmount) {
        policyHolder = _policyHolder;
        name = _name;
        dateOfBirth = _dateOfBirth;
        gender = _gender;
        policyNumber = _policyNumber;
        policyStartDate = _policyStartDate;
        policyEndDate = _policyEndDate;
        premiumAmount = _premiumAmount;
        policyStatus = true;
    }
    
    // Modifier to check policy status
    modifier isPolicyActive() {
        require(policyStatus == true, "Policy is not active.");
        _;
    }
    
    // Function to add health records
    function addHealthRecord(string memory _healthRecord) public isPolicyActive {
        healthRecords[numberOfHealthRecords] = _healthRecord;
        numberOfHealthRecords++;
    }
    
    // Function to get health records
    function getHealthRecord(uint _index) public view isPolicyActive returns(string memory) {
        require(_index < numberOfHealthRecords, "Invalid index.");
        return healthRecords[_index];
    }
    
    // Function to cancel policy
    function cancelPolicy() public isPolicyActive {
        policyStatus = false;
    }
}
