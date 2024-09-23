import { HardhatUserConfig } from "hardhat/config";
import "@nomicfoundation/hardhat-toolbox";
const key: any = process.env.ACCOUNT_OWNER_PVT_KEY || "";
console.log(key, "key")
const config: HardhatUserConfig = {
  solidity: {
    compilers: [
      {
        version: "0.8.24",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
      {
        version: "0.8.20",
        settings: {
          optimizer: {
            enabled: true,
            runs: 200,
          },
        },
      },
    ],
  },

  networks: {
    // amoy: {
    //   url: process.env.AMOY_RPC,
    //   chainId: 8002,
    //   accounts: [key]
    // },
    // localhost: {
    //   url: "http://127.0.0.1:8545/",
    //   chainId: 31337,
    //   accounts: [key],
    // },
    // sepolia: {
    //   url: "https://eth-sepolia.public.blastapi.io",
    //   chainId: 11155111,
    //   accounts: ["0x49aedcb270360f4fc06d268b0f054c3e6db89592047bb2b9dffd9e24d08c68fccccc1"],
    // },
    // bscTestnet: {
    //   // url: "https://bsc-testnet.publicnode.com",
    //   url: process.env.BSC_RPC,
    //   chainId: 97,
    //   accounts: ["0x49aedcb270360f4fc06d268b0f054c3e6db89592047bb2b9dffd9cccccce24d08xxxc68f1"]
    // },
  }
};

export default config;
