import 'contracts/SimpleWallet.sol';

contract SimpleWalletFactory{
  event New(address addr, uint256 id);

  function create(uint256 _id) returns(address created){
    created = new SimpleWallet(_id);
    emit New(created, _id);
  }
}
