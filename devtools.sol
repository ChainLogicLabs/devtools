// SPDX-License-Identifier: GPL-3.0
pragma solidity ^0.8.0;

// Pricing Oracle Interface
interface PricingOracle {
    function getPrice(string memory asset) external view returns (uint256);
}

contract TokenizedEconomyDevTools {
    address public owner;

    // Modifier to restrict access to the owner only
    modifier onlyOwner() {
        require(msg.sender == owner, "Only the owner can call this function");
        _;
    }

    // Constructor sets the contract owner
    constructor() {
        owner = msg.sender;
    }

    // Function to fetch price from a specific oracle for a given asset
    function getPriceFromOracle(address oracleAddress, string memory asset) external view returns (uint256) {
        PricingOracle oracle = PricingOracle(oracleAddress);
        return oracle.getPrice(asset);
    }

    // Function only accessible by the owner for demonstration purposes
    function exampleFunction() external onlyOwner {
        // Perform actions only the owner can do
    }
}
