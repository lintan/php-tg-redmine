## 系统基于基于PHP的laravel框架搭建

项目完整可运行，搭建需要有php代码基础以及telegram机器人相关知识。
开源地址:https://github.com/lintan/php-tg-redmine

#### 版本
php8.0

laravel 9.19

#### 配置安装

1. laravel扩展需要自行安装，命令：`composer install`
2. 导入sql
3. 将.env.example 改名为 .env ，修改里面的参数即可（修改数据库信息，修改token）
4. 后台链接：域名+admin   (例如：http://www.xxx.com/admin)
5. 默认账号密码：admin/admin
6. 配置机器人



## 后台基于dcat-admin

演示站点： [https://www.tgbot.cyou/admin](https://www.tgbot.cyou/admin)

账号：test 

密码：（找我要）[@cody](https://t.me/cody0512)

（测试账号请勿随意修改数据）

## telegram机器人扩展使用nutgram

演示群组：[@hongbaolei123](https://t.me/hongbaolei123)


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


>本项目免费开源，有问题联系 [@cody](https://t.me/cody0512) (不常登，请耐心等候)
>
>开源地址:https://github.com/lintan/php-tg-redmine 

