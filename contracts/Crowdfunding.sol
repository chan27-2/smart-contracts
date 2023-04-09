// SPDX-License-Identifier: GPL-3.0
pragma solidity >=0.8.2 <0.9.0;

contract CrowdFundingContract {
    address payable public owner;

    constructor() {
        owner = payable(msg.sender);
    }

    function fundAmount() public payable {}

    function getBa() public view returns (uint256) {
        return address(this).balance;
    }

    function withdraw(uint256 amount) public {
        require(owner == msg.sender, "Only Owner");
        (bool sent, ) = owner.call{value: amount}("");
        require(sent, "Withdraw failed");
    }
}
