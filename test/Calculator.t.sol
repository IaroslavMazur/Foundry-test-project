// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.13;

import "forge-std/Test.sol";
import "../src/Calculator.sol";

contract CalculatorTest is Test {
    Calculator public calculator;
    uint MAX_UINT = type(uint).max;

    event NumbersAdded(uint a, uint b, uint result, address indexed caller);
    event NumbersSubtracted(uint a, uint b, uint result, address indexed caller);
    event NumbersMultiplied(uint a, uint b, uint result, address indexed caller);
    event NumbersDivided(uint a, uint b, uint result, address indexed caller);

    function setUp() public {
        calculator = new Calculator();
    }

    function testAddition() public {
        uint a = 5;
        uint b = 5;
        uint result = 10;
        vm.expectEmit(true, false, false, true);
        emit NumbersAdded(a, b, result, address(this));
        uint returnedResult = calculator.add(a, b);
        assertEq(result, returnedResult);
    }

    function testCannotAddIfItOverflows() public {
        uint a = MAX_UINT;
        uint b = 1;
        vm.expectRevert(stdError.arithmeticError);
        calculator.add(a, b);
    }

    function testCannotDivideByZero() public {
        uint a = 1;
        uint b = 0;
        vm.expectRevert(stdError.divisionError);
        calculator.divide(a, b);
    }

    function testMultiply() public {
        uint a = 5;
        uint b = 5;
        uint result = 25;
        vm.expectEmit(true, false, false, true);
        emit NumbersMultiplied(a, b, result, address(this));
        uint returnedResult = calculator.multiply(a, b);(a, b);
        assertEq(result, returnedResult);
    }

    function testCannotMultiplyIfItOverflows() public {
        uint a = MAX_UINT;
        uint b = 2;
        vm.expectRevert(stdError.arithmeticError);
        calculator.multiply(a, b);
    }
}