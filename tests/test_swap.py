#!/usr/bin/python3

import pytest
from brownie import Contract, CicleFlashLoan
import time

def test_swap(accounts):
    weth = "0xc02aaa39b223fe8d0a0e5c4f27ead9083c756cc2"
    link = "0x514910771AF9Ca656af840dff83E8264EcF986CA"
    usdt = "0xdAC17F958D2ee523a2206206994597C13D831ec7"

    print('Import contracts')
    weth_contract = Contract.from_explorer(weth)
    time.sleep(10)
    link_contract = Contract.from_explorer(link)
    time.sleep(10)
    usdt_contract = Contract.from_explorer(usdt)

    print('Deposit')
    dep = weth_contract.deposit({'from': accounts[0], 'value': 1e18})
    print('wETH deposit for account: ' + str(dep))

    print('Deploy FlashLoan')
    flashloan = CicleFlashLoan.deploy('0xB53C1a33016B2DC2fF3653530bfF1848a515c8c5', {'from': accounts[0]})
    print('Deploed')

    print('Deposit FlashLoan')
    weth_contract.transferFrom(accounts[0], flashloan, 1e16, {'from': accounts[0]})

    for token in [weth_contract, link_contract, usdt_contract]:
        print('Token: ' + str(token.name()) + ' by address: ' + str(token))
        print('FlashLoan balance: ' + str(token.balanceOf(flashloan)))

    print('Circle tranfer')
    flashloan.cicleFlashLoanCall([weth, link, usdt, weth], 1e16)

    for token in [weth_contract, link_contract, usdt_contract]:
        print('Token: ' + str(token.name()) + ' by address: ' + str(token))
        print('FlashLoan balance: ' + str(token.balanceOf(flashloan)))


