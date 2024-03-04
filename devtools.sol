// TokenizedEconomyDevTools.sol

// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Assuming you have an interface for the Pricing Oracle
interface PricingOracle {
    function getPrice(string memory asset) external view returns (uint256);
}

   
contract TokenizedEconomyDevTools {

    constructor() {
      // Add Functions
    }

    // Function to fetch price from a specific oracle for a given asset
    function getPriceFromOracle(address oracleAddress, string memory asset) external view returns (uint256) {
        PricingOracle oracle = PricingOracle(oracleAddress);
        return oracle.getPrice(asset);
    }
}
