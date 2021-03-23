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
// SPDX-License-Identifier: MIT
pragma solidity ^0.7.4;

contract Migrations {
    address public owner;
    uint256 public last_completed_migration;

    constructor() {
        owner = msg.sender;
    }

    modifier restricted() {
        if (msg.sender == owner) _;
    }

    function setCompleted(uint256 completed) public restricted {
        last_completed_migration = completed;
    }

    function upgrade(address new_address) public restricted {
        Migrations upgraded = Migrations(new_address);
        upgraded.setCompleted(last_completed_migration);
    }
}
