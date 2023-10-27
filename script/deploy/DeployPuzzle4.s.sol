// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { WhatAreBuckets } from "@/contracts/puzzles/puzzle-04/WhatAreBuckets.sol";
import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";

contract DeployPuzzle4 is DeployBase {
    WhatAreBuckets puzzle;
    address mainnetWinner = 0x58593392d72A9D90b133e1C8ecEec581C354687f;

    function run() external {
        puzzle = new WhatAreBuckets();
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"),16912910);
        console.log("WhatAreBuckets.generate():\n%x", puzzle.generate(mainnetWinner));
        vm.selectFork(forkId);
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x0000000000000000000000000000000000000000000000000000000000000004, _answer);
    }
}
