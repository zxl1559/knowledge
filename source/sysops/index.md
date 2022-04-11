# 运维

## 以太坊节点

查看节点同步状态：

    sudo -u ethereum -H docker-compose --project-directory /ssd1/ethereum/geth/ exec node geth attach -exec "eth.syncing"

查看区块链数据大小：

    sudo -u ethereum -H du -sh /ssd1/ethereum/geth/data

查看 ancient 数据大小：

    sudo -u ethereum -H du -sh /ssd1/ethereum/geth/data/.ethereum/geth/chaindata/ancient

## 硬件

| 设备编号 | CPU 核数 | CPU 型号 | 内存 | 内存型号 | 硬盘 | 用途
| -------- | -------- | -------- | ---- | -------- | ---- | ----
| srv01 | 16 | 2 * Intel Xeon Silver 4208 8C 16T 2.1GHz | 128G | 2 * DDR4 2666 32G<br>2 * DDR4 2333 32G | 2 * SATA SSD 480G<br>6 * HDD 4T | 公网服务（VPN、NAT）<br>GitLab<br>DNS<br>文件共享<br>比特币节点
| srv02 | 16 | 2 * Intel Xeon Silver 4208 8C 16T 2.1GHz | 128G | 2 * DDR4 2666 32G<br>2 * DDR4 2333 32G | 2 * SATA SSD 480G<br>6 * HDD 4T | MongoDB
| blockchain | 8 | 1 * Intel Core i7-11700 8C 16T 2.5GHz | 32G | 2 * DDR4 2400 16G | 1 * NVMe SSD 500G<br>1 * 三星 870 EVO SATA SSD 4T<br>2 * 三星 870 QVO SATA SSD 8T | 以太坊节点<br>波场节点
| dev | 8 | 1 * Intel Core i7-11700 8C 16T 2.5GHz | 32G | 2 * DDR4 2400 16G | 1 * NVMe SSD 500G<br>2 * 三星 870 EVO SATA SSD 4T | 币安智能链节点<br>远程开发<br>数据运算
| backup | 6 | 1 * Intel Core i5-11400 6C 12T 2.6GHz | 8G | 1 * DDR4 2666 8G | 1 * NVMe SSD 250G<br>6 * HDD 4T | 数据备份
