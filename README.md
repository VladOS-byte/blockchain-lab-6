# blockchain-lab-6
## Requirements
- python3
- eth-brownie
## Pre-usage
- install brownie
- [create](https://eth-brownie.readthedocs.io/en/stable/network-management.html?highlight=network#using-a-forked-development-network) fork mainnet network in brownie
## Usage
- For test use
```
brownie test -s --disable-warnings --network mainnet-fork
```
## Output
- For test
```
MBP-Vlad-2:blockchain-lab-6 vlad$ brownie test -s --disable-warnings --network mainnet-fork
Brownie v1.19.2 - Python development framework for Ethereum

================================= test session starts ==================================
platform darwin -- Python 3.8.9, pytest-6.2.5, py-1.11.0, pluggy-1.0.0 -- /Library/Developer/CommandLineTools/usr/bin/python3
cachedir: .pytest_cache
hypothesis profile 'brownie-verbose' -> verbosity=2, deadline=None, max_examples=50, stateful_step_count=10, report_multiple_bugs=False, database=DirectoryBasedExampleDatabase(PosixPath('/Users/vlad/.brownie/hypothesis'))
rootdir: /Users/vlad/GitHub/alchemy-ethereum-api/blockchain-lab-6
plugins: eth-brownie-1.19.2, anyio-3.6.1, forked-1.4.0, web3-5.31.1, xdist-1.34.0, hypothesis-6.27.3
collected 1 item                                                                       

Launching 'ganache-cli --accounts 10 --hardfork istanbul --fork https://eth-mainnet.alchemyapi.io/v2/5HKq7S1lnvTuNZGqkfocRIcd7BIcsGZ7 --gasLimit 12000000 --mnemonic brownie --port 8545 --chainId 1'...

tests/test_swap.py::test_swap RUNNING
Import contracts
Fetching source of 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2 from api.etherscan.io...
Fetching source of 0x514910771AF9Ca656af840dff83E8264EcF986CA from api.etherscan.io...
Fetching source of 0xdAC17F958D2ee523a2206206994597C13D831ec7 from api.etherscan.io...
Deposit
wETH deposit for account: <Transaction '0x1e39b680f92df1ab0b046b36af5c5fffce8d15f9d9ad40108f16a4f743c80668'>
Deploy FlashLoan
Deploed
Deposit FlashLoan
Token: Wrapped Ether by address: 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
FlashLoan balance: 10000000000000000
Token: ChainLink Token by address: 0x514910771AF9Ca656af840dff83E8264EcF986CA
FlashLoan balance: 0
Token: Tether USD by address: 0xdAC17F958D2ee523a2206206994597C13D831ec7
FlashLoan balance: 0
Circle tranfer
Token: Wrapped Ether by address: 0xC02aaA39b223FE8D0A0e5C4F27eAD9083C756Cc2
FlashLoan balance: 9613095499935367
Token: ChainLink Token by address: 0x514910771AF9Ca656af840dff83E8264EcF986CA
FlashLoan balance: 0
Token: Tether USD by address: 0xdAC17F958D2ee523a2206206994597C13D831ec7
FlashLoan balance: 0
tests/test_swap.py::test_swap PASSED

================================== 1 passed in 53.28s ==================================
Terminating local RPC client...
```
