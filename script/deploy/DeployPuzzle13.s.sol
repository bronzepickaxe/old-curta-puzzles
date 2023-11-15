// SPDX-License-Identifier: MIT
pragma solidity ^0.8.17;

import { PingPong } from "@/contracts/puzzles/puzzle-13/PingPong.sol";
import { ICurta } from "@/contracts/interfaces/ICurta.sol";
import {DeployBase} from "./DeployBase.s.sol";
import {console} from "forge-std/console.sol";
import {Test} from "forge-std/Test.sol";
import { IPuzzle } from "@/contracts/interfaces/IPuzzle.sol";

contract DeployPuzzle13 is DeployBase {
    address mainnetWinner = 0xB49bf876BE26435b6fae1Ef42C3c82c5867Fa149;

    function run() external {
        uint256 forkId = vm.createFork(vm.envString("RPC_URL_MAINNET"),17646736);
        vm.selectFork(forkId);
        console.log("PingPong.generate():\n%s", IPuzzle(0x7E59780463e9fd543E725902f81BC4a51b1634eC).generate(mainnetWinner));
        vm.prank(mainnetWinner);

        // testSolved(0x123);
    }

    function testSolved(uint256 _answer) internal {
        ICurta(CURTA_ADDRESS).solve(0x000000000000000000000000000000000000000000000000000000000000000d, _answer);
    }
}
