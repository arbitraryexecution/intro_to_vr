// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.6;

/**
 * @title SimpleBank
 * @dev Lets people deposit and withdraw funds
 */
contract SimpleBank {
    mapping(address => uint256) public balances;

    /**
     * @dev Deposit funds into contract
     */
    function deposit() public payable {
        balances[msg.sender] += msg.value;
    }

    /**
     * @dev Withdraw funds from contract
     * @param amount amount of value to withdraw
     */
    function withdraw(uint256 amount) public {
        // check for underflow
        require(amount < balances[msg.sender], "Underflow detected! Reverting!");

        balances[msg.sender] -= amount;

        (bool sent,) = payable(msg.sender).call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

    /**
     * @dev Burns a number of tokens
     * @param amount amount to burn
     */
    function burn(uint256 amount) public {
        balances[msg.sender] -= amount;
    }

    /**
     * @dev Return value in the bank
     */
    function TVL() public view returns(uint256){
        return address(this).balance;
    }
}
