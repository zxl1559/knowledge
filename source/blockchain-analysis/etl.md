区块链交易数据的校验方法:

## BTC:

- 主币交易: 样本数据: 70_0000--70_0001区间内的区块;

  - 校验依据: 与`blockchair`的数据做对比;
  - 数据解析方式: 调用`bitcoinetl`;
  - 校验内容: 每个区块内的主币交易数, 每笔交易的输入和输出地址数, 金额, 时间;
  - 抽查若干笔交易, 检验其输入和输出地址;
  - 校验结果: 数据完全一致;
  - **解析存在的问题**: `bitcoinetl`包对部分铸币交易的输出地址解析有误, 如`0e3e2357e806b6cdb1f70b54c3a3a17b6714ee1f0e68bebb44a74b1efd512098`的输出地址是`12c6DSiU4Rq3P4ZxziKxzrL5LmMBrzjrJX`, 但是解析出的输出地址是`nonstandard348dc4a6a27203ca9acb1c9073872fff5c7c837e`. 该现象在最初的区块比较普遍 (具体范围还未证实)
- `omni`代币交易: 样本数据: 70_0000--70_0099区间区块;
  - 解析方式: 调`omni`节点的`api`:
    - 校验内容: 每个区块内的代币交易数 (目前只处理`simple send`类型的代币); 每笔交易的交易ID, 交易币种,  金额, 时间, 输入地址, 输出地址;
    - 校验依据: 与`blockchair`的数据做对比;
    - 缺点: 调用`omni`节点`api`, 当代币交易比较多时, 调用`api`的速度比较慢;
    - 校验结果: 数据完全一致;

## ETH:

- 样本数据为200个区块( 1200_0300--1200_0499);
- 解析方式: 调用`ethereumetl`;
- 校验每个区块中包含的主币交易数: 和`tokenview`数据完全一致;
- 校验每个区块中包含的代币交易: 个别区块(占比不超过5%)的代币交易数比`tokenview`多1-2笔(绝大部分情况是1笔, 极少数是多2笔); 原因: `ETH-ETL` package 对代币的处理逻辑和`tokenview`不太一样;
- 交易详情: 手动随机抽查20+笔交易, 数据完全一致;

## BSC:

- 数据校验: (样本为 700_0000--700_0500区间)
  - 主币交易数: 和调用`eth_getBlockTransactionCountByHash`接口返回的数值完全一样; 
  - 代币交易数: 统计每天泰达币相关的交易笔数, 与BSC官方给出的泰达币每日统计数据做对比, 两者数据一致, 几乎验证了所有日期(从20年9月--21年8月);
  - 交易详情: 手动随机抽查20+笔交易, 数据一致;

## 波场链:

- 数据校验: 样本为连续的600个区块(2500_0000--2500_0200, 2500_0400--2500_0800)
  - 校验每个区块中包含的主币交易数: 和`tokenview`数据完全一致
  - 校验每个区块中包含的代币交易: 个别区块(占比大约为5-10%)的代币交易数比`tokenview`多1-2笔(绝大部分情况是1笔, 极少数是多2笔); 
  - 原因: 会将`Transfer(from,to,value)`也当做代币交易, 目前还没有找到区分`Transfer(src,dst,wad)` `Transfer(from,to,value)`两者的方法;
  - 交易详情: 手动随机抽查20+笔交易, 数据一致;