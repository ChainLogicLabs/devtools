// TokenizedEconomyDevTools.sol

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Assuming you have an interface for the Pricing Oracle
interface PricingOracle {
    function getPrice(string memory asset) external view returns (uint256);
}

contract TokenizedEconomyDevTools {
    address public oracleAddress;

    constructor(address _oracleAddress) {
        oracleAddress = _oracleAddress;
    }

    function getPriceFromOracle(string memory asset) external view returns (uint256) {
        PricingOracle oracle = PricingOracle(oracleAddress);
        return oracle.getPrice(asset);
    }
}