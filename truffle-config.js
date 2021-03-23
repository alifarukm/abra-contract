const { parse } = require('dotenv');

parse('.env');

const HDWalletProvider = require('@truffle/hdwallet-provider');
const mnemonic = 'Should not get in here :)';
const infuraKey = 'Should not get in here :)';

module.exports = {
  networks: {
    development: {
      host: '127.0.0.1', // Localhost (default: none)
      port: 7545, // Standard Ethereum port (default: none)
      network_id: '*', // Any network (default: none)
    },

    ropsten: {
      provider: () =>
        new HDWalletProvider(
          mnemonic,
          `wss://ropsten.infura.io/ws/v3/${infuraKey}`
        ),
      network_id: 3, // Ropsten's id
      gas: 5500000, // Ropsten has a lower block limit than mainnet
    },
  },
  plugins: ['solidity-coverage'],

  // Configure your compilers
  compilers: {
    solc: {
      version: '0.7.4', // Fetch exact version from solc-bin (default: truffle's version)
      docker: false, // Use "0.5.1" you've installed locally with docker (default: false)
      settings: {
        // See the solidity docs for advice about optimization and evmVersion
        optimizer: {
          enabled: true,
          runs: 200,
        },
        evmVersion: 'byzantium',
      },
    },
  },
};
