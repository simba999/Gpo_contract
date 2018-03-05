pragma solidity ^0.4.17;

contract TierPricing {
    address public owner;                   // address for indicating this contract

    // struct Dict {
    //     string objectName;
    //     string obj_type;
    //     string obj_key;
    // }

    string tier_id;                         // Tier code
    uint tier_start_dt;                     // Start of the tier
    uint tier_end_dt;                       // End of the tier
    uint min_qty;                           // Minimum Quantity
    uint min_amt;                           // Minimum purchase amount
    uint reward_amt;                        // Amount of reward (fixed amount USD)
    uint reward_cur;                        // Reward currency code
    uint reward_pct;                        // Percentage of the reward (Percentage of the total sales)
    string tier_distr_pct;                  // Distribution percentages to each party (Key: Entity_id (GPO/SUP/HOSP), Value: Percentage).  
    string smart_contract_id;               // Ethereum smart contract ID
    string smart_contract_date;             // Ethereum smart contract generated on date
    string tier_desc;                       // Tier information/comments

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
        string _tier_distr_pct,
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
        tier_distr_pct = _tier_distr_pct;
        smart_contract_id = _smart_contract_id;
        smart_contract_date = _smart_contract_date;
        tier_desc = _tier_desc;
    }

    // get information to calculate reward
    function getTierInformation() public view returns (
        uint _min_qtr, 
        uint _min_amt, 
        uint _reward_cur,
        uint _reward_pct
    ) {
        _min_qtr = min_qty;
        _min_amt = min_amt;
        _reward_cur = reward_cur;
        _reward_pct = reward_pct;
    }

    // function setStruct(string _objectName,string _obj_type, string _obj_key) public onlyOwner {
    //     structs.objectName = _objectName;
    //     structs.obj_type = _obj_type;
    //     structs.obj_key = _obj_key;
    // }
}