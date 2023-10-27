// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { F1A9 } from "@/contracts/puzzles/puzzle-02/F1A9.sol";
import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";

contract DeployPuzzle2 is DeployBase {
    F1A9 puzzle;
    address mainnetWinner = 0xB49bf876BE26435b6fae1Ef42C3c82c5867Fa149;

    function run() external {
        puzzle = new F1A9 ();
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"), 16784725);
        console.log("0xF1A9.generate():\n%x", puzzle.generate(mainnetWinner));
        vm.selectFork(forkId);
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x0000000000000000000000000000000000000000000000000000000000000002, _answer);
    }
}
