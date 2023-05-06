const Migrations = artifacts.require("HichCoin");

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};