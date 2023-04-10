import { ethers, network } from "hardhat";

async function main() {
  

  const TUSDT = await ethers.getContractFactory("TUSDT");
  const tust = await TUSDT.deploy();

  console.log("chainId = ", network.config.chainId);
  

  await tust.deployed();
  
  console.log(`deployed to ${tust.address}`);
}

// We recommend this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
