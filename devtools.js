// devToolsLibrary.js

class TokenizedEconomyDevTools {
    constructor(oracleContractAddress, web3) {
        this.oracleContract = new web3.eth.Contract(oracleABI, oracleContractAddress);
    }

    async getPriceFromOracle(asset) {
        try {
            const price = await this.oracleContract.methods.getPrice(asset).call();
            return price;
        } catch (error) {
            console.error('Error fetching price from Oracle:', error);
            throw error;
        }
    }
}

// Example Usage:
// Replace 'YOUR_ORACLE_CONTRACT_ADDRESS' with the actual address of your Oracle contract.
const oracleContractAddress = 'YOUR_ORACLE_CONTRACT_ADDRESS';
const web3 = new Web3('YOUR_WEB3_PROVIDER_URL'); // Replace with your actual Web3 provider URL.
const devTools = new TokenizedEconomyDevTools(oracleContractAddress, web3);

// Example usage of getPriceFromOracle function
const asset = 'ETH/USD'; // Replace with the actual asset for which you want the price.
devTools.getPriceFromOracle(asset)
    .then(price => console.log(`The price of ${asset} is: ${price}`))
    .catch(error => console.error('Error:', error));