pragma solidity ^0.4.17;

contract GpoContract {
    address public owner;

    string public gpo_id;
    string public sup_id;
    string public contract_code;
    string public active_from;
    string public active_to;
    string public status;
    string public comments;
    string public created_by;
    uint public created_on;
    string public changed_by;
    uint public changed_on;

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