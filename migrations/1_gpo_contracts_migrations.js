var GpoContract = artifacts.require("./GpoContract.sol");
var GpoProdContracts = artifacts.require("./GpoProdContracts.sol");
var TierPricing = artifacts.require("./TierPricing.sol");

module.exports = function(deployer) {
  deployer.deploy(GpoContract);
  deployer.deploy(GpoProdContracts);
  deployer.deploy(TierPricing);
};
