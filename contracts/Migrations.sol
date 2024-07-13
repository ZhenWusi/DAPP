// SPDX-License-Identifier: MIT
// 指定合约的许可证标识为 MIT 许可证

pragma solidity >=0.4.22 <0.8.0;
// 指定 Solidity 编译器的版本范围，要求版本大于等于 0.4.22 且小于 0.8.0

contract Migrations {
    address public owner = msg.sender;
    // 合约的所有者地址，默认为部署合约的账户地址

    uint public last_completed_migration;
    // 记录最后一次完成的迁移版本号

    modifier restricted() {
        // 修饰符：限制调用者必须是合约的所有者
        require(
            msg.sender == owner,
            "This function is restricted to the contract's owner"
        );
        _;  // 执行函数体
    }

    function setCompleted(uint completed) public restricted {
        // 设置最后完成的迁移版本号，只有合约所有者可以调用
        last_completed_migration = completed;
    }
}
