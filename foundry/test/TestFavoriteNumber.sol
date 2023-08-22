// SPDX-License-Identifier: UNLICENSED
pragma solidity 0.8.20;

import "forge-std/Test.sol";
import "../src/FavoriteNumber.sol";

abstract contract HelperContract {
    // Foundry address
    address constant IMPORTANT_ADDRESS = 0xb4c79daB8f259C7Aee6E5b2Aa729821864227e84;
    FavoriteNumber favoriteNumber;
}

contract TestFavoriteNumber is Test, HelperContract {
    address alice = makeAddr("alice");
    address bob = makeAddr("bob");

    event NumberChanged(address indexed by, uint256 number);

    function setUp() public {
        favoriteNumber = new FavoriteNumber();
    }

    function test_NumberShouldBe_0_ByDefault() public {
        assertEq(favoriteNumber.getNumber(), 0);
    }

    // When test is meant to fail, name of the function should start with "testFail"
    function testFail_SetNumberShouldFailWhenSetIs_11() public {
        favoriteNumber.setNumber(11);
    }

    function test_SetNumberShouldWorkWhenSetTo_9() public {
        assertEq(favoriteNumber.getNumber(), 0);
        favoriteNumber.setNumber(9);
        assertEq(favoriteNumber.getNumber(), 9);
    }

    function test_SetNumberShouldWorkWhenSetTo_8_WithBob() public {
        vm.startPrank(bob);
        assertEq(favoriteNumber.getNumber(), 0);
        favoriteNumber.setNumber(8);
        assertEq(favoriteNumber.getNumber(), 8);
        vm.stopPrank();
    }

    function test_RevertWhen_NumberIsOver10() public {
        vm.expectRevert(NumberIsOver10.selector);
        favoriteNumber.setNumber(17);
    }

    function test_ShouldEmitNumberChangedEvent_WhenBobSetNumberTo_9() public {
        // vm.expectEmit 3 first arguments are indexed (3 max), following ones are parameters
        vm.expectEmit(true, false, false, true);
        emit NumberChanged(address(bob), 9);
        vm.prank(bob);
        favoriteNumber.setNumber(9);
    }
}
