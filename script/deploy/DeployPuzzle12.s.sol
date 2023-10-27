// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";
import { Test } from "forge-std/Test.sol";
import { HuffDeployer } from "../../lib/foundry-huff/src/HuffDeployer.sol";
import { IPuzzle } from "@/contracts/interfaces/IPuzzle.sol";

contract DeployPuzzle12 is DeployBase {
    address mainnetWinner = 0x6E82554d7C496baCcc8d0bCB104A50B772d22a1F;
    IPuzzle puzzle;

    function run() external {
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"),17367411);

        vm.selectFork(forkId);
        puzzle = IPuzzle(HuffDeployer.deploy("../../src/puzzle-12/Labyrinth"));
        console.log("Labyrinth.generate():\n%x", puzzle.generate(mainnetWinner));
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x000000000000000000000000000000000000000000000000000000000000000c, _answer);
    }
}
