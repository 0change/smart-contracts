pragma solidity ^0.4.25;
import "contracts/Finance.sol";
import "contracts/ERC20.sol";


contract DAOWallet{

  Finance internal finance;
  ERC20 internal token;

  address public financeAddress = 0x040a58A29C4010aA93025FbC1c99f007951F4Ebe;
  uint256 public id;

  string private constant APPROVE_ERROR = "APPROVE RROR";
  string private constant FINANCE_MESSAGE = "ZERO CHANGE WITHDRAW";

  constructor(uint256 _id) public {
    id = _id;
    finance = Finance(financeAddress);
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
     * @param _contract The ERC20 token address.
     * @param _amount Withdraw amount.
   */
  function withdraw(address _contract, uint256 _amount) public {
    // _contract.call(bytes4(keccak256("transfer(address,uint256)")), coldWallet, _amount);
    token = ERC20(_contract);
    require(token.approve(address(finance), _amount), APPROVE_ERROR);
    finance.deposit(_contract, _amount, FINANCE_MESSAGE);
  }
}
