# MongoDB 写入数据

将 transactions 和 token_transfer 导入到 MongoDB:

先导入数据,再创建索引:

- `transactions`: 测试 190,4491条, 使用 0:00:51.041228 秒;
- `token_transfer`: 测试 142,1250条, 使用 0:00:31.821048 秒;

先创建索引, 再导入数据:

- `transactions`: 测试数据 190,4491条,使用 0:01:05.267648 秒
- `token_transfer`: 测试数据 142,1250条,使用 0:00:48.695575 秒

- MongoDB 空间占用情况;

```shell
> db.stats()
{
	"db" : "blockchain",
	"collections" : 2,
	"views" : 0,
	"objects" : 3325741,
	"avgObjSize" : 468.3121139018342,
	"dataSize" : 1557484798,
	"storageSize" : 528379904,
	"freeStorageSize" : 2543616,
	"indexes" : 10,
	"indexSize" : 311250944,
	"indexFreeStorageSize" : 20393984,
	"totalSize" : 839630848,
	"totalFreeStorageSize" : 22937600,
	"scaleFactor" : 1,
	"fsUsedSize" : 255531180032,
	"fsTotalSize" : 490652508160,
	"ok" : 1
}

```
