// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { EventHorizon } from "@/contracts/puzzles/puzzle-06/EventHorizon.sol";
import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";
import { Test } from "forge-std/Test.sol";

contract DeployPuzzle6 is DeployBase {
    EventHorizon puzzle;
    address mainnetWinner = 0xB49bf876BE26435b6fae1Ef42C3c82c5867Fa149;

    function run() external {
        puzzle = new EventHorizon();
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"),16975460);
        console.log("EventHorizon.generate():\n%x", puzzle.generate(mainnetWinner));
        vm.selectFork(forkId);
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x0000000000000000000000000000000000000000000000000000000000000006, _answer);
    }
}
