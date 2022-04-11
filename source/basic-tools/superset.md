# superset选型及使用

> Data Visualization for Large Screen 选方案介绍：
>
> 开源的对 superset、redash 和 Metabase 做了对比，最终选择了superset
> - superset 优点： 1.可视化图标类型比较丰富 2. 项目活跃度比较高  缺点：文档不完善，需要一段时间才能掌握
> - redash 优点：1.简单、实用、文档清晰  2.原码可读性好，适合二次开发   缺点：图表样式不如superset丰富
> - Metabase 后端语言Clojure，跟我们不适配
>
> 收费版的对 阿里云的dataV、山海鲸做了简单了解，项目是绑定设备的，每增加一个设备需要单独添加收费
> 基于开源项目能满足我们的需求，于是我们优先使用了开源项目

#### superset 安装使用流程整理如下：

1.官方文档：https://superset.apache.org/docs/intro

2.安装
官方的 Docker image 仅包含基础的功能，
因此我们使用了Docker Compose的方式在本地安装,
文档：https://superset.apache.org/docs/installation/installing-superset-using-docker-compose

3.连接数据库
superset启动后，打开项目 http://localhost:8088/，菜单栏 Data -> Databases 添加数据库，注意HOST: host.docker.internal (Mac users) or IP地址 (Linux users)
文档：https://superset.apache.org/docs/databases/db-connection-ui

4.添加数据集
菜单栏 Data -> Datasets 右上角 + DATASET 添加数据集

5.制作图表
菜单栏 Charts -> 右上角 + CHART

6.让角色public免登陆访问
参考文章：https://blog.csdn.net/DraGon_HooRay/article/details/120780148
a) 进入镜像安装vim: apt-get install vim
b) 编辑配置文件 /app/superset/config.py
PUBLIC_ROLE_LIKE: Optional[str] = "Gamma"
superset init  // 初始化
c) 将pubilc涉及add edit delete menu权限全部去掉，
   菜单栏：Settings -> List Roles -> Public 编辑权限

7.允许跨域请求iframe
编辑配置文件 /app/superset/config.py
WTF_CSRF_ENABLED = False
重启docker-compose down  / up

8.把图表的加载地址分享给前端，在编辑 Chart 页面找到<>按钮，复制代码给前端
```html
<iframe
  width="600"
  height="400"
  seamless
  frameBorder="0"
  scrolling="no"
  src="http://192.168.1.100:8088/superset/explore/?r=19&standalone=1&height=400"
>
</iframe>
```

#### 后续研究

1.如何使用SQL Lab
2.如何更好的管理和使用Chart模板
3.二开
