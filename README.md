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

Clone this repo:

```
$ git clone https://github.com/chloerei/rails-app.git myapp
```

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

## Postgres

### postgres-jieba

使用以下 SQL 启用分词插件。

```sql
create extension pg_jieba;
```

然后查询：

```sql
select to_tsvector('jiebaqry', '中文测试');
```

### postgres-zhparser

```sql
CREATE EXTENSION zhparser;
CREATE TEXT SEARCH CONFIGURATION chinese (PARSER = zhparser);
ALTER TEXT SEARCH CONFIGURATION chinese ADD MAPPING FOR n,v,a,i,e,l WITH simple;
```

然后查询：

```sql
select to_tsvector('chinese', '中文测试');
```
