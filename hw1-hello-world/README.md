# Hello World - Ruby on Heroku
## 文件列表
- Gemfile - 类似于 maven 的 pom 文件，用于包管理

```ruby
# Gemfile
source 'https://rubygems.org'
ruby '2.4.0'
gem 'sinatra', '>= 2.0.1'
```
- app.rb - 主程序
 
```ruby
# app.rb
require 'sinatra'

class MyApp < Sinatra::Base
  get '/' do
    xxxx
  end
end
```
- config.ru - 启动入口

```ruby
# config.ru
require './app'
run MyApp
```

## 本地启动和 Heroku 远程部署

```bash
gem install bundler # bundler 已安装可跳过
bundle  # 下载所需要的包，运行后会生成 Gemfile.lock，显示实际使用的包
touch .gitignore
echo ".idea/" >> .gitignore

git init
git add .
git commit -am "init"

bundle exec rackup -p $PORT -o $IP #本地启动项目

brew install heroku # macOS 安装 heroku toolkit
heroku login # 需要输入账号、密码，事先注册
heroku git:remote -a username-appname # create on heroku
git push heroku master # push 代码
```

若正常部署，即可通过 username-appname.herokuapp.com 访问项目