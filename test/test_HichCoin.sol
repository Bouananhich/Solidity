pragma solidity 0.8.19;

import "../contracts/HichCoin.sol";

contract TestHichCoin {
  function testInitialBalanceUsingDeployedContract() {
    Hichcoin hich = Hichcoin(DeployedAddresses.Hichcoin());

    uint expected = 1000000;

    Assert.equal(hich.balanceOf(tx.origin), expected, "Owner should have 1000000 HichCoin initially");
  }
}
