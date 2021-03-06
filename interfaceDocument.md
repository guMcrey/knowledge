# 接口文档记录

## 用户信息模块

``` bash
# 后台资源管理 GET
$ localhost:8000/xadmin/

# 登陆 POST PARAM: username, password 
$ localhost:8000/login/ --已调

# 注册 POST PARAM: username, password
$ localhost:8000/signup/ --已调


# 用户详情页 GET 需要token验证
$ localhost:8000/user/detail/

# 用户列表(type=0 学生，type=1 老师) GET
$ localhost:8000/users/detail/?type=0

# 用户选择题选择记录列表 GET
$ localhost:8000/list/select/operations/

localhost:8000/list/normal/operations/
# 用户普通问题操作记录列表 GET

```

## 讨论区模块

``` bash

# 创建讨论区问题
$ localhost:8000/create/normal/question/ -- 已调
$ POST
$ PARAM：
$       "owner": request.user.id,
$       "title": request.POST.get('title'),
$       "content": request.POST.get('content'),
$       "score": int(request.POST.get('score')) if request.POST.get('score') else None,
$       "type": int(request.POST.get('type')) if request.POST.get('type') else None,
$       "created_time": None,
$       "updated_time": None,


# 创建讨论区问题回答
$ localhost:8000/create/normal/answer/  -- 已调
$ POST
$ PARAM：
$       owner = serializers.IntegerField(label="创建者", help_text="回答创建者", required=True)
$       question_id = serializers.IntegerField(label="所属问题编号", help_text="问题id", required=True)
$       content = serializers.CharField(label="内容", help_text="回答内容", required=True)
$       created_time = serializers.DateTimeField(label="创建时间", help_text="创建时间", allow_null=True) 需要传空
$       updated_time = serializers.DateTimeField(label="更新时间", help_text="更新时间", allow_null=True) 需要传空


# 获取讨论区问答信息列表 GET
$ localhost:8000/list/normal/questions/  -- 已调

# 获取讨论区具体问答信息列表 GET
$ localhost:8000/list/normal/answers/?question_id=xxx  --已调

```

## 题库中心模块

``` bash

# 创建选择题
$ localhost:8000/create/select/question/  -- 后台手动添加
$ POST
$ PARAM:
$       "title": request.POST.get('title'),
$       "content": request.POST.get('content'),
$       "type": int(request.POST.get('type')) if request.POST.get('type') else None,
$       "correct_code": request.POST.get('correct_code'),
$       "analyzations": request.POST.get('correct_code'),
$       "score": int(request.POST.get('score')) if request.POST.get('score') else None,
$       "level": int(request.POST.get('level')) if request.POST.get('level') else None,
$       "created_time": None,
$       "updated_time": None,


# 创建选择题回答
$ localhost:8000/create/select/answer/  -- 后台手动添加
$ POST
$ PARAM:
$      question_id = serializers.IntegerField(label="回答所属问题", help_text="问题id", required=True)
$      content = serializers.CharField(label="内容", help_text="回答内容", required=True)
$      select_code = serializers.CharField(label="回答编号", help_text="回答编号", required=True)
$      created_time = serializers.DateTimeField(label="创建时间", help_text="创建时间", allow_null=True) 需要传空
$      updated_time = serializers.DateTimeField(label="更新时间", help_text="更新时间", allow_null=True) 需要传空


# 获取选择题信息 GET
$ localhost:8000/list/select/questions/?type=xxx     --已调


# 获取选择题答案信息 GET
$ localhost:8000/list/select/answers/?question_id=xxx  -- 不需要调

```

##  信息广场模块

``` bash

# 信息广场列表
$ list/informations/ 不需要传参数 


# 创建邀约
$ create/information/  -- 已调
$ PARAM:
$     owner = serializers.IntegerField(label="邀约问题所属者", help_text="邀约讲解ID", required=True)
$     question_id = serializers.IntegerField(label="问题id", help_text="问题id", required=True)
$     created_time = serializers.DateTimeField(label="创建时间", help_text="创建时间", allow_null=True) null
$     updated_time = serializers.DateTimeField(label="更新时间", help_text="更新时间", allow_null=True) null

# 创建邀约回答
$ create/information/comment/ -- 已调
$ PARAM:
$     owner = serializers.IntegerField(label="邀约讲解回答者", help_text="邀约讲解回答者id", required=True)
$     information_id = serializers.IntegerField(label="邀约回答id", help_text="邀约回答id", required=True)
$     content = serializers.CharField(label="邀约讲解回答内容", help_text="邀约讲解回答内容", required=True)
$     created_time = serializers.DateTimeField(label="创建时间", help_text="创建时间", allow_null=True) null
$     updated_time = serializers.DateTimeField(label="更新时间", help_text="更新时间", allow_null=True) null


# 记录用户行为
# 用户选择题操作记录（回答选择题时记录一下）
$ localhost:8000/create/select/operation/
$ POST
$     "question_id": int(request.POST.get('question_id')) if request.POST.get('question_id') else None,
$     "answer_id": int(request.POST.get('answer_id')) if request.POST.get('answer_id') else None,
$     "user_id": request.user.id,
$     "score": int(request.POST.get('score')) if request.POST.get('score') else None,
$     'is_correct': bool(int(request.POST.get('is_correct')) if request.POST.get('is_correct') else False)

# 用户回普通问题操作记录 (回答普通问题时记录一下)
$ localhost:8000/create/normal/operation/
$ POST
$      "question_id": int(request.POST.get('question_id')) if request.POST.get('question_id') else None,
$      "answer_id": int(request.POST.get('answer_id')) if request.POST.get('answer_id') else None,
$      "user_id": request.user.id,
$      "score": int(request.POST.get('score')) if request.POST.get('score') else None

```

## 寻师模块

```bash

# 学生预约小老师课程
$ localhost:8000/create/select/teacher/   -- 已调
$ POST
$      'selector_id': request.user.id,
$      'teacher_id': int(request.POST.get('teacher_id')),
$      'status': int(request.POST.get('status')), 1
$      '创建预约加字段--room，score': int(request.POST.get('room')),
$      'interview_time': request.POST.get('interview_time'),
$      'end_time': request.POST.get('end_time'),
$      'created_time': None,
$      'updated_time': None

# 老师创建小老师课程
$ localhost:8000/create/course/  -- 已调
$ post
$     "owner": request.user.id,
$     "title": request.POST.get('title'),
$     "content": request.POST.get('content'),
$     "room"
$     "type": int(request.POST.get('type')) if request.POST.get('type') else 0,
$     "score": int(request.POST.get('score')) if request.POST.get('score') else None,
$     'interview_time': request.POST.get('interview_time'),
$     'end_time': request.POST.get('end_time'),
$     "created_time": None,
$     "updated_time": None,

# 创建课程成功后显示课程列表
$ localhost:8000/list/courses/  -- 已调

# 邀约列表 GET
$ localhost:8000/list/select/teacher/  --已调

# 这个好像还没调/评论列表 GET
$ localhost:8000/list/select/comment/？question_id=xxx

```

## 修改记录

> 寻师
> 创建预约加字段--room，score,开始时间interview_time
> 修改删除去掉

> 个人详情页：user/detail
> token--header
> 我的试卷--title(选择题题目名字列表)
> http://localhost/list/select/operations  --title

> 发布的帖子--title（发布的标题）
> 我的预约/课程 -- 区分角色
> 预约标题，预约状态（已完成，未完成，待完成）
> localhost:8000/list/select/teacher/  --500

> 讨论区

> 信息广场
> 传id，积分，提问内容
> 题目标题，选项，解析



## 优化——V2.0——新增及修改接口

### 个人详情页

```bash

 # 用户个人信息更新接口 PUT
 $ update/user/detail/
 
 # 用户修改密码接口 PUT
 $ update/user/password/
 
 # 用户申请小老师接口 PUT
 $ update/user/smt/
 
 # 我的讨论区发布 GET
 $ list/me/questions
 
 # 我的课程 GET
 $ list/select/student/
 
 # 小老师课程类别列表接口
 $ list/course/category/
 
 # 我的预约 GET
 $ list/select/teacher/
 
 # 我的预约加取消 PUT
 $ cancle/course/order/
 
 # 我的试卷 GET
 $ list/select/operations
 
 # 我发布的课程 GET 
 $ list/course/mine/
 
 # 删除课程接口 PUT
 $ cancle/course/
 
 # 完成课程接口 PUT
 $ complete/course/
 
 # 我的预约 GET
 $ create/course/feedback/
 
 # 我的评价 GET
 $ list/course/feedback/
 
 ```
 
 ### 题库中心
 ```bash
 # 文本题列表接口 GET
 $ list/content/questions/
 
 # 创建笔记 POST
 $ create/select/note/
 
 # 查看笔记 GET
 $ retrieve/select/note/
 
 ### 荣誉榜
 ```bash
 # 荣誉榜
 $ users/detail/
 
 ```

> 讨论区
> 接口：http://localhost:8000/list/normal/questions/   增加返回字段username
> 接口：http://localhost:8000/list/normal/answers/?question_id=2  results->answers增加返回字段username
> 接口：http://localhost:8000/list/informations/   增加返回字段-score（用户总积分）
> 增加接口：分页

> 个人详情页
> 接口：http://localhost:8000/list/normal/operations/  增加返回字段：title，content等具体题目信息








