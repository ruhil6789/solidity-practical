import { ethers } from "hardhat";


async function main(){
    const HelloWorld = await ethers.getContractFactory("HelloWorld");
    const helloWorld = await HelloWorld.deploy();
    // await helloWorld.deployed();
    
    console.log("HelloWorld deployed to:", helloWorld.getAddress());
    const counter = await ethers.getContractFactory("Counter");
    const Counter = await counter.deploy();

    console.log("HelloWorld deployed to:", Counter.getAddress());
}
main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});