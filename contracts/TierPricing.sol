pragma solidity ^0.4.17;
import "github.com/sagivo/solidity-utils/contracts/lib/Dictionary.sol";

contract TierPricing {
    address public owner;                   // address for indicating this contract
    uint[] temp;
    using Dictionary for Dictionary.Data;
    Dictionary.Data private dic;
    
    struct Dict {
        string attr;
        string value;
    }
    
    
    struct Tier {
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
    }
    
    uint32 numTierList;                         // number of tierLists
    mapping(int=>Tier) tierLists;               // list of TierPricing data
    
    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function TierPricing() public {
        owner = msg.sender;
        numTierList = 0;
    }
    
    // create a new TierPricing data
    function newTierPricing(
        string _tier_id,
        uint _tier_start_dt,
        uint _tier_end_dt,
        uint _min_qty,
        uint _min_amt,
        uint _reward_amt,
        uint _reward_cur,
        uint _reward_pct,
        string _smart_contract_id,
        string _smart_contract_date,
        string _tier_distr_pct,
        string _tier_desc
    )
        public returns (uint32 tierID)
    {
        tierID = numTierList++;
        tierLists[tierID] = Tier(
            _tier_id,
            _tier_start_dt,
            _tier_end_dt,
            _min_qty,
            _min_amt,
            _reward_amt,
            _reward_cur,
            _reward_pct,
            _smart_contract_id,
            _smart_contract_date,
            _tier_distr_pct,
            _tier_desc
        );
    }
    
    /* 
        @description: getter of TierPricing 
        @tierID: index of tier list
        @sum: reward value
    */
    function getTierPricing(uint32 tierID) public returns (uint sum) 
    {
        Tier storage t = tierLists[tierID];
        sum = t.min_amt + t.reward_amt;
    }
    
    // // convert string into json
    // function conertStringToJson(string params) public returns (Dict dc) {
    //     Dict a = Dict('a', 'b');
    //     dc = a;
    // }
    
}