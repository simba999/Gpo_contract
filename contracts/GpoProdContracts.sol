pragma solidity ^0.4.17;

contract GpoProdContracts {
    address public owner;

    string gpo_id;
    string sup_id;
    string p_id;
    string p_code;
    string p_sup_item;
    string p_ndc;
    string item_title;
    string gtin_code;
    string prod_cond;
    string brand_name;
    string unspsc_code;
    string class_cat_code;
    string name_of_mfr;
    string contract_id;
    int contract_pr;
    int ptt_code;
    string p_cur_code;
    int p_sh_amt;
    int p_sh_pct;
    string comments;
    string created_by;
    uint created_on;
    string updated_by;
    uint updated_on;
    string void_by;
    uint void_on;
    address contracted_list;
    address prod_tier_rewards;

    modifier onlyOwner() {
        require(msg.sender == owner);
        _;
    }

    function GpoProdContracts() public
    {
        owner = msg.sender;
    }

    function setContractDetail(
        string _gpo_id,
        string _sup_id,
        string _created_by,
        uint _created_on,
        string _updated_by,
        uint _updated_on,
        string _void_by,
        uint _void_on
    )
        public
    {
        gpo_id = _gpo_id;
        sup_id = _sup_id;
        created_by = _created_by;
        created_on = _created_on;
        updated_by = _updated_by;
        updated_on = _updated_on;
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

    function setContractedList(address _contracted_list) public {
        contracted_list = _contracted_list;
    }

    function setProdTierRewards(address _prod_tier_rewards) public {
        prod_tier_rewards = _prod_tier_rewards;
    }

    function setComments(string _comments) public {
        comments = _comments;
    }

}