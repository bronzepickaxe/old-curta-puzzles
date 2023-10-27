// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { BillyTheBull} from "@/contracts/puzzles/puzzle-15/BillyTheBull.sol";
import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";
import { Test } from "forge-std/Test.sol";
import { IPuzzle } from "@/contracts/interfaces/IPuzzle.sol";

contract DeployPuzzle15 is DeployBase {
    BillyTheBull puzzle;
    address mainnetWinner = 0x4a69B81A2cBEb3581C61d5087484fBda2Ed39605;

    function run() external {
        puzzle = new BillyTheBull();
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"),17843232);
        vm.selectFork(forkId);
        console.log("BillyTheBull.generate():\n%x", puzzle.generate(mainnetWinner));
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x000000000000000000000000000000000000000000000000000000000000000f, _answer);
    }
}
