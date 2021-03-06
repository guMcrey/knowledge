# zhixue_website_ssr

>毕业设计:基于vue的知学平台的设计与实现
>功能模块：用户注册登录、题库中心（答题及查看解析，邀约讲解）、信息广场（针对某道题的讨论）、讨论区（普通问题交流区）、寻师（在线预约小老师->线下辅导）
>目前已完成：前端界面，已联调完毕

## 2019.5.25更新：V2.0--新增优化功能如下
 
 #### 新增
    
	个人中心：我的试卷，我的预约（可取消），我的课程（完成后可评价），我发布的课程（可删除），我的评价，完善信息，申请小老师，修改密码，我的讨论区发布
	荣誉榜（小老师排名，学生用户排名）

 #### 优化
    寻师（新增预约科目列表）
    题库中心（新增对应科目的答题类型：顺序答题、乱序答题、文本题（文本题不开放添加笔记和发布邀约））	
	         对应答题类型新增添加/查看笔记		

>前端：Nuxt+Vue+Less
>后端: Django+Python  项目链接：https://github.com/TansyPK/tjrac

## 前端启动步骤

> 注意：所有功能需在本地部署成功后台才能使用，具体部署步骤见下文~~

```bash

# install dependencies
$ npm install # Or yarn

# serve with hot reload at localhost:3003
$ npm run dev # Or yarn dev

# build for production and launch server
$ npm run build
$ npm start

For detailed explanation on how things work, checkout the [Nuxt.js docs](https://github.com/nuxt/nuxt.js).

```

## 后端环境部署及启动步骤

``` bash 

# 安装python3.7 
$ https://www.liaoxuefeng.com/wiki/1016959663602400/1016959856222624

# 进入后端tjrac项目目录
$ cd tjrac路径

# 安装虚拟环境：
$ pip3 install virtualenv
$ virtualenv -p python3 venv
$ cd venv

# 安装依赖：
$ pip3 install -r requirements.txt
$ pip3 install django-cors-headers
$ cd Script
$ activate

# 安装mysql并配置环境变量后执行以下命令：
$ mysql -u root -p密码
   > 如果密码错误：
   > 1. 先新建cmd
   > 2. mysql -u root -p
   > 3. use mysql
   > 4. update user set Password=password('123456') where User='root'
   > 5. flush privileges
   
# 修改setting.py文件中密码为本地密码
$ cd tjrac -> smt -> settings.py (用sublime或者记事本工具打开)修改mysql的用户名和密码为自己本地的

# 创建smt库：
$ CREATE DATABASE IF NOT EXISTS smt DEFAULT CHARSET utf8 COLLATE utf8_general_ci;

# 退出mysql： 
$ exit

# 启动后台项目
$ python manage.py makemigrations
$ python manage.py migrate
$ python manage.py runserver

```