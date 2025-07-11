// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract CounterV1 is Initializable, OwnableUpgradeable {
    uint256 public counter;

    /// @dev Initialize v1
    function initialize(uint256 _initialValue) public initializer {
        __Ownable_init(msg.sender);
        counter = _initialValue;
    }

    /// @dev Increment counter
    function increment() public {
        counter++;
    }

    /// @dev Get version (for testing)
    function getVersion() public pure returns (string memory) {
        return "v1";
    }
}