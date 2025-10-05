// SPDX-License-Identifier: MIT
pragma solidity ^0.8.24;

/// @title PrizeVault (Skeleton)
/// @notice Holds prize funds and releases them to winners.
/// @dev This is a minimal placeholder contract. Extend with your logic.
contract PrizeVault {
    address public admin;

    modifier onlyAdmin() {
        require(msg.sender == admin, "not admin");
        _;
    }

    constructor() {
        admin = msg.sender;
    }

    /// @notice Withdraw ETH to recipient
    function withdrawETH(address payable recipient, uint256 amount) external onlyAdmin {
        recipient.transfer(amount);
    }

    receive() external payable {}
}
