// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.7.6;

/**
 * @title SimpleBank
 * @dev Lets people deposit and withdraw funds
 */
contract SimpleBank {
    mapping(address => uint256) public balances;
    uint256 minimumBalance = 1 ether;

    /**
     * @dev Deposit funds into contract
     */
    function deposit() public payable {
        balances[msg.sender] += msg.value;
        totalDeposited += msg.value;
    }

    /**
     * @dev Withdraw funds from contract
     * @param amount amount of value to withdraw
     */
    function withdraw(uint256 amount) public checkMinimumAndUnderflow(amount) {
        balances[msg.sender] -= amount;

        (bool sent,) = payable(msg.sender).call{value: amount}("");
        require(sent, "Failed to send Ether");
    }

    /**
     * @dev Burns a number of tokens
     * @param amount amount to burn
     */
    function burn(uint256 amount) public checkMinimumAndUnderflow(amount) {
        balances[msg.sender] -= amount;
    }

    /**
     * @dev Checks for minimum balance after operation and mathematical underflows
     * @param amount amount expected to leave the msg.sender's balance
     */
    modifier checkMinimumAndUnderflow(uint256 amount) {
        // check for minimum balance
        require(balances[msg.sender] > minimumBalance, "Can't remove funds if you have less than the minimum balance");
        require(balances[msg.sender] - amount >= minimumBalance, "Cannot remove funds under minimum balance");

        // check for underflow
        require(amount < balances[msg.sender] + minimumBalance, "Underflow detected! Reverting!");
        _;
    }

    // *** ECHIDNA FUZZING BELOW ***
    uint256 totalDeposited = 0;

    function echidna_test() public returns (bool){
        // echidna test logic goes here
        return balances[msg.sender] <= totalDeposited;
    }

    // TODO 
    // 1. track totalDeposited
    // 2. implement logic in echidna_test to return false if an incorrect state arises
}
