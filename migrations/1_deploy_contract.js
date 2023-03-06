const book= artifacts.require("./MedicalChain.sol");

module.exports= function(deployer){
    deployer.deploy(book);
 
}
