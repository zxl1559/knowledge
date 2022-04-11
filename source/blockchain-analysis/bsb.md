# 币安智能链 BSB

## 部署节点

https://docs.binance.org/smart-chain/developer/fullnode.html

https://docs.binance.org/smart-chain/developer/snapshot

创始块：

    /mnt/md0/modi/bsb/geth --datadir /mnt/md0/modi/bsb/data init genesis.json

启动节点：

    //nohup /mnt/md0/modi/bsb/geth --datadir /mnt/md0/modi/bsb/data --config ./config.toml --syncmode full --gcmode archive --txlookuplimit 0 --cache 8192 --cache.preimages --http --http.addr 0.0.0.0 &
    nohup /mnt/md0/modi/bsb/geth --datadir /mnt/md0/modi/bsb/data --config /mnt/md0/modi/bsb/config.toml --syncmode full --txlookuplimit 0 --cache 8192 --http --http.addr 0.0.0.0 &

## 维护节点

查看同步状态：

    /mnt/md0/modi/bsb/geth --datadir /mnt/md0/modi/bsb/data attach -exec "eth.syncing"

停止节点：

    kill -INT <pid>

