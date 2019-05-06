# zhixue_website_ssr

>毕业设计:基于vue的知学平台的设计与实现
>功能模块：用户注册登录、题库中心（答题及查看解析，邀约讲解）、信息广场（针对某道题的讨论）、讨论区（普通问题交流区）、寻师（在线预约小老师->线下辅导）
>目前已完成：前端界面，正在联调阶段

>前端：Nuxt+Vue+Less
>后端: Django+Python  项目链接：https://github.com/TansyPK/tjrac

## 前端启动步骤

``` bash
# install dependencies
$ npm install # Or yarn

# serve with hot reload at localhost:3000
$ npm run dev # Or yarn dev

# build for production and launch server
$ npm run build
$ npm start

# generate static project
$ npm run generate
```

For detailed explanation on how things work, checkout the [Nuxt.js docs](https://github.com/nuxt/nuxt.js).


## 后端环境部署及启动步骤
# 部署：
> 安装python3.7 https://www.liaoxuefeng.com/wiki/1016959663602400/1016959856222624
> 安装虚拟环境：pip3 install virtualenv
> virtualenv -p python3 venv
> cd venv
> pip3 install -r requirements.txt
> pip3 install django-cors-headers
> cd Script
> activate
> mysql -u root -p密码
   如果密码错误：
   1. 先新建cmd
   2. mysql -u root -p
   3. use mysql
   4. update user set Password=password('123456') where User='root'
   5. flush privileges
> 到tjrac项目->smt->settings.py(用sublime或者记事本工具打开)修改mysql的用户名和密码为自己本地的
> 创建smt库：CREATE DATABASE IF NOT EXISTS smt DEFAULT CHARSET utf8 COLLATE utf8_general_ci;
> 退出mysql： exit
> python manage.py makemigrations
> python manage.py migrate
> python manage.py runserver
