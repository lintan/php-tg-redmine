>该案例可用于学习telegram机器人，对接telegram机器人


## 搭建说明

项目完整可运行，搭建需要有php代码基础以及telegram机器人相关知识。
开源地址:https://github.com/lintan/php-tg-redmine



#### 配置安装

1. laravel扩展需要自行安装，命令：`composer install`
2. 导入sql
3. 将.env.example 改名为 .env ，修改里面的参数即可（修改数据库信息，修改token）
4. 后台链接：域名+admin   (例如：http://www.xxx.com/admin)
5. 默认账号密码：admin/admin
6. php artisan message 运行程序

#### 命令
1. 群信息，获取群id和用户id
2. help，获取帮助
3. 发包10-1或10-1或发10-1，表示发包金额和雷
4. 1，查，余额，查询余额
5. /register，注册



## 演示站点


开源免费版演示站点： [https://demo.tgbot.cyou/admin/](https://demo.tgbot.cyou/admin/)

账号：test   密码：test123
（测试账号请勿随意修改数据）
>演示群：[https://t.me/+GNTD0sZnRJkxYWY1](https://t.me/+GNTD0sZnRJkxYWY1)

--------------------------------------------------------------------------------------

高级版演示站点：[https://www.tgbot.cyou/admin](https://www.tgbot.cyou/admin)

账号：test 

密码：（联系->[@cody](https://t.me/cody0101)）

（测试账号请勿随意修改数据）

>高级版演示群组：[@hongbaolei123](https://t.me/hongbaolei123)

## 高级版功能

1. 报表显示上级抽成,下级抽成,中雷赔付,抢包收入,邀请返点以及下级中雷返点
2. 自动提取豹子和顺子如2.22,33.33,1.23,12.34之类的并自动发送奖励以及通知
3.玩家可以通过指令生成专属连接,使用该链接进入群组的自动成为下线.
4.个人发包抢包中雷控制
5.总中雷率控制
6.进群欢迎语、帮助信息自定义配置
7. 机器人返回图片id
8. 福利红包功能：红包 随机发送  群内注册玩家都可以点包  不限制
9. 私信机器人 可以生成专属邀请链接
10.后台可以设置   自己发同时可以自己也可以抢
11.后台可以自定义设置最大发包金额，最小发包金额
12.后台设置假人自动抢包
13.增加队列，支持高并发
14. 财务群聊中快捷上下分
15.jackpot奖池玩法
16.支持多语言
17.trc20 usdt 自动充值
18.积分规则，赠送积分
19.二级代理

后台功能
1.后台统计
2. 过期红包判断
3.玩家页面添加流水,回水,报表
4.群组快捷设置
5.后台详细个人报表
6.个人资金流水
7.个人发包抢包中雷控制

## 机器人玩法说明：

1. 发包玩家发包的格式为：发+金额+雷号 
      比如要发50U雷号设置为4则直接在娱乐群中发送 ：发50-4 
      注意：发包时 发包玩家账户余额必须要大于要发的金额
      
2. 抢包玩家抢包的方式为：直接点击领取按钮就可以参与抢包
  注意：抢包时 抢包玩家账户余额必须要是抢的发包金额的1.8倍 这个后台可以进行修改
  
3. 中雷规则 ： 
    抢包玩家抢到红包金额最后一位数字如果和发包玩家设定的雷值相同 则 判断为中雷 
    抢包玩家就相当于输了 需要向发包玩家赔付1.8倍 
    发包玩家就相当于赢了 发包玩家赢的金额基础上，平台会抽取5%的抽水费用 
    
    抢包玩家抢到红包金额最后一位数字如果和发包玩家设定的雷值不同 则 判断为未中雷
    抢包玩家就相当于赢了 抢包玩家白领取【赢了】的金额基础上，平台会抽取5%的抽水费用
    发包玩家就相当于输了  


## 电报机器人创建教程

1. 打开 Telegram 搜索框，输入 @BotFather ，通过它申请建立一个新的机器人项目。

2. 向 @BotFather 发送指令 /newbot ，申请建立一个新的机器人。

3. 输入用户名后， 机器人就申请成功了。 如果你只是要一个可以用的机器人， 到这步就够了。 其中的 bot token: 1287833603:AAGmx9hQq6ViT3km0_77z8psBGqUKfdpSHY 是最重要的部分， 不要让人看到， 否则别人可以控制你的机器人。


>本项目免费开源，搭建需自己研究学习! 作者=> [@cody](https://t.me/cody0101) (不常登，请耐心等候)
>
>开源地址:https://github.com/lintan/php-tg-redmine
>
>！！！另外还有红包接龙机，红包牛牛，TG卖号店铺，TRX能量-兑换-TG会员三合一，高级记账，话费电费查询等机器人，接tg机器人定制开发，欢迎咨询

