pragma solidity ^0.6.0;

import { FlashLoanReceiverBase } from "aave/contracts/flashloan/base/FlashLoanReceiverBase.sol";
import { ILendingPool } from "aave/contracts/interfaces/ILendingPool.sol";
import { ILendingPoolAddressesProvider } from "aave/contracts/interfaces/ILendingPoolAddressesProvider.sol";
import { IERC20 } from "openzeppelin/contracts/token/ERC20/IERC20.sol";
import "uniswap_periphery/contracts/interfaces/IUniswapV2Router01.sol";

contract CicleFlashLoan is FlashLoanReceiverBase {

    IUniswapV2Router01 public immutable router = IUniswapV2Router01(0x7a250d5630B4cF539739dF2C5dAcb4c659F2488D);

    address[] public cicle;

    constructor(ILendingPoolAddressesProvider provider) public FlashLoanReceiverBase(provider) {

    }

    function executeOperation(
        address[] calldata assets,
        uint256[] calldata amounts,
        uint256[] calldata premiums,
        address initiator,
        bytes calldata params
    )
        external
        override
        returns (bool)
    {
    	uint256 amount = amounts[0];

    	IERC20(assets[0]).approve(address(router), amount);

    	address[] memory path = new address[](cicle.length);

    	for (uint i = 0; i < cicle.length; i++) {
	    	path[i] = cicle[i];
	    }

	    router.swapExactTokensForTokens(amount, 0, path, address(this), block.timestamp);

    	uint amountOwing = amounts[0].add(premiums[0]);
        IERC20(assets[0]).approve(address(LENDING_POOL), amountOwing);
        
        return true;
    }

    function cicleFlashLoanCall(address[] memory _cicle, uint256 _amount) public {
        address receiverAddress = address(this);

        cicle = _cicle;

        address[] memory assets = new address[](1);

        uint256[] memory amounts = new uint256[](1);

        // 0 = no debt, 1 = stable, 2 = variable
        uint256[] memory modes = new uint256[](1);

        for (uint i = 0; i < 1; i++) {
        	assets[i] = _cicle[i];
        	amounts[i] = _amount;
        	modes[i] = 0;
        }

        address onBehalfOf = address(this);
        bytes memory params = "";
        uint16 referralCode = 0;

        LENDING_POOL.flashLoan(
            receiverAddress,
            assets,
            amounts,
            modes,
            onBehalfOf,
            params,
            referralCode
        );
    }
}