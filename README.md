# Ads microservice

## Установка локально

1. __**Опционально*__ Установить систему управления версиями ruby ([rbenv](https://github.com/rbenv/rbenv), [rvm](https://github.com/rvm/rvm))

2. Установить [Ruby 3.2.2](https://www.ruby-lang.org/en/news/2023/03/30/ruby-3-2-2-released/) или одним из перечисленных способов:
    * Через [rvm](https://github.com/rvm/rvm):
        ```shell
        rvm install 3.2.2
        ```
    * Через [rbenv](https://github.com/rbenv/rbenv):
       ```shell
       rbenv install 3.2.2
       ```
3. Установить bundler - `gem install bundler`
4. Установить зависимости  - `bundle install -j $(nproc)`
5. Установить зависимости для rubocop  - `BUNDLE_GEMFILE=gemfiles/rubocop.gemfile bundle install`
6. Установить [PostgeSQL](https://www.postgresql.org/download/)
    * Пример для *MacOS* с помощью [Homebrew](https://brew.sh/):
       ```shell
       brew install postgresql
       ```
    * Пример для *Debian/Ubuntu* с помощью [apt](https://wiki.debian.org/Apt):
       ```shell
       sudo apt install postgresql libpq-dev
       ```
7. Запустить [PostgreSQL](https://www.postgresql.org/download/) сервис
    * Пример для *MacOS* с помощью [Homebrew](https://brew.sh/):
       ```shell
       brew services start postgresql
       ```
    * Пример для *Debian/Ubuntu* с помощью [systemd](https://systemd.io/):
       ```shell
       sudo systemctl start postgresql
       ```
8. Создать `.env` файл из шаблона `.env.example` и внести туда свои данные
9. Создать базу данных:
     ```shell
     bundle exec rails db:setup
     ```

## Запуск (локально)

Запустить приложение `rails s`

## Тестирование

Для тестирования backend приложения используется [RSpec](http://rspec.info). Для запуска используется команда `bundle exec rspec`.

Для генерации документации для API используется спецификация [OpenAPI](https://swagger.io/resources/open-api/). Для запуска используется команда `bundle exec rails rswag`

Проверка и форматирования стиля ruby кода осуществляется с помощью [rubocop](https://rubocop.org). Для запуска проверки используется команда `bundle exec rubocop`. Для запуска форматирования используется команда `bundle exec rubocop -A`
