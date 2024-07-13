# 本项目为区块链期末课设
## 环境需求
本文以Ubuntu 22.04.4 LTS为基础环境。在开始前，先运行sudo apt update更新系统组件。在此系统上安装部署了以太坊环境，
具体的实验配置及版本如下：

Name	Version 

Node.js	20.15.1 

geth	1.14.7-stable 

Go 	1.22.5

Yarn	1.22.22

Ganache	2.7.1

Truffle	5.11.5

MetaMask	11.12.2

Solidity	0.5.16

Web3.js 	1.10.0

## 后端
> 目录介绍
```
|-- Dapp
    |-- build                 // 合约编译后自动创建
    |-- contracts             // 放置合约文件
    |-- migrations            // 放置部署文件
    |-- test                  // 放置测试文件
```
## 前端
> 目录介绍
```
|-- Dapp
    |-- src             //项目根目录下创建src目录，存放前端文件
        -- index.html
        |-- js
        |-- fonts
        |-- css
    -- bs-config.json    // lite-server的配置文件
```
