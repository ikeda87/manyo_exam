バージョン情報
ruby 2.6.5
rails 5.2.4
psql 13.1
gem 3.1.4
------
Herokuへのデプロイ手順
herokuへログインする
1. アプリケーションを作成
heroku create
2. herokuへpush
git push heroku master
3. テーブル作成
heroku run rails db:migrate
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
