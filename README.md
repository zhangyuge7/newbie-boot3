**欢迎使用NewbieBoot快速开发框架**

## 框架开发环境

+ JDK 21
+ Maven 3.9.4
+ Idea 2024.1.1

## 脚本介绍

项目脚本存放在bin目录下

+ **shell jar管理脚本** jar.sh 

  ```shell
  # 服务启动
  sh jar.sh start
  # 服务停止
  sh jar.sh stop
  # 服务运行状态查看
  sh jar.sh status
  # 重启服务
  sh jar.sh restart
  # 帮助说明，用于提示输入参数信息
  sh jar.sh usage
  ```

  

+ **mvn重新打包脚本** reinstall.bat

  + windows平台双击运行

+ **windows平台jar运行脚本** run.bat

  + windows平台双击运行

## 数据库脚本介绍

数据库脚本存放在bin目录下

+ **Mysql初始化脚本** mysql.sql
+ **Oracle初始化脚本** oracle.sql
+ **Postgresql初始化脚本** pgsql.sql

## 模块介绍

### newbie-admin

主要定义后台系统的controller层，对外开放接口，处于最顶层模块

### newbie-common

通用模块/基础模块，处于最底层模块，主要定义通用设施，自定义工具类、自定义注解、基础实体、基础配置、异常处理等等。

### newbie-file

文件服务模块，属于服务设施，主要提供文件上传下载等功能的服务

### newbie-generator

代码生成器，可根据数据库表生成对应的前后端代码。

### newbie-security

安全控制模块，负责接口拦截，检查系统认证及接口鉴权等安全功能。

### newbie-system

系统管理模块，属于基础服务模块，用户管理、角色管理、菜单权限管理及分配等系统级服务和登录日志、操作日志等功能。

### newbie-weblog

web日志模块，使用aop切面进行接口的访问日志的记录

