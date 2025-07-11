// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;

import "@openzeppelin/contracts-upgradeable/proxy/utils/Initializable.sol";
import "@openzeppelin/contracts-upgradeable/access/OwnableUpgradeable.sol";

contract CounterV2 is Initializable, OwnableUpgradeable {
    uint256 public counter;

    /// @dev Initialize v1 (for compatibility, not called in v2 upgrades)
    function initialize(uint256 _initialValue) public initializer {
        __Ownable_init(msg.sender);
        counter = _initialValue;
    }

    /// @dev Initialize v2 (for upgrades)
    function reinitialize(uint256 _newValue) public onlyOwner reinitializer(2) {
        counter = _newValue;
    }

    /// @dev Increment counter
    function increment() public {
        counter++;
    }

    /// @dev Get version (for testing)
    function getVersion() public pure returns (string memory) {
        return "v2";
    }
}