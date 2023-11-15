## Working Puzzles:
- ✅ - [Puzzle1](https://www.curta.wtf/puzzle/1) by [FiveOutOfNine](https://twitter.com/fiveoutofnine)
- ✅ - [Puzzle2](https://www.curta.wtf/puzzle/2) by [FiveOutOfNine](https://twitter.com/fiveoutofnine)
- ✅ - [Puzzle3](https://www.curta.wtf/puzzle/3) by [Riley Holterhus](https://twitter.com/rileyholterhus)
- ✅ - [Puzzle4](https://www.curta.wtf/puzzle/4) by [walden_yan](https://twitter.com/walden_yan)
- ❌ - [Puzzle6](https://www.curta.wtf/puzzle/6) by [wei3erHase](https://twitter.com/wei3erHase)
- ✅ - [Puzzle7](https://www.curta.wtf/puzzle/7) by [brock](https://twitter.com/brockjelmore)
- ✅ - [Puzzle8](https://www.curta.wtf/puzzle/8) by [gf256](https://twitter.com/gf_256)
- ❌ - [Puzzle9](https://www.curta.wtf/puzzle/9) by [vex](https://twitter.com/vex_0x)
- ✅ - [Puzzle10](https://www.curta.wtf/puzzle/10) by [FiveOutOfNine](https://twitter.com/fiveoutofnine)
- ✅ - [Puzzle11](https://www.curta.wtf/puzzle/11) by [Leo Alt](https://twitter.com/leonardoalt)
- ❌ - [Puzzle12](https://www.curta.wtf/puzzle/12) by [kaden](https://twitter.com/0xKaden)
- ❌ - [Puzzle13](https://www.curta.wtf/puzzle/13) by [exptable](https://twitter.com/exp_table)
- ❌ - [Puzzle14](https://www.curta.wtf/puzzle/14) by [jtriley](https://twitter.com/jtriley_eth)
- ❌- [Puzzle15](https://www.curta.wtf/puzzle/15) by [obront](https://twitter.com/zachobront)
- ✅ - [Puzzle16](https://www.curta.wtf/puzzle/16) by [devtooligan](https://twitter.com/devtooligan)
- ✅ - [Puzzle17](https://www.curta.wtf/puzzle/17) by [hrkrshnn](https://twitter.com/_hrkrshnn)
- ✅ - [Puzzle18](https://www.curta.wtf/puzzle/18) by [horsefacts](https://twitter.com/eth_call)

As you can see, some of the puzzles are not working at the moment. If you got them to work, feel free to submit a PR.

# Old Curta Puzzles
I decided to create a directory of old Curta puzzles because I want to play them, all other available options of playing the puzzles were not working for me.
Make sure to check out the [Curta.wtf website](https://www.curta.wtf/) for new puzzles and join there [Discord](https://discord.com/invite/zxerRE2Dn7).

### Step 1 (Setup)
- Run `forge install`
- Install [Huff](https://docs.huff.sh/get-started/installing/)

Put your `RPC_URL_MAINNET` in `.env.example`:
```javascript
file: .env.example
RPC_URL_MAINNET=
```
After that, remove `.example` from the file-name, leaving you with `.env`.
I use [Infura](infura.io), but other RPC providers will work as well.

### Step 2 (Generating seed)
Pick the puzzle you want to play. Let's say you want to play Puzzle1, run this command:
`forge script/deployDeployPuzzle1.s.sol`
This will log the seed to your console:
```javascript
[⠒] Compiling...
No files changed, compilation skipped
Script ran successfully.
Gas used: 266368

== Logs ==
  TwoTimesFourIsEight.generate():
6901746346790564457901554991452530692688817142401467382862937683132416
```

This will print seed in `uint256` format. 

If you need to convert the value to a hexidecimal value, follow these steps:

1. Run `chisel` in your terminal
2. Copy and paste the following into your terminal:
`uint256 puzzle = 6901746346790564457901554991452530692688817142401467382862937683132416`
3. Type `puzzle`, this should return:
```javascript
chisel                                                                                                                                                                                                                       ─╯
Welcome to Chisel! Type `!help` to show available commands.
➜ uint256 puzzle = 6901746346790564457901554991452530692688817142401467382862937683132416
➜ puzzle
Type: uint
├ Hex: 0x0000010000000000000700000000040200000000030000800000006000500000
└ Decimal: 6901746346790564457901554991452530692688817142401467382862937683132416
```
4. Use the `Hex` value for your puzzles!

Happy solving!

### Step 3 (Submitting answer)
If you think you have got the answer, head over to the `DeployPuzzle` file in `script/deploy/` and follow these steps:
- Let's say we wan to submit the solution to Puzzle1
- Open `script/deploy/DeployPuzzle.s.sol`
- Un-comment `testSolve()` and put your answer between the parentheses:
```javascript
file: script/deploy/DeployPuzzle1.s.sol

// testSolved();
testSolved(0x123);
```

If the script successfully runs, this means you have solved the puzzle. 
If it fails, you have submitted the wrong answer.

### Step 4 (Optional)
If you are stuck with a puzzle, the answers for all puzzles are in `script/deploy/DeployBase.sol`. 
You can use the answers in `DeployBase.sol` to try debugging the puzzles that are not working at the moment.
