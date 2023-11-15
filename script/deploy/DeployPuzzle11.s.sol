// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { BabyItsMe } from "@/contracts/puzzles/puzzle-11/BabyItsMe.sol";
import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";
import { Test } from "forge-std/Test.sol";

contract DeployPuzzle11 is DeployBase {
    BabyItsMe puzzle;
    address mainnetWinner = 0xB49bf876BE26435b6fae1Ef42C3c82c5867Fa149;

    function run() external {
        puzzle = new BabyItsMe();
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"),17331030);
        console.log("BabyItsMe.generate():\n%s", puzzle.generate(mainnetWinner));
        vm.selectFork(forkId);
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x000000000000000000000000000000000000000000000000000000000000000b, _answer);
    }
}
