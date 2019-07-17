import 'contracts/DAOWallet.sol';

contract DAOWalletFactory{
  event New(address addr, uint256 id);

  function create(uint256 _id) returns(address created){
    created = new DAOWallet(_id);
    emit New(created, _id);
  }
}
