pragma solidity ^0.4.17;

import * as GpoContract from "./GpoContract.sol";
import * as T from "./TierPricing.sol";

contract GpoProdContracts {
    address public owner;                   // address for indicating this contract

    string gpo_id;                          // GPO ID
    string sup_id;                          // Supplier
    string p_id;                            // Product ID
    string p_code;                          // Product Code
    string p_sup_item;                      //  #Supplier Catalog Item number (supplier's internal material number)
    string p_ndc;                           // #ndc_code
    string item_title;                      // Product Item name
    string gtin_code;                       // (globalTradeItemNumber) GTIN (Numeric 14 characters)
    string prod_cond;                       // Product condition (New / Used / Refurbished)
    string brand_name;                      // Brand Name
    string unspsc_code;                     // UNSPSC code
    string class_cat_code;                  // Global Product Classification Code
    string name_of_mfr;                     // Manufacturer Name (Part 1)
    string contract_id;                     // GPO Contract ID
    int contract_pr;                        // Contracted providers list
    int ptt_code;                           // Payment Terms Type Code: UD=Upon Delivery, UI=Upon Invoice, COD=Cash on delivery
    string p_cur_code;                      // Currency code
    int p_sh_amt;                           // Shipping & Handling Amount
    int p_sh_pct;                           // Shipping & Handling Percent
    string comments;                        // comments
    string void_by;                         // Voided by user id
    uint void_on;                           // Voided by datetime
    address contracted_list;                // Contracted providers list
    address prod_tier_rewards;              // Tiered based rewards 

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function GpoProdContracts() public {
        owner = msg.sender;
    }

    function setContractDetail(
        string _gpo_id,
        string _sup_id,
        string _void_by,
        uint _void_on
    )
        public
    {
        gpo_id = _gpo_id;
        sup_id = _sup_id;
        void_by = _void_by;
        void_on = _void_on;
    }

    function setDetailCode(
        string _p_id,
        string _p_code,
        string _p_sup_item,
        string _p_ndc,
        string _item_title
    )
        public
    {
        p_id = _p_id;
        p_code = _p_code;
        p_sup_item = _p_sup_item;
        p_ndc = _p_ndc;
        item_title = _item_title;
    }

    function setDetailCode2(
        string _gtin_code,
        string _prod_cond,
        string _brand_name,
        string _unspsc_code,
        string _class_cat_code,
        string _name_of_mfr,
        string _contract_id,
        int _contract_pr,
        int _ptt_code,
        string _p_cur_code,
        int _p_sh_amt,
        int _p_sh_pct
    )
        public
    {
        gtin_code = _gtin_code;
        prod_cond = _prod_cond;
        brand_name = _brand_name;
        unspsc_code = _unspsc_code;
        class_cat_code = _class_cat_code;
        name_of_mfr = _name_of_mfr;
        contract_id = _contract_id;
        contract_pr = _contract_pr;
        ptt_code = _ptt_code;
        p_cur_code = _p_cur_code;
        p_sh_amt = _p_sh_amt;
        p_sh_pct = _p_sh_pct;
    }

    // get contracted_list property
    function setContractedList(address _contracted_list) public {
        contracted_list = _contracted_list;
    }

    // get prod_tier_rewards
    function setProdTierRewards(address _prod_tier_rewards) public {
        prod_tier_rewards = _prod_tier_rewards;
    }

    //get comments
    function setComments(string _comments) public {
        comments = _comments;
    }
    
    // get calculation of rewards
    function calculateRewards(address addr) public view returns (uint sum) {
        T.TierPricing tier = T.TierPricing(addr);
        
        T.TierPricing reward = tier.getTierInformation().reward_amt + tier.getTierInformation() * tier.getTierInformation();
        return reward;
    }
}