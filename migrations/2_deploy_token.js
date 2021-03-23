// ----------------------------------------------------------------------------
// Abra token contract
//
// Symbol        : ABRA
// Name          : Abra Token
// Total supply  : 1000000000000000000000000
// Decimals      : 18
//
// Enjoy.
//
// (c) by Ali Faruk Küçükmumcu 2021. MIT Licence.
// ----------------------------------------------------------------------------
const Abra = artifacts.require('Abra');
const EthSwap = artifacts.require('EthSwap');

module.exports = async function (deployer) {
  // Deploy Token
  await deployer.deploy(Abra);
  const abra = await Abra.deployed();

  // Deploy EthSwap
  await deployer.deploy(EthSwap, abra.address);
  const ethSwap = await EthSwap.deployed();

  // Transfer all tokens to EthSwap (1 million)
  await abra.transfer(ethSwap.address, '1000000000000000000000000');
};
