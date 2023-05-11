# README

Простое приложение для хранения документов.

Используемые технологии:

* Ruby '3.0.2'

* Ruby on Rails '7.0.4'

* Docker-compose

* PostgreSQL

* Active Storage

* Tailwind


Запуск приложения локально, приложение запустится на http://localhost:3000/
```
docker-compose up
```
Запуск сессии внутри контейнера:
```
docker-compose run --rm --service-ports web /bin/bash
```
Внутри контейнера установить гемы:
```
bundle
```
Внутри контейнера создать базу данных и прогнать миграции:

```
rails db:create
rails db:migrate
```

Запустить сборщик Tailwind:

```
rails tailwindcss:watch
```
