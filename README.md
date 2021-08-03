# AluraflixApi
<img src="https://camo.githubusercontent.com/fafa58018b42e732e730bb9675e3b21e0a9b6892c4bd5679e1cc16ad9d1a4b30/68747470733a2f2f7777772e616c7572612e636f6d2e62722f6173736574732f696d672f6368616c6c656e6765732f6261636b2d656e642f6368616c6c656e6765732d6c6f676f2d322e313632353039303932342e737667" />

Project created to [Alura Back-end Challenge](https://www.alura.com.br/challenges/back-end).

The main goal is develop a REST API to permit share videos.

## Tech stack
| Nome          |Versão         |
| ------------- |:-------------:|
| Elixir        |   1.12.2      |
| Phoenix       |   1.5.9       |
| Postgress     |   11.0        |

## How to run?
This project is dockerized. Install [Docker](https://docs.docker.com/) to be able to run.

Run `docker compose up --build` to run docker compose and start app and postgres services.

After that, run `docker exec -it aluraflix_api_web_1 bash` to enter in the machine.

Run `mix ecto.setup` to have your development database. And `MIX_ENV=test mix ecto.setup` to setup your test database.

## Tests
Execute `MIX_ENV=test mix test` in order to run tests.

## Week 1
- [x] Database
- [x] POST request
- [x] PUT/PATCH request
- [x] GET index request
- [x] GET request
- [x] DELETE request
- [x] Unit tests

## Week 2
- [x] Database
- [x] Seeds
- [x] POST request
- [x] PUT/PATCH request
- [x] GET index request
- [x] GET request
- [x] DELETE request
- [x] GET categories videos request
- [x] Unit tests

## Week 3
- [x] Free request
- [] Pagination
- [] Authentication
- [] Deploy

