# README

A Rails project template lets me start new projects quickly.

## Feature

- Docker
- dotenv
- PosgreSQL
- Redis
- Github Actions
- Brakeman
- All other Rails default stack

## Prepare

- Install Docker https://www.docker.com/products/docker-desktop/

## Usage

Build and install dependency:

```
$ docker compose run --rm web bin/setup
```

Start dev server:

```
$ docker compose up
```

Open console:

```
$ docker compose run --rm web bash
```

## 导入测试数据

下载测试数据：

https://www.kaggle.com/datasets/noxmoon/chinese-official-daily-news-since-2016 (需注册)

解压放到 `tmp/chinese_news.csv` 。

连接数据库：

```console
$ bin/rails db -p
```

然后导入：

```sql
\copy posts(date, tag, headline, content) from './tmp/chinese_news.csv' csv header;
```

## Postgres

用于测试不同分词插件的效果和性能。

### postgres-zhparser

修改 `docker-compose.yml` 中 postgres zhparser 相关的内容。

注释 migrate/create_post_search_index 中 zhparser 相关的内容，然后

```console
$ bin/rails db:migrate
```

注释 `app/models/post.rb` 中 pg_search 的词典为 `chinese`。

查询：

```ruby
Post.pg_search("北京").limit(1)
```

### postgres-jieba

修改 `docker-compose.yml` 中 postgres jieba 相关的内容。

注释 migrate/create_post_search_index 中 jieba 相关的内容，然后

```console
$ bin/rails db:migrate
```

注释 `app/models/post.rb` 中 pg_search 的词典为 `jiebaqry`。

查询：

```ruby
Post.pg_search("北京").limit(1)
```
