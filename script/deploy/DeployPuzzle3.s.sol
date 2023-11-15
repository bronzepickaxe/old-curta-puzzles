// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { TinySig } from "@/contracts/puzzles/puzzle-03/TinySig.sol";
import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";

contract DeployPuzzle3 is DeployBase {
    TinySig puzzle;
    address mainnetWinner = 0x4a69B81A2cBEb3581C61d5087484fBda2Ed39605;

    function run() external {
        puzzle = new TinySig();
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"),16856852);
        console.log("TinySig.generate():\n%s", puzzle.generate(mainnetWinner));
        vm.selectFork(forkId);
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x0000000000000000000000000000000000000000000000000000000000000003, _answer);
    }
}
