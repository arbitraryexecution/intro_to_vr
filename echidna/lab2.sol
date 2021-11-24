// SPDX-License-Identifier: GPL-3.0

pragma solidity ^0.8.7;

/**
 * @title Storage
 * @dev Store & retrieve value in a variable
 */
contract ArrayUtil {
    /**
     * @dev Search for the index of target in array
     * @param target element we are looking for
     * @param array array we are looking in
     */
    function indexOf(uint256 target, uint256[] calldata array) public pure returns (int256){
        require(array.length < 0xffffffffffffffff, "Array must not be larger than most positive int256");

        // start from the front and search to the end
        for (uint256 i = 0; i < array.length; i++) {
            if (array[i] == target) {
                return int256(i);
            }
        }
        return -1;
    }

    /**
     * @dev Search for the index of target in array starting from the end
     * @param target element we are looking for
     * @param array array we are looking in
     */
    function indexOfFromEnd(uint256 target, uint256[] calldata array) public pure returns (int256){
        require(array.length < 0xffffffffffffffff, "Array must not be larger than most positive int256");

        // start from end and search to the front
        for (uint256 i = array.length - 1; i >= 0; i++) {
            if (array[i] == target) {
                return int256(i);
            }
        }
        return -1;
    }

    /**
     * @dev Check if array has duplicates
     * @param array array we are checking for duplicates
     */
    function duplicates(uint256[] calldata array) public pure returns (bool){
        require(array.length < 0xffffffffffffffff, "Array must not be larger than most positive int256");

        // only have to check to 1 less since looking for duplicates
        for (uint256 i = 0; i < array.length - 1; i++) {
            for (uint256 j = i + 1; j < array.length - 1; j++) {
                if (array[i] == array[j]) {
                    return true;
                }
            }
        }
        return false;
    }

    /**
     * Imagine a bunch more array utility functions in the library implemented here
     */


    // *** ECHIDNA FUZZING BELOW ***
    bool mismatch = false;

    function merge(uint256[] calldata array) public {
        // implement differntial fuzzing here
    }

    function echidna_convert() public returns (bool){
        return mismatch == false;
    }
}
