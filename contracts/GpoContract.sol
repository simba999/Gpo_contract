pragma solidity ^0.4.17;

contract GpoContract {
    address public owner;                    // address for indicating this contract

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

    // setter to initialize GPO contract
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
        string _updated_by,
        uint _updated_on
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
        updated_by = _updated_by;
        updated_on = _updated_on;
    }

    // getter of GpoContract
    function getGpoContract() public view returns (
        string _gpo_id,
        string _sup_id,
        string _contract_code,
        string _active_from,
        string _active_to,
        string _status,
        string _comments,
        string _created_by,
        uint _created_on,
        string _updated_by,
        uint _updated_on
    ) {
        _gpo_id = gpo_id;
        _sup_id = sup_id;
        _contract_code = contract_code;
        _active_from = active_from;
        _active_to = active_to;
        _status = status;
        _comments = comments;
        _created_by = created_by;
        _created_on = created_on;
        _updated_by = updated_by;
        _updated_on = updated_on;
    }

}