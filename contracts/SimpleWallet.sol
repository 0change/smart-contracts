pragma solidity ^0.4.25;

contract SimpleWallet{
  
  address public coldWallet = 0x6D17E2dC0824ddBD1BC298B111F6559fd7E852d7;
  uint256 public id;

  function SimpleWallet(uint256 _id){
    id = _id;
  }

  /**
   * @dev fallback function
  */
  function() payable public{
    // Do NOT accept ETH
    assert(false);
  }


  /**
   * @dev Withdraws ERC20 tokens to coldWallet
   */
  function withdraw(address _contract, uint256 _amount) public{
    _contract.call(bytes4(keccak256("transfer(address,uint256)")), coldWallet, _amount);
  }
}
