pragma solidity ^0.4.17;

contract GpoContract {
    address public owner;

    string public gpo_id;                   // GPO ID
    string public sup_id;                   // Supplier ID
    string public contract_code;            // GPO Contract Code with a Supplier
    string public active_from;              // Contract is active from
    string public active_to;                // Contract is active to
    string public status;                   // Current status (A = Active,V = Void)
    string public comments;                 // Comments
    string created_by;                      // Created by user id
    uint created_on;                        // Created on datetime
    string updated_by;                      // Updated by user id
    uint updated_on;                        // Updated by datetime

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function GpoContract() public {
        owner = msg.sender;
    }

    function setGpoContract(
        string _gpo_id,
        string _sup_id,
        string _contract_code,
        string _active_from,
        string _active_to,
        string _status,
        string _comments,
        string _created_by,
        uint _created_on,
        string _changed_by,
        uint _changed_on
    )
        public
    {
        gpo_id = _gpo_id;
        sup_id = _sup_id;
        contract_code = _contract_code;
        active_from = _active_from;
        active_to = _active_to;
        status = _status;
        comments = _comments;
        created_by = _created_by;
        created_on = _created_on;
        changed_by = _changed_by;
        changed_on = _changed_on;
    }

}