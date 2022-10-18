// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

contract Calculator {
    event NumbersAdded(uint a, uint b, uint result, address indexed caller);
    event NumbersSubtracted(uint a, uint b, uint result, address indexed caller);
    event NumbersMultiplied(uint a, uint b, uint result, address indexed caller);
    event NumbersDivided(uint a, uint b, uint result, address indexed caller);

    function add(uint a, uint b) public returns(uint){
        uint result = a + b;
        emit NumbersAdded(a, b, result, msg.sender);
        return result;
    }

    function subtract(uint a, uint b) public returns(uint){
        uint result = a - b;
        emit NumbersSubtracted(a, b, result, msg.sender);
        return result;
    }

    function multiply(uint a, uint b) public returns(uint){
        uint result = a * b;
        emit NumbersMultiplied(a, b, result, msg.sender);
        return result;
    }

    function divide(uint a, uint b) public returns(uint){
        uint result = a / b;
        emit NumbersDivided(a, b, result, msg.sender);
        return result;
    }
}