pragma solidity ^0.4.17;

contract TierPricing {
    address public owner;

    struct Dict {
        string objectName;
        string obj_type;
        string obj_key;
    }

    string tier_id;
    uint tier_start_dt;
    uint tier_end_dt;
    uint min_qty;
    uint min_amt;
    uint reward_amt;
    uint reward_cur;
    uint reward_pct;
    string iter_distr_pct;
    string smart_contract_id;
    string smart_contract_date;
    string tier_desc;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function TierPricing() public {
        owner = msg.sender;
    }

    function setTierPricing(
        string _tier_id,
        uint _tier_start_dt,
        uint _tier_end_dt,
        uint _min_qty,
        uint _min_amt,
        uint _reward_amt,
        uint _reward_cur,
        uint _reward_pct,
        string _iter_distr_pct,
        string _smart_contract_id,
        string _smart_contract_date,
        string _tier_desc
    )
        public
    {
        tier_id = _tier_id;
        tier_start_dt = _tier_start_dt;
        tier_end_dt = _tier_end_dt;
        min_qty = _min_qty;
        min_amt = _min_amt;
        reward_amt = _reward_amt;
        reward_cur = _reward_cur;
        reward_pct = _reward_pct;
        iter_distr_pct = _iter_distr_pct;
        smart_contract_id = _smart_contract_id;
        smart_contract_date = _smart_contract_date;
        tier_desc = _tier_desc;
    }

    // function setStruct(string _objectName,string _obj_type, string _obj_key) public onlyOwner {
    //     structs.objectName = _objectName;
    //     structs.obj_type = _obj_type;
    //     structs.obj_key = _obj_key;
    // }
}