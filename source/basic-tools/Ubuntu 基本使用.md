Ubuntu 基础使用:

## 查看帮助信息/文档:

- apt --help
- man apt


## 文件系统:

- 文件权限;

  - 角色: user, group, other;
  - 当前用户名称: `whoami` `id`
  - 每种角色的权限: `ll`或者`ls -alh`

  ```shell
  total 64K
  drwxrwxrwx 15 light light 4.0K 1月  12 09:46 ./
  drwxr-xr-x 46 light light 4.0K 1月  12 15:17 ../
  drwxrwxr-x  9 light light 4.0K 1月  12 09:47 blockchain-analysis/
  drwxrwxr-x 14 light light 4.0K 1月   7 15:53 blockchain-etl/
  ```

  - d: directory, r: read, w:write, x:execute;
  - 更改文件权限: `sudo chmod [ugoa][-+=][rwx] file/directory`

## 包管理:

- 作用：

  - 安装、查找、卸载包；
  - 包版本控制和更新；
  - 解决包之间的依赖；

- 更改源镜像地址;

  - 修改源配置文件: 

    - [阿里云指导文件](https://developer.aliyun.com/mirror/ubuntu)

    - `sudo vim /etc/apt/sources.list`

    - 将`archive.ubuntu.com` 全部替换为`mirrors.aliyun.com`

    - vim 命令: `%s/archive.ubuntu.com/mirrors.aliyun.com/g`;

      ```shell
      deb http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
      deb-src http://mirrors.aliyun.com/ubuntu/ focal main restricted universe multiverse
      
      deb http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
      deb-src http://mirrors.aliyun.com/ubuntu/ focal-security main restricted universe multiverse
      
      deb http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
      deb-src http://mirrors.aliyun.com/ubuntu/ focal-updates main restricted universe multiverse
      
      deb http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
      deb-src http://mirrors.aliyun.com/ubuntu/ focal-proposed main restricted universe multiverse
      
      deb http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
      deb-src http://mirrors.aliyun.com/ubuntu/ focal-backports main restricted universe multiverse
      ```
      

  - 通过GUI： software&updates -> download from: mirrors.aliyun.com

- apt 常用操作;

  - 查看已经安装的包: `sudo apt list`;

  - 搜索: `sudo apt search php curl`

  - 安装包: `sudo apt install php7.4-curl`

  - 卸载包: 

    `sudo apt remove php7.4-curl`:只卸载当前包, 不卸载依赖包;

    `sudo apt autoremove php7.4-curl`: 同时卸载当前包和依赖包;

    `sudo apt remove/autoremove --purge php7.4-curl`: 还会删除配置文件;

  - 更新包索引: 索引文件为`/etc/apt/sources.list`和`/etc/apt/sources.list.d/`(自定义源存放路径)

    `sudo apt update`

  - 升级包: `sudo apt upgrade`; 

  - 查看包的详细内容: `sudo apt show vim`;

- dpkg: 安装本地 deb 文件;

  - `sudo dpkg -i zip_3.0-4_amd64.deb`
  - `sudo dpkg -r zip`

## 查看操作系统版本:

- `uname -a`;
- `cat /proc/version`;

## 硬件配置(略):

- `lshw` (list hardware)
- CPU: `cat /proc/cpuinfo`
- 内存使用: `free -h`;
- 文件大小: `du -hd 1 directory`
- 网络配置: `ip a`

## 进程管理:

- ps: 
- 显示所有用户的所有进程:
  - `ps -ef`: 标准写法;
  - `ps aux`: BSD 写法;
  - `--forest`: 以树形结构展示进程间的关系;
  - 和`grep`一起使用;(pipeline 思想)
  - `ps -u username`: 列出当前用户的所有进程;
- kill:
  - `kill pid`;
  - `kill -9 -1`: 终止当前用户拥有的所有进程;
  - `pkill pro_name`: 通过程序名, 终止该程序的所有进程;
  - `pkill -u user_name`:结束该用户的所有进程;
- `nohup python ./test.py > test.log 2>&1 &`: 
  - `2>&1`表示将标准错误 2 重定向到标准输出 &1 ，标准输出 &1 再被重定向输入到 test.log 文件中
  - 最后的`&`表示以后台方式运行程序
  - `> test.log`表示将输入保存到`test.log`文件, 默认保存到 `nohup.out`.

## 安装常用软件(略):

- 中文输入法;
  - 安装 fcitx `sudo apt-get install fcitx`;
  - [安装iBus 输入法](https://wiki.ubuntu.com.cn/IBus)
  - 安装 [搜狗输入法](https://pinyin.sogou.com/linux/help.php)
- [安装微信](https://www.ubuntukylin.com/applications/106-cn.html)
- [安装钉钉](https://alidocs.dingtalk.com/i/p/nb9XJlJ7QbxN8GyA/docs/nb9XJOPQ3K25LmyA)
- [安装edge](https://www.microsoft.com/en-us/edge?r=1#evergreen)
- 安装Chrome: `sudo apt install google-chrome-stable`

## 解压缩文件:

- zip: 在 Win, Mac和Linux上通用;

```shell
# [加密]压缩文件
zip -P pwd zipped/file/path file0 file1...
zip -e zipped/file/path file0 file1...

# 压缩文件夹
zip -rP pwd zipped/file/path file/folder/path
zip -re pwd zipped/file/path file/folder/path

# 解压[加密]文件
unzip zipped/file/path
unzip -P pwd zipped/file/path
```

- tar: 只能在Mac和Linux上使用;

  - 打包: 把多个文件或文件夹打包打包成一个文件(不进行压缩):

    ```shell
    # 打包(新建打包文件)
    tar -cf archive.tar file0 file1 directory0
    
    # 向打包文件中添加新文件
    tar -rf archive.tar file2
    
    # 从打包文件中提取出单个文件/文件夹
    tar -xf archive.tar
    
    # 打包并且进行压缩
    tar -zrf archive.tar.gz file0 file1
    ```

- gzip: 对打包的 tar 文件进行压缩;

  ```bash
  # 压缩(指定压缩等级)
  gzip -4 archive.tar
  
  # 解压
  gzip -d archive.tar.gz
  ```

  

## 测试网络连通性

- 测试内网连接: `ping -c 3 192.168.1.1`;
- 测试外网连接: `ping -c 3 223.5.5.5`;
- 测试DNS: `ping -c 3 www.baidu.com`;

## 远程访问(略):

- ## 配置静态 IP

  1. 通过 `ip a` 获取网卡相关信息;

     ```shell
     light@Nasil:~$ ip a
     1: lo: <LOOPBACK,UP,LOWER_UP> mtu 65536 qdisc noqueue state UNKNOWN group default qlen 1000
         link/loopback 00:00:00:00:00:00 brd 00:00:00:00:00:00
         inet 127.0.0.1/8 scope host lo
            valid_lft forever preferred_lft forever
         inet6 ::1/128 scope host 
            valid_lft forever preferred_lft forever
     2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
         link/ether 8c:ec:4b:c9:3e:34 brd ff:ff:ff:ff:ff:ff
         inet 192.168.1.77/24 brd 192.168.1.255 scope global noprefixroute enp1s0
            valid_lft forever preferred_lft forever
         inet6 fe80::8eec:4bff:fec9:3e34/64 scope link 
            valid_lft forever preferred_lft forever
     3: wlp2s0: <BROADCAST,MULTICAST> mtu 1500 qdisc noop state DOWN group default qlen 1000
         link/ether 48:5f:99:33:d7:bd brd ff:ff:ff:ff:ff:ff
     4: docker0: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
         link/ether 02:42:9c:4e:b2:88 brd ff:ff:ff:ff:ff:ff
         inet 172.17.0.1/16 brd 172.17.255.255 scope global docker0
            valid_lft forever preferred_lft forever
     5: br-655b9516c85c: <NO-CARRIER,BROADCAST,MULTICAST,UP> mtu 1500 qdisc noqueue state DOWN group default 
         link/ether 02:42:35:63:e2:f3 brd ff:ff:ff:ff:ff:ff
         inet 172.18.0.1/16 brd 172.18.255.255 scope global br-655b9516c85c
            valid_lft forever preferred_lft forever
     
     ```

     本地网卡的名称为: enp1s0.

  2. 备份原配置文件`sudo cp /etc/netplan/01-network-manager-all.yaml /etc/netplan/01-network-manager-all.yaml.bak`

  3. 更改默认的网卡配置文件 `sudo vim /etc/netplan/01-network-manager-all.yaml` 

     默认配置为:

     ```shell
     # Let NetworkManager manage all devices on this system
     network:
       version: 2
       renderer: NetworkManager
     ```

     更改为:

     ```shell
     # Let NetworkManager manage all devices on this system
     network:
       version: 2
       renderer: NetworkManager
       ethernets:
           enp1s0:	# 指明网卡
               dhcp4: no		# 不适用动态分配
               addresses: [192.168.1.xx/24]	# 静态IP
               gateway4: 192.168.1.1		# 设置网关
               # 配置DNS服务器
               nameservers:
                   addresses: [192.168.1.8]
     ```
     备注:上面的 addresses 中的xx可以是0-255之间的任何数字, 只要不是别人已经占用的即可.

  4. 应用新配置 `sudo netplan apply`;

  5. 重启网络: `sudo service network-manager restart`;

  ## 关闭/启用网络

  关闭网络: `sudo nmcli networking off` 通过`ip a`获取的信息如下:

  ```shell
  2: enp1s0: <BROADCAST,MULTICAST> mtu 1500 qdisc fq_codel state DOWN group default qlen 1000
      link/ether 8c:ec:4b:c9:3e:34 brd ff:ff:ff:ff:ff:ff
  ```

  

  启用网络: `sudo nmcli networking on`, 通过 `ip a`获取的信息如下:

  ```shell
  2: enp1s0: <BROADCAST,MULTICAST,UP,LOWER_UP> mtu 1500 qdisc fq_codel state UP group default qlen 1000
      link/ether 8c:ec:4b:c9:3e:34 brd ff:ff:ff:ff:ff:ff
      inet 192.168.1.77/24 brd 192.168.1.255 scope global noprefixroute enp1s0
         valid_lft forever preferred_lft forever
      inet6 fe80::8eec:4bff:fec9:3e34/64 scope link 
         valid_lft forever preferred_lft forever
  ```

  

- ## `ssh`: 远程登录:

  - `ssh-keygen`: 在当前目录下建立`.ssh`文件夹;
  - `ssh -p port_num username@ip`: 根据服务器`ip`和端口号登录某个账户;
  - `scp -P port_num username@ip:\file_path target_file_path`: 复制文件;
  - `scp -r -P port_num username@ip:\file_dir target_file_dir`: 复制文件夹;
  - `ssh-copy-id -i .ssh/id_rsa.pub -p port_num username@ip`: 将当前`ssh`公钥添加到服务器的新人列表;







