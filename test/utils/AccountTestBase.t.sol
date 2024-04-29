// SPDX-License-Identifier: UNLICENSED
pragma solidity ^0.8.25;

import {Test} from "forge-std/Test.sol";

import {EntryPoint} from "@eth-infinitism/account-abstraction/core/EntryPoint.sol";

import {UpgradeableModularAccount} from "erc6900/reference-implementation/src/account/UpgradeableModularAccount.sol";
import {SingleOwnerPlugin} from "erc6900/reference-implementation/src/plugins/owner/SingleOwnerPlugin.sol";

import {MSCAFactoryFixture} from "erc6900/reference-implementation/test/mocks/MSCAFactoryFixture.sol";

/// @dev This contract handles common boilerplate setup for tests using the reference implementation with
/// SingleOwnerPlugin. To use it, inherit from `AccountTestBase` instead of `Test` in your test contract,
// and you will have access to the initialized state variables declared here.
abstract contract AccountTestBase is Test {

    // The EntryPoint contract.
    EntryPoint public entryPoint;
    // A beneficiary address for use with `EntryPoint.handleOps(...)`.
    address payable public beneficiary;
    // The SingleOwnerPlugin contract.
    SingleOwnerPlugin public singleOwnerPlugin;
    // A factory for creating account instances.
    MSCAFactoryFixture public factory;

    // A startiong account and owner.
    address public owner1;
    uint256 public owner1Key;
    UpgradeableModularAccount public account1;

    constructor() {
        entryPoint = new EntryPoint();
        (owner1, owner1Key) = makeAddrAndKey("owner1");
        beneficiary = payable(makeAddr("beneficiary"));

        singleOwnerPlugin = new SingleOwnerPlugin();
        factory = new MSCAFactoryFixture(entryPoint, singleOwnerPlugin);

        account1 = factory.createAccount(owner1, 0);
        vm.deal(address(account1), 100 ether);
    }

    // An optional function to transfer ownership of the account to the test contract.
    // Allows for easier direct invocation by removing the need to `vm.prank` as the owner for runtime calls.
    function _transferOwnershipToTest() internal {
        vm.prank(owner1);
        SingleOwnerPlugin(address(account1)).transferOwnership(address(this));
    }
}