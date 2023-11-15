// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";
import { Test } from "forge-std/Test.sol";
import { HuffDeployer } from "../../lib/foundry-huff/src/HuffDeployer.sol";
import { IPuzzle } from "@/contracts/interfaces/IPuzzle.sol";

contract DeployPuzzle14 is DeployBase {
    address mainnetWinner = 0xB49bf876BE26435b6fae1Ef42C3c82c5867Fa149;
    IPuzzle puzzle;

    function run() external {
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"),17743334);
        vm.selectFork(forkId);
        puzzle = IPuzzle(HuffDeployer.deploy("../../src/puzzle-14/SacredGeometry"));
        console.log("Labyrinth.generate():\n%s", puzzle.generate(mainnetWinner));
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x000000000000000000000000000000000000000000000000000000000000000c, _answer);
    }
}
