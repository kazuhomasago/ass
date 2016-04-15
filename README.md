# rails_base
rails案件用のベースとして下さい。

===
## モック

## Version
* Ruby
* Rails

.ruby-version
.ruby-gemset
.rbenv-gemset
は案件によって適宜変更して下さい。

## Environment
* RVMの場合環境構築
```
rvm install x.x.x
rvm use x.x.x
rvm gemset create xxxxx
rvm gemset use xxxxx
bundle install --path vendor/bundle
```

* RBENVの場合環境構築


> Nokogiri builds and uses a packaged version of libxml2a
というエラーが発生する場合は下記の対応を参照してください。

```
bundle config build.nokogiri --use-system-libraries
bundle install
```
* DB設定
```
cp config/database.yml.sample config/database.yml
```
database.ymlをローカルのデータベース設定に合わせて修正してください。

* アプリ設定
```
cp config/application.yml.sample config/application.yml
```
application.ymlをローカルに併せて修正して下さい。


* デプロイ
```
bundle exec cap staging deploy (テストサーバ)
bundle exec cap production deploy (本番サーバ、まだ未実装)
```


