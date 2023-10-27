// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { TwoTimesFourIsEight } from "@/contracts/puzzles/puzzle-01/TwoTimesFourIsEight.sol";
import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";

contract DeployPuzzle1 is DeployBase {
    TwoTimesFourIsEight puzzle; 
    address mainnetWinner = 0x58593392d72A9D90b133e1C8ecEec581C354687f;

    function run() external {
        puzzle = new TwoTimesFourIsEight();
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"), 16737571);
        console.log("TwoTimesFourIsEight.generate():\n%x", puzzle.generate(mainnetWinner));
        vm.selectFork(forkId);
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(0x00000000eCf2b58C296B47caC8C51467c0e307cE).solve(0x0000000000000000000000000000000000000000000000000000000000000001, _answer);
    }
}
