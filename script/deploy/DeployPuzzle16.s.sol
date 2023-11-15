// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";
import { Test } from "forge-std/Test.sol";
import { IPuzzle } from "@/contracts/interfaces/IPuzzle.sol";

contract DeployPuzzle16 is DeployBase {
    address mainnetWinner = 0x4a69B81A2cBEb3581C61d5087484fBda2Ed39605;
    function run() external {
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"),17972216);
        vm.selectFork(forkId);
        console.log("Elohim.generate():\n%s", IPuzzle(0xE92126D243D8290B47Af8b198B662Bf301439830).generate(mainnetWinner));
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x0000000000000000000000000000000000000000000000000000000000000010, _answer);
    }
}
