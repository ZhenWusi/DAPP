// SPDX-License-Identifier: MIT
pragma solidity ^0.5.0;//指定了 Solidity 编译器的版本范围。^0.5.0 表示使用 0.5.0 版本及以上的编译器
pragma experimental ABIEncoderV2;
//这是一个实验性特性的声明。ABIEncoderV2 是 Solidity 中的一个特性，
//允许函数接受和返回任意类型的数组和结构体。由于其实验性质，需要显式声明以启用该功能。
contract Grocery {
    // 商品结构体
    struct Goods {
        string name;  // 商品名称
        string img;   // 商品图片链接
        bool isClaim; // 是否已被领取
    }
    mapping(uint => address) goodsMap;  // 商品的归属地址映射
    Goods[] public goodsList;           // 所有商品列表
    mapping(address => uint[]) claimList;  // 用户领取的商品列表
    mapping(address => int) claimNum;   // 用户已领取数量统计
    int maxClaim = 10;                  // 最大领取数量，可以通过添加商品来增加领取机会
    // @notice 添加商品
    function AddGoods(string memory _name, string memory _img) public returns (uint){
        uint id = goodsList.push(Goods(_name, _img, false)) - 1;  // 创建新商品并添加到列表中
        goodsMap[id] = msg.sender;  // 将商品与发布者关联
        claimNum[msg.sender] -= 1;  // 每添加一个商品，用户领取机会减一
        return id;  // 返回商品ID
    }
    // @notice 领取商品
    function Claim(uint _id) public {
        require(claimNum[msg.sender] <= maxClaim, "您已经领取的足够多了");  // 检查用户是否达到领取上限
        require(!goodsList[_id].isClaim, "该商品已经被认领");  // 检查商品是否已被领取
        goodsMap[_id] = msg.sender;  // 将商品分配给领取者
        goodsList[_id].isClaim = true;  // 标记商品已被领取
        claimList[msg.sender].push(_id);  // 将商品ID添加到用户的领取列表中
        claimNum[msg.sender] += 1;  // 增加用户已领取数量
    }
    // @notice 获取所有的商品
    function GetAllGoods() public view returns (Goods[] memory){
        return goodsList;  // 返回所有商品列表
    }
    // @notice 获取商品归属地址
    function GoodsOf(uint _id) public view returns (address) {
        return goodsMap[_id];  // 返回商品的归属地址
    }
}
