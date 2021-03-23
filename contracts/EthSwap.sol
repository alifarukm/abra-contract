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
// It is being needed to use struct  arrays
pragma experimental ABIEncoderV2;

import "./Abra.sol";

contract EthSwap {
    string public name = "EthSwap Instant Exchange";
    Abra public token;
    uint256 public rate = 100;
    uint256 private maxBuy = 300;

    event TokensPurchased(
        address account,
        address token,
        uint256 amount,
        uint256 rate
    );

    event TokensSold(
        address account,
        address token,
        uint256 amount,
        uint256 rate
    );

    constructor(Abra _token) {
        token = _token;
    }

    function buyTokens() public payable {
        // Calculate the number of tokens to buy
        uint256 tokenAmount = msg.value * rate;

        // Require that EthSwap has enough tokens
        require(token.balanceOf(address(this)) >= tokenAmount);

        // Transfer tokens to the user
        token.transfer(msg.sender, tokenAmount);

        // Emit an event
        emit TokensPurchased(msg.sender, address(token), tokenAmount, rate);
    }

    function sellTokens(uint256 _amount) public {
        // User can't sell more tokens than they have
        require(token.balanceOf(msg.sender) >= _amount);

        // Calculate the amount of Ether to redeem
        uint256 etherAmount = _amount / rate;

        // Require that EthSwap has enough Ether
        require(address(this).balance >= etherAmount);

        // Perform sale
        token.transferFrom(msg.sender, address(this), _amount);
        msg.sender.transfer(etherAmount);

        // Emit an event
        emit TokensSold(msg.sender, address(token), _amount, rate);
    }
}
