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
const Migrations = artifacts.require('Migrations');

module.exports = function (deployer) {
  deployer.deploy(Migrations);
};
