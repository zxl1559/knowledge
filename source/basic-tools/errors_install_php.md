安装PHP: `sudo apt install php7.4-cli`;

安装 composesr：[参考材料](https://getcomposer.org/doc/00-intro.md#installation-linux-unix-macos)

```shell
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('sha384', 'composer-setup.php') === '906a84df04cea2aa72f40b5f787e49f22d4c2f19492ac310e8cba5b96ac8b64115ac402c8cd292b8a03482574915d1a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
php -r "unlink('composer-setup.php');"

mv composer.phar /usr/local/bin/composer
```

将`modi/yii2-demo` 克隆到本地 `git clone git@github.com:modi/yii2-demo.git`

创建 yii2-starter项目; 执行命令:

```shell
composer create-project "modi/yii2-starter:dev-master"
```

```shell
报错信息:
light@Nasil:~/projects$ composer create-project modi/yii2-starter
Creating a "modi/yii2-starter" project at "./yii2-starter"
Installing modi/yii2-starter (1.0.0)
  - Installing modi/yii2-starter (1.0.0): Extracting archive
Created project in /home/light/projects/yii2-starter
Installing dependencies from lock file (including require-dev)
Verifying lock file contents can be installed on current platform.
Your lock file does not contain a compatible set of packages. Please run composer update.

  Problem 1
    - yiisoft/yii2 is locked to version 2.0.43 and an update of this package was not requested.
    - yiisoft/yii2 2.0.43 requires ext-mbstring * -> it is missing from your system. Install or enable PHP's mbstring extension.
  Problem 2
    - codeception/codeception is locked to version 4.1.24 and an update of this package was not requested.
    - codeception/codeception 4.1.24 requires ext-curl * -> it is missing from your system. Install or enable PHP's curl extension.
  Problem 3
    - codeception/lib-asserts is locked to version 1.13.2 and an update of this package was not requested.
    - codeception/lib-asserts 1.13.2 requires ext-dom * -> it is missing from your system. Install or enable PHP's dom extension.
  Problem 4
    - codeception/lib-innerbrowser is locked to version 1.5.1 and an update of this package was not requested.
    - codeception/lib-innerbrowser 1.5.1 requires ext-dom * -> it is missing from your system. Install or enable PHP's dom extension.
  Problem 5
    - phar-io/manifest is locked to version 2.0.3 and an update of this package was not requested.
    - phar-io/manifest 2.0.3 requires ext-dom * -> it is missing from your system. Install or enable PHP's dom extension.
  Problem 6
    - phpunit/php-code-coverage is locked to version 7.0.15 and an update of this package was not requested.
    - phpunit/php-code-coverage 7.0.15 requires ext-dom * -> it is missing from your system. Install or enable PHP's dom extension.
  Problem 7
    - phpunit/phpunit is locked to version 8.5.21 and an update of this package was not requested.
    - phpunit/phpunit 8.5.21 requires ext-dom * -> it is missing from your system. Install or enable PHP's dom extension.
  Problem 8
    - theseer/tokenizer is locked to version 1.2.1 and an update of this package was not requested.
    - theseer/tokenizer 1.2.1 requires ext-dom * -> it is missing from your system. Install or enable PHP's dom extension.
  Problem 9
    - yiisoft/yii2-debug is locked to version 2.1.18 and an update of this package was not requested.
    - yiisoft/yii2-debug 2.1.18 requires ext-mbstring * -> it is missing from your system. Install or enable PHP's mbstring extension.
  Problem 10
    - yiisoft/yii2 2.0.43 requires ext-mbstring * -> it is missing from your system. Install or enable PHP's mbstring extension.
    - yiisoft/yii2-gii 2.2.3 requires yiisoft/yii2 ~2.0.14 -> satisfiable by yiisoft/yii2[2.0.43].
    - yiisoft/yii2-gii is locked to version 2.2.3 and an update of this package was not requested.

To enable extensions, verify that they are enabled in your .ini files:
    - /etc/php/7.4/cli/php.ini
    - /etc/php/7.4/cli/conf.d/10-opcache.ini
    - /etc/php/7.4/cli/conf.d/10-pdo.ini
    - /etc/php/7.4/cli/conf.d/20-calendar.ini
    - /etc/php/7.4/cli/conf.d/20-ctype.ini
    - /etc/php/7.4/cli/conf.d/20-exif.ini
    - /etc/php/7.4/cli/conf.d/20-ffi.ini
    - /etc/php/7.4/cli/conf.d/20-fileinfo.ini
    - /etc/php/7.4/cli/conf.d/20-ftp.ini
    - /etc/php/7.4/cli/conf.d/20-gettext.ini
    - /etc/php/7.4/cli/conf.d/20-iconv.ini
    - /etc/php/7.4/cli/conf.d/20-json.ini
    - /etc/php/7.4/cli/conf.d/20-phar.ini
    - /etc/php/7.4/cli/conf.d/20-posix.ini
    - /etc/php/7.4/cli/conf.d/20-readline.ini
    - /etc/php/7.4/cli/conf.d/20-shmop.ini
    - /etc/php/7.4/cli/conf.d/20-sockets.ini
    - /etc/php/7.4/cli/conf.d/20-sysvmsg.ini
    - /etc/php/7.4/cli/conf.d/20-sysvsem.ini
    - /etc/php/7.4/cli/conf.d/20-sysvshm.ini
    - /etc/php/7.4/cli/conf.d/20-tokenizer.ini
You can also run `php --ini` in a terminal to see which files are used by PHP in CLI mode.
Alternatively, you can run Composer with `--ignore-platform-req=ext-mbstring --ignore-platform-req=ext-curl --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-dom --ignore-platform-req=ext-mbstring --ignore-platform-req=ext-mbstring` to temporarily ignore these required extensions.
```

错误分析: 缺失一些依赖包, 需要首先执行 `composer update`. 报错信息为:

```shell
light@Nasil:~/projects/yii2-starter$ composer update
Composer is operating significantly slower than normal because you do not have the PHP curl extension enabled.
Loading composer repositories with package information
Updating dependencies
Your requirements could not be resolved to an installable set of packages.

  Problem 1
    - codeception/codeception[4.0.0, ..., 4.1.28] require ext-curl * -> it is missing from your system. Install or enable PHP's curl extension.
    - Root composer.json requires codeception/codeception ^4.0 -> satisfiable by codeception/codeception[4.0.0, ..., 4.1.28].

To enable extensions, verify that they are enabled in your .ini files:
    - /etc/php/7.4/cli/php.ini
    - /etc/php/7.4/cli/conf.d/10-opcache.ini
    - /etc/php/7.4/cli/conf.d/10-pdo.ini
    - /etc/php/7.4/cli/conf.d/20-calendar.ini
    - /etc/php/7.4/cli/conf.d/20-ctype.ini
    - /etc/php/7.4/cli/conf.d/20-exif.ini
    - /etc/php/7.4/cli/conf.d/20-ffi.ini
    - /etc/php/7.4/cli/conf.d/20-fileinfo.ini
    - /etc/php/7.4/cli/conf.d/20-ftp.ini
    - /etc/php/7.4/cli/conf.d/20-gettext.ini
    - /etc/php/7.4/cli/conf.d/20-iconv.ini
    - /etc/php/7.4/cli/conf.d/20-json.ini
    - /etc/php/7.4/cli/conf.d/20-phar.ini
    - /etc/php/7.4/cli/conf.d/20-posix.ini
    - /etc/php/7.4/cli/conf.d/20-readline.ini
    - /etc/php/7.4/cli/conf.d/20-shmop.ini
    - /etc/php/7.4/cli/conf.d/20-sockets.ini
    - /etc/php/7.4/cli/conf.d/20-sysvmsg.ini
    - /etc/php/7.4/cli/conf.d/20-sysvsem.ini
    - /etc/php/7.4/cli/conf.d/20-sysvshm.ini
    - /etc/php/7.4/cli/conf.d/20-tokenizer.ini
You can also run `php --ini` in a terminal to see which files are used by PHP in CLI mode.
Alternatively, you can run Composer with `--ignore-platform-req=ext-curl` to temporarily ignore these required extensions.
```

报错原因: 缺失`php-curl` 拓展, 需要安装 `sudo apt install php7.4-curl`, 

依然出现报错, 报错信息为:

```shell
light@Nasil:~$ sudo apt install php7.4-curl
Reading package lists... Done
Building dependency tree       
Reading state information... Done
php7.4-curl is already the newest version (7.4.3-4ubuntu2.8).
0 upgraded, 0 newly installed, 0 to remove and 8 not upgraded.
2 not fully installed or removed.
After this operation, 0 B of additional disk space will be used.
Do you want to continue? [Y/n] y
debconf: DbDriver "config": /var/cache/debconf/config.dat is locked by another process: Resource temporarily unavailable
Setting up php7.4-curl (7.4.3-4ubuntu2.8) ...
debconf: DbDriver "config": /var/cache/debconf/config.dat is locked by another process: Resource temporarily unavailable
dpkg: error processing package php7.4-curl (--configure):
 installed php7.4-curl package post-installation script subprocess returned error exit status 1
No apport report written because the error message indicates its a followup error from a previous failure.
                                                                                                          dpkg: dependency problems prevent configuration of php-curl:
 php-curl depends on php7.4-curl; however:
  Package php7.4-curl is not configured yet.

dpkg: error processing package php-curl (--configure):
 dependency problems - leaving unconfigured
Errors were encountered while processing:
 php7.4-curl
 php-curl
E: Sub-process /usr/bin/dpkg returned an error code (1)
```

原因分析: php-curl 的配置文件被其他进程锁定, 需要将其释放.

解决方案：

- 执行`sudo fuser -v /var/cache/debconf/config.dat`查看哪个进程在锁定配置文件

- 使用`sudo kill ` 终止该进程；

- 继续安装 php7.4-curl, `sudo install php7.4-curl`; 安装成功；

- 继续执行 composer update, 出现以下报错信息:

  ```shell
  light@Nasil:~/projects/yii2-starter$ composer update
  Loading composer repositories with package information
  Updating dependencies
  Your requirements could not be resolved to an installable set of packages.
  
    Problem 1
      - codeception/verify 1.1.0 requires phpunit/phpunit > 6.0 -> satisfiable by phpunit/phpunit[6.0.1, ..., 6.5.14, 7.0.0, ..., 7.5.20, 8.0.0, ..., 8.5.22, 9.0.0, ..., 9.5.11].
      - codeception/verify 0.5.0 requires php 5.6.* -> your php version (7.4.3) does not satisfy that requirement.
      - phpunit/phpunit[6.0.0, ..., 6.5.14, 7.0.0, ..., 7.5.20, 8.0.0, ..., 8.5.22, 9.0.0, ..., 9.5.11] require ext-dom * -> it is missing from your system. Install or enable PHP's dom extension.
      - Root composer.json requires codeception/verify ~0.5.0 || ~1.1.0 -> satisfiable by codeception/verify[0.5.0, 1.1.0].
  
  To enable extensions, verify that they are enabled in your .ini files:
      - /etc/php/7.4/cli/php.ini
      - /etc/php/7.4/cli/conf.d/10-opcache.ini
      - /etc/php/7.4/cli/conf.d/10-pdo.ini
      - /etc/php/7.4/cli/conf.d/20-calendar.ini
      - /etc/php/7.4/cli/conf.d/20-ctype.ini
      - /etc/php/7.4/cli/conf.d/20-curl.ini
      - /etc/php/7.4/cli/conf.d/20-exif.ini
      - /etc/php/7.4/cli/conf.d/20-ffi.ini
      - /etc/php/7.4/cli/conf.d/20-fileinfo.ini
      - /etc/php/7.4/cli/conf.d/20-ftp.ini
      - /etc/php/7.4/cli/conf.d/20-gettext.ini
      - /etc/php/7.4/cli/conf.d/20-iconv.ini
      - /etc/php/7.4/cli/conf.d/20-json.ini
      - /etc/php/7.4/cli/conf.d/20-phar.ini
      - /etc/php/7.4/cli/conf.d/20-posix.ini
      - /etc/php/7.4/cli/conf.d/20-readline.ini
      - /etc/php/7.4/cli/conf.d/20-shmop.ini
      - /etc/php/7.4/cli/conf.d/20-sockets.ini
      - /etc/php/7.4/cli/conf.d/20-sysvmsg.ini
      - /etc/php/7.4/cli/conf.d/20-sysvsem.ini
      - /etc/php/7.4/cli/conf.d/20-sysvshm.ini
      - /etc/php/7.4/cli/conf.d/20-tokenizer.ini
  You can also run `php --ini` in a terminal to see which files are used by PHP in CLI mode.
  Alternatively, you can run Composer with `--ignore-platform-req=ext-dom` to temporarily ignore these required extensions.
  
  Use the option --with-all-dependencies (-W) to allow upgrades, downgrades and removals for packages currently locked to specific versions.
  ```

  原因分析: 安装 `codeception/verify`时依赖`phpunit/phpunit`, 而`phpunit/phpunit`没有安装, 所以需要首先通过`sudo apt install phpunit`. 然后再执行 `composer update`, 安装成功.

`composer install`: 顺利安装

`yarn install`

提示系统中没有安装 yarn, 报错信息为:

```shell
light@Nasil:~/projects/yii2-starter$ yarn install
Command 'yarn' not found, but can be installed with:
sudo apt install cmdtest
```

- 安装 yarn:

- 将 yarn 的apt 仓库添加到系统 apt 仓库列表

  ```shell
  curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add -
  echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list
  ```

- 更新 apt index, 安装 yarn

  ```shell
  sudo apt update
  sudo apt install yarn
  ```

- 验证是否安装成功;

  ```shell
  yarn -v
  ```

  如果输出 yarn 的版本号, 则说明安装成功.

- 继续执行 `yarn install`, 正常运行;

- 执行 yii2的初始化脚本: `php init`
- 安装 redis, `sudo apt install redis`;

添加 Yii2 Redis 组件

- 添加依赖, 执行`composer require "yiisoft/yii2-redis:~2.0.0"`;
- 添加配置, 

添加 yii2 queue 组件:

- 添加依赖: `composer require "yiisoft/yii2-queue:^2"`
- 添加配置:

启动docker, `docker-compose up -d`, 出现以下报错信息:

```shell
light@Nasil:~/projects/yii2-demo$ docker-compose up -d
ERROR: The Compose file './docker-compose.yml' is invalid because:
Unsupported config option for services.queue: 'init'
```

解决方案: 删除 `docker-compose.yml`文件中的`init: true`行.

继续执行`docker-compose up -d`, 容器能正常启动, 但是访问 `http://127.0.0.1/`依然没有反应

- 执行该命令时经常会出现的报错是:

  ```shell
  ERROR: Couldn't connect to Docker daemon at http+docker://localhost - is it running?
  If it's at a non-standard location, specify the URL with the DOCKER_HOST environment variable.
  ```

  该报错的原因有2种;

  - 当前没有没有权限; 解决方案有2种:

    - 使用 `sudo`执行该命令;
    - 将当前用户加入到`docker`用户组`sudo usermod -a -G docker $USER`, 然后注销并重新登录当前用户即可;

  - docker 未启动; 执行以下命令启动 docker.

    ```shell
    sudo systemctl enable docker
    sudo systemctl start docker
    ```


当时Nginx 的日志文件如下, 可以看出网页的访问没有达到 Nginx.

```shell
light@Nasil:~/projects/yii2-demo$ docker logs -f yii2-demo_nginx_1 
/docker-entrypoint.sh: /docker-entrypoint.d/ is not empty, will attempt to perform configuration
/docker-entrypoint.sh: Looking for shell scripts in /docker-entrypoint.d/
/docker-entrypoint.sh: Launching /docker-entrypoint.d/10-listen-on-ipv6-by-default.sh
10-listen-on-ipv6-by-default.sh: info: Getting the checksum of /etc/nginx/conf.d/default.conf
10-listen-on-ipv6-by-default.sh: info: /etc/nginx/conf.d/default.conf differs from the packaged version
/docker-entrypoint.sh: Launching /docker-entrypoint.d/20-envsubst-on-templates.sh
/docker-entrypoint.sh: Launching /docker-entrypoint.d/30-tune-worker-processes.sh
/docker-entrypoint.sh: Configuration complete; ready for start up
2022/01/13 08:28:22 [notice] 1#1: using the "epoll" event method
2022/01/13 08:28:22 [notice] 1#1: nginx/1.20.2
2022/01/13 08:28:22 [notice] 1#1: built by gcc 10.3.1 20210424 (Alpine 10.3.1_git20210424) 
2022/01/13 08:28:22 [notice] 1#1: OS: Linux 5.11.0-46-generic
2022/01/13 08:28:22 [notice] 1#1: getrlimit(RLIMIT_NOFILE): 1048576:1048576
2022/01/13 08:28:22 [notice] 1#1: start worker processes
2022/01/13 08:28:22 [notice] 1#1: start worker process 32
2022/01/13 08:28:22 [notice] 1#1: start worker process 33
2022/01/13 08:28:22 [notice] 1#1: start worker process 34
2022/01/13 08:28:22 [notice] 1#1: start worker process 35
2022/01/13 08:28:22 [notice] 1#1: start worker process 36
2022/01/13 08:28:22 [notice] 1#1: start worker process 37
```

**解决方案**: docker-compose.yml 配置文件中配置 Nginx 的端口映射;

```shell
  nginx:
    image: nginx:1.20-alpine
    depends_on:
      - fpm
    volumes:
      - ./_docker/nginx/default.conf:/etc/nginx/conf.d/default.conf
      - .:/app
    ports:
      - 80:80
```
注意: yml类型的配置文件靠缩写提现层级关系, 每个层级的缩进为2个空格, 必须使用空格, 而不是tab.

端口映射配置完成之后, 网页可以正常访问, 出现` hello world`.


无法安装 pcntl, [官方文档显示](https://www.php.net/manual/en/pcntl.installation.php)

> Process Control support in PHP is not enabled by default. You have to compile the CGI or CLI version of PHP with **--enable-pcntl** configuration option when compiling PHP to enable Process Control support.





技巧: 

- 设置vim 的缩进为4个空格;

  ```cp
  cp /etc/vim/vimrc .vimrc
  vim .vimrc
  
  在配置文件中添加
  set tapstop=4
  保存退出即可
  ```
