// import describe from "@nomicfoundation/hardhat-toolbox";
import { expect } from "chai"
import { ethers } from "hardhat";
import { HelloWorld, HelloWorld__factory, Counter, Counter__factory, SimpleStorage, SimpleStorage__factory, EtherWei, EtherWei__factory } from "../typechain-types";
import { Signer } from "ethers"

describe("deploy the contracts", async () => {

    let owner: Signer;
    let user1: Signer;
    let counterOwner: Signer;
    let simpleOwner: Signer;
    let etherWeiOwner: Signer;



    let helloWorld: HelloWorld;
    let counter: Counter;

    let rWrite: SimpleStorage;
    let etherWeiContract: EtherWei;




    beforeEach(" testing all solidity by example ", async () => {



        [owner, user1, counterOwner, simpleOwner, etherWeiOwner] = await ethers.getSigners();

        console.log(`\n\nOwner address:\n${await owner.getAddress()}\n`);
        console.log(`\n\nuserOne address:\n${await user1.getAddress()}\n`)

        helloWorld = await new HelloWorld__factory(owner).deploy()
        console.log("contract deployed on these address/n ", await helloWorld.getAddress());


        counter = await new Counter__factory(counterOwner).deploy();
        console.log(" counter contract deployed on these address/n ", await counter.getAddress());


        rWrite = await new SimpleStorage__factory(simpleOwner).deploy(200);  // set in the constructor my uint
        console.log(" read write update in simple storage contract deployed on these address/n ", await rWrite.getAddress());



        etherWeiContract = await new EtherWei__factory(etherWeiOwner).deploy();
        console.log(" ether Wei contract deployed on these address/n ", await etherWeiContract.getAddress());




    })

    it("calling public variable", async () => {
        console.log("in the it ")
        const varGreet = await helloWorld.connect(owner).greet();
        console.log("Contract greet value:", varGreet);

        expect(varGreet).to.equal("Hello World");
        console.log(varGreet, "varGreet");
        return varGreet;
    });

    it("testing the Counter contract increment", async () => {


        let countNo = await counter.connect(counterOwner).count();
        expect(countNo).to.be.equal(0);
        console.log("Initial count:", countNo.toString());

        await counter.connect(counterOwner).increment();
        countNo = await counter.count()
        expect(countNo).to.be.equal(1);
        console.log("After increment:", countNo.toString());

        // Increment again
        await counter.connect(counterOwner).increment();
        countNo = await counter.count();
        expect(countNo).to.equal(2);
        console.log("After second increment:", countNo.toString());

        // Decrement
        await counter.connect(counterOwner).decrement();
        countNo = await counter.count();
        expect(countNo).to.equal(1);
        console.log("After decrement:", countNo.toString());

        // Final count check
        const finalCount = await counter.count();
        expect(finalCount).to.equal(1);
        console.log("Final count:", finalCount.toString());

    });


    it("testing the simple storage contract", async () => {
        // Check MY_ADDRESS
        let my_ADDRESS = await rWrite.MY_ADDRESS();
        console.log(my_ADDRESS, "owner address");
        expect(my_ADDRESS.toLowerCase()).to.equal("0x90F79bf6EB2c4f870365E785982E1f101E93b906".toLowerCase());

        // Check initial storedData
        let sData = await rWrite.storedData();
        console.log(sData.toString(), "Initial storedData");
        expect(sData).to.equal(0); // Assuming it's initialized to 0

        // Check MY_UINT
        let uintValue = await rWrite.MY_UINT();
        console.log(uintValue.toString(), "MY_UINT value");
        expect(uintValue).to.equal(200); // Assuming it's set to 200 in the constructor

        // Set new value
        const newValue = 42;
        await rWrite.connect(simpleOwner).set(newValue);

        // Check updated storedData
        sData = await rWrite.storedData();
        console.log(sData.toString(), "Updated storedData");
        expect(sData).to.equal(newValue);

        // Use get function to retrieve value
        const getData = await rWrite.get();
        console.log(getData.toString(), "getData");
        expect(getData).to.equal(newValue);
    });



    it.only("testing the ether wei contract", async () => {


        // let oneWeii = await etherWeiContract.connect(etherWeiOwner).oneWei();
        // console.log(oneWeii.toString(), "one wei")
        // const weiOne = await etherWeiContract.oneWei()
        // console.log((await weiOne).toString(),"one")
        // expect((await weiOne).toString()).to.be.equal(1)

        let oneWei = await etherWeiContract.connect(etherWeiOwner).isOneGwei();
        console.log(oneWei, "one wei))))))))")
        expect(oneWei).to.be.true;


        // let oneGwei = await etherWeiContract.connect(etherWeiOwner).oneGwei();
        let oneGwei = await etherWeiContract.oneGwei();

        console.log(oneGwei.toString(), "one gwei++++++++++++++")
        expect(oneGwei.toString()).to.be.equal(await ethers.parseUnits('1', "gwei"));

        let gwei = await etherWeiContract.isOneGwei();
        console.log(gwei, "gwei")
        expect(gwei).to.be.true;


        let onGwei = await etherWeiContract.oneGwei();
        console.log(onGwei, "one Gwei")
        expect(onGwei).to.equal(BigInt(1e9));


        //  ether
        const oneEther = await etherWeiContract.oneEther();
        console.log(oneEther.toString(), "one ether")
        console.log(await ethers.parseEther('1').toString(),"await ethers.parseEther('1')")
        expect(oneEther.toString()).to.be.equal(await ethers.parseEther('1'));


        const isOneEther = await etherWeiContract.isOneEther();
        console.log(isOneEther, "oneEther");
        expect(isOneEther).to.be.true;



    })

});