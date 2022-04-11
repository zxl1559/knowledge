# 挖矿检测设备运维手册

每次操作原型机，做了什么操作，有什么输出/报错，都记录一下

## 访问原型机

挖矿检测原型机IP：192.168.1.82

## 原型机上代码部署位置

docker-selk （Suricata、ElasticSearch、Kibana、MetricBeat、FileBeat）的部署位置：/home/nta/docker-selk

pmd-web（挖矿检测Web界面）的部署位置：/home/nta/pmd-web

## 登录系统后切换到 nta 用户

暂不使用 nta 以外的用户进行运维操作，切换到 nta 用户的方法：

    sudo su - nta

## 撤销代码仓库里的临时修改

1. 确认可以撤销
2. 执行 git restore

    git restore 文件名

## 更新系统（拉取 master 分支）

1. 确保工作目录当前检出的是 master 分支
2. 拉取 master 分支的更新

    git pull origin master

## 切换到新的分支

如果需要临时部署还没有合并到 master 的分支

执行：

    git checkout 分支名

## 查看 filebeat 日志

查看所有日志：

	docker logs docker-selk_filebeat_1

实时查看日志：

	docker logs -f docker-selk_filebeat_1

按时间段筛选日志，以查看10分钟内的为例：

	docker logs --since=10m docker-selk_filebeat_1

日志一例：

	2021-11-18T02:15:49.373Z        WARN    [elasticsearch] elasticsearch/client.go:412     Cannot index event publisher.Event{Content:beat.Event{Timestamp:time.Time{wall:0x39c1c440, ext:63772798544, loc:(*time.Location)(nil)}, Meta:null, Fields:{"agent":{"ephemeral_id":"bada0cb1-02b4-4f11-9646-db7e6fac7155","hostname":"3f441add166a","id":"65568b8f-a584-433b-8801-b91a4c205e20","name":"3f441add166a","type":"filebeat","version":"7.15.0"},"coin":"eth","dp":4444,"dstip":"129.226.12.10","ecs":{"version":"1.11.0"},"event_type":"stratum","flow_id":2130466462561276,"hashrate":36736883,"host":{"name":"3f441add166a"},"package_size":160,"payload":{"id":6,"jsonrpc":"2.0","method":"eth_submitHashrate","params":["0x2308f73","559ea40dbc1ef9071a342fc05f84891485d3836d1a296c24a8eabed0a7b20c0f"],"worker":"2070"},"proto":"6","session_id":"559ea40dbc1ef9071a342fc05f84891485d3836d1a296c24a8eabed0a7b20c0f","sp":49399,"srcip":"192.168.1.132","worker":"2070"}, Private:file.State{Id:"native::22681462-66306", PrevId:"", Finished:false, Fileinfo:(*os.fileStat)(0xc0007ae820), Source:"/usr/local/var/log/stratum/payload.log", Offset:2930127, Timestamp:time.Time{wall:0xc05d36e2d329ba45, ext:10258118288, loc:(*time.Location)(0x5632451a9100)}, TTL:-1, Type:"log", Meta:map[string]string(nil), FileStateOS:file.StateOS{Inode:0x15a1776, Device:0x10302}, IdentifierName:"native"}, TimeSeries:false}, Flags:0x1, Cache:publisher.EventCache{m:common.MapStr(nil)}} (status=400): {"type":"illegal_argument_exception","reason":"field [flow] not present as part of path [flow.start]"}, dropping event!

关键信息在末尾：

	{"type":"illegal_argument_exception","reason":"field [flow] not present as part of path [flow.start]"}, dropping event!

