INSERT INTO sys_user(id, password, username) VALUES (1, 'helloworld', 'helloalanturing@gmail.com');


INSERT INTO t_article (content, create_date, title, view_num, tags, is_page) VALUES ('###前言
学习使用memcached，本人使用的是MacBook，服务器使用CentoS，因此会有2个版本的安装使用。本人是初学者，有不对的地方还请看到博客的前辈不吝赐教，在此先感谢各位前辈。
---
### System：OS X
#### 工具：homebrew
#### 执行脚本：
> brew install memcached
#### 启动命令：
> memcached -m 64 -p 11211 -u nobody -d start
#### 常用参数：
>-p 指定端口号（默认11211）
-t 线程数（默认4）
-l 连接的IP地址, 默认是本机
-d start 启动memcached服务
-d restart 重起memcached服务
-d stop|shutdown 关闭正在运行的memcached服务
-m 最大内存使用，单位MB。默认64MB
-M 内存耗尽时返回错误，而不是删除项
-c 最大同时连接数，默认是1024
-f 块大小增长因子，默认是1.25
-n 最小分配空间，key+value+flags默认是48
>

### System：CentOS
', '2018-03-06', 'Memcached安装配置', 488, 'memcached', 'N');
INSERT INTO t_article (content, create_date, title, view_num, tags, is_page) VALUES ('#### Linux常用命令收集

---

**前言**

笔者并不是Linux“大婶”，只是工作中需要用到一些基础命令，故作此文以记之。

| 命令及参数                                    | 用途及说明                                    |
| :--------------------------------------- | :--------------------------------------- |
| df -h                                    | 查看硬盘使用情况                                 |
| top                                      | 实时系统参数使用情况（Windows的任务管理器）                |
| passwd username                          | 更改用户密码，不输入username时默认修改root用户密码          |
| mv 原文件 目标文件                              | 移动文件                                     |
| cp 原文件 目标文件                              | 复制文件                                     |
| chmod -R 777 文件名                         | 更改文件或目录权限``` -R``` 表示连带更改下级目录权限，```777```是权限级别，这个级别有很多 |
| ```nc -l port```                         | 在指定端口开启一个```tcp```服务                     |
| ``` nc ip port```                        | 连接指定IP及端口的```tcp```服务                    |
| ```python -m SimpleHTTPServer 8000```    | 利用python开启一个临时的http服务，在后面追加```&```表示后台启动 |
| ```scp -r -P port 源文件 user@ip:目标文件``` ``` scp -r -P port user@ip:源文件 目标文件``` | 利用ssh从本地传递文件到服务器，```-r```传输文件夹，单个文件不需要该参数，```-P```大写。后者是从服务器下载文件到本地指定目录 |
|                                          |                                          |
|                                          |                                          |

### Change Ubuntu Default Theme Launcher Position

The position could only be either *Left* or *Bottom*

script for Bottom:

> ```
> gsettings set com.canonical.Unity.Launcher launcher-position Bottom
> ```

script for Left:

> ```
> gsettings set com.canonical.Unity.Launcher launcher-position Left
> ```

##### vi/vim操作

##### 更改Linux系统编码
```shell
vi /etc/sysconfig/i18n
#LANG="zh_CN.GBK" 修改为LANG="zh_CN.UTF-8"保存退出
#是更改生效
source /etc/sysconfig/i18n
#检查编码：
locale
```', '2018-03-06', 'Linux常用命令收集', 493, 'Linux', 'N');
INSERT INTO t_article (content, create_date, title, view_num, tags, is_page) VALUES ('# activemq安装

```shell
wget http://archive.apache.org/dist/activemq/apache-activemq/5.9.0/apache-activemq-5.9.0-bin.tar.gz
tar -zxvf apache-activemq-5.9.0-bin.tar.gz
cd apache-activemq-5.9.0/bin
./activemq start

```


', '2018-03-06', 'ActiveMQ安装配置', 490, 'mq', 'N');
INSERT INTO t_article (content, create_date, title, view_num, tags, is_page) VALUES ('##### 前缀/后缀
```shell
spring.mvc.view.prefix:/
spring.mvc.view.suffix:.jsp
```

##### JPA配置
```shell
spring.jpa.hibernate.ddl-auto=create
spring.jpa.show-sql=true
spring.messages.basename=validation
spring.jpa.database=MYSQL
```

##### 显示后台处理的SQL语句
```shell
spring.jpa.show-sql=true
```

##### 自动检查实体和数据库表是否一致，如果不一致则会进行更新数据库表
spring.jpa.hibernate.ddl-auto=update

##### 服务器访问端口
server.port=8080
##### 数据库基本配置
```shell
spring.datasource.url=jdbc:mysql://127.0.0.1:3306/test
spring.datasource.username=root
spring.datasource.password=root
spring.datasource.driver-class-name=com.mysql.jdbc.Driver
```', '2018-03-06', 'Spring Boot application配置文件', 490, 'spring', 'N');
INSERT INTO t_article (content, create_date, title, view_num, tags, is_page) VALUES ('[toc]

# 标题1
啊三闾大夫就拉屎的卷发；善良的咖啡机啊；收到了咖啡机啊；收到了咖啡机啊收到了反馈
## 标题2
啊；善良的咖啡机啊；三闾大夫
### 标题3
阿里斯顿放假啊；蓝色的咖啡机啊；蓝色快点放假爱上；的法律框架啊收到了副科级啊；收到了咖啡机啊；收到了封口机阿斯利康的风景
#### 标题4
what iswrongwithyou
##### 标题5
啊深刻的发生剋的法律收到反馈
###### 标题6
we are who we are.', '2018-03-07', '测试toc', 488, 'markdown', 'N');
INSERT INTO t_article (content, create_date, title, view_num, tags, is_page) VALUES ('## 什么是nginx
一款http服务器，就想tomcat一样的东西。
## 为什么要用nginx
做反向代理服务器，性能优越
## 安装nginx
### 系统CentOS 7
#### 添加源
```shell
sudo rpm -Uvh http://nginx.org/packages/centos/7/noarch/RPMS/nginx-release-centos-7-0.el7.ngx.noarch.rpm
sudo yum install epel-release
```
#### 安装命令
```shell
sudo yum install nginx
```
#### 启动nginx
```shell
sudo systemctl start nginx
```
#### 常用命令
```shell
nginx 启动
nginx -s reload		重新加载配置
nginx -s reopen 		重启
nginx -s top			停止服务
```
', '2018-03-07', 'nginx', 11, 'nginx', 'N');
INSERT INTO t_article (content, create_date, title, view_num, tags, is_page) VALUES ('### 关闭指定名称jar包
```shell
    #!/bin/bash
    PID=$(ps -ef | grep jcker.jar | grep -v grep | awk ''{ print $2 }'')
    if [ -z "$PID" ]
    then
        echo Application is already stopped
    else
        echo kill $PID
        kill $PID
    fi
```', '2018-03-07', 'Shell命令', 493, 'shell', 'N');
INSERT INTO t_article (content, create_date, title, view_num, tags, is_page) VALUES ('### 记录要学习和掌握的知识

01. 熟练掌握 javaSE 和 javaEE 相关知识，具有良好的面向对象编程思想，并熟悉常用的设计模式；
02. 熟练使用常见的 javaEE 开源框架，如 Struts2，Spring MVC，Spring，Hibernate，Mybatis，WebService；
03. 熟练操作 MySQL，Oracle 数据库，并能进行千万级数据库的优化，熟悉 MySQL 的集群的搭建；
04. 熟练使用 Linux常用的操作命令，熟悉 shell 脚本编程；
05. 熟悉 Hadoop 的系统架构，掌握 Hadoop HA 集群的搭建；

06. 熟悉 MapReduce 的原理和流程，并能用其 API 开发应用程序；
07. 熟悉 Zookeeper 的架构，运行的原理，如 HA；
08. 熟悉 Spark 的原理和流程，熟悉Scala语言并能用 Spark API 开发应用程序，熟悉 Spark streaming组件，并能用其开发实时计算系统，了解 Spark 源码；
09. 熟悉 Storm 的原理和流程，并能使用 API 开发应用程序，熟悉 Strom+Kafka 实时流处理架构；
10. 熟悉 Hive 和 HBase 的系统架构，能使用 Hive 进行海量数据的统计分析，能根据需求实际HBase表，能对 Hive，HBase 进行调优；

11. 理解机器学习思想，熟悉 python 编程，熟悉 mahout，熟悉机器学习常用算法，如逻辑回归，朴素贝叶斯，神经网络算法；
12. 熟悉常见的开源日志收集框架 flume，Logstash，Kafka 消息列队，并能使用其实现不同场景的日志收集；
13. 熟悉大型网站高并发架构，熟悉Nginx，lvs等高并发技术并可以快速搭建，熟悉掌握Redis缓存数据库应用；
14. 熟悉全文搜索的思想，熟悉 Lucene ，Solor ，Elasticsearch 架构，并能搭建搜索引擎；
15. 熟悉分布式框架 Dubbo，并能搭建分布式系统；

16. 熟悉Maven ，SVN ，Jenkins等等工具使用和环境搭建；

', '2018-03-13', '知识面', 502, '学习', 'Y');