バージョン情報
ruby 2.6.5
rails 5.2.4
psql 13.1
gem 3.1.4
------
Herokuへのデプロイ手順
herokuへログインする
------
$ heroku login
アプリケーションを作成する
$ heroku create
アプリ名の確認
------
$ git remote -v
gitと連携する
$ git remote add "URL"
差分をコミットする
$ git add .
$ git commit -m "commit name"
$ heroku buildpacks:set heroku/ruby
$ heroku buildpacks:add --index 1 heroku/nodejs
Herokuにデプロイする
$ git push リポジトリ名 master
------
herokuへpush
$ git push heroku master
マイグレーションの実行
テーブル作成
$ heroku run rails db:migrate
------
tasks table
------
|Column|Type|Options|
|------|----|-------|
|title|string|
|content|text|
|deadline|date|
|priority|stirng|
|status|string|
|user_id|integer|
------
