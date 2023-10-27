// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import { DeployBase } from "./DeployBase.s.sol";
import { console } from "forge-std/console.sol";
import { Test } from "forge-std/Test.sol";
import { HuffDeployer } from "../../lib/foundry-huff/src/HuffDeployer.sol";
import { IPuzzle } from "@/contracts/interfaces/IPuzzle.sol";

contract DeployPuzzle9 is DeployBase {
    address mainnetWinner = 0xB49bf876BE26435b6fae1Ef42C3c82c5867Fa149;
    IPuzzle puzzle;

    function run() external {
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"),17138934);
        vm.selectFork(forkId);
        puzzle = IPuzzle(HuffDeployer.deploy("../../src/puzzle-09/Antikythera"));
        console.log("Antikythera.generate():\n%x", puzzle.generate(mainnetWinner));
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x0000000000000000000000000000000000000000000000000000000000000009, _answer);
    }
}
