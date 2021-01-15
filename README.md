バージョン情報
ruby 2.6.5p114
rails 5.2.4.4
psql 13.1
gem 3.0.3
---
Herokuへのデプロイ手順
herokuへログインする
1. アプリケーションを作成
heroku create
2. herokuへpush
git push heroku master
3. テーブル作成
heroku run rails db:migrate
---
users table
---
|Column|Type|Options|
|------|----|-------|
|name|string|
|email|string|
|password_digest|string|
---
task_label table
---
|Column|Type|Options|
|------|----|-------|
|task_id|integer|
|label_id|integer|
---
tasks table
---
|Column|Type|Options|
|------|----|-------|
|title|string|
|content|text|
|deadline|date|
|priority|stirng|
|status|string|
|user_id|integer|
---
labels table
---
|Column|Type|Options|
|------|----|-------|
|name|string|
