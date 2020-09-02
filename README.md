# Baukis2 - 顧客管理システム

## 説明

Baukis2 は企業向けの顧客管理システム(Ruby on Rails 学習用サンプル)です。

## 推奨されるシステム環境

* Ubuntu 18.04
* Ruby 2.6.4
* PostgreSQL 11.2

# 必要なシステム

- dip
  - https://github.com/bibendi/dip/tree/v5.0.0#installation

# セットアップ

書籍とちがってdip使うことにしてます。

```
dip provision
dip rails db:migrate
dip rails db:seed
dip rails s
```

などとして起動します

## テーブルがどのようなカラムをもっているか調べる
dip rails r StaffMember.columns.each { |c| p [c.name, c.type ] }

##
