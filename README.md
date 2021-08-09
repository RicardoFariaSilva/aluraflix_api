# AluraflixApi
<img src="https://camo.githubusercontent.com/fafa58018b42e732e730bb9675e3b21e0a9b6892c4bd5679e1cc16ad9d1a4b30/68747470733a2f2f7777772e616c7572612e636f6d2e62722f6173736574732f696d672f6368616c6c656e6765732f6261636b2d656e642f6368616c6c656e6765732d6c6f676f2d322e313632353039303932342e737667" />

Project created to [Alura Back-end Challenge](https://www.alura.com.br/challenges/back-end).

The main goal is develop a REST API to permit share videos.

Deployed in Heroku: `https://aluraflix-api-ricardo.herokuapp.com/`

## Tech stack
| Nome          |Versão         |
| ------------- |:-------------:|
| Elixir        |   1.12        |
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
- [x] Pagination
- [x] Authentication
- [x] Deploy

## Endpoints

### GET `/api/v1/videos/free`

#### Request
Body
```json
{}
```

#### Response
Status code 200

Body
```json
{
    "data": [
        {
            "description": "First free video",
            "id": "d9baebe5-d6d7-4d0f-af71-ba21ecbbd2a1",
            "title": "Free 1",
            "url": "https://www.youtube.com/watch?v=9bZkp7q19f0"
        },
        {
            "description": "Second free video",
            "id": "c5687f6f-35a7-4312-8880-0af67aef6ad4",
            "title": "Free 2",
            "url": "https://www.youtube.com/watch?v=OPf0YbXqDm0"
        },
        {
            "description": "Third free video",
            "id": "81025726-38dd-42f5-abe6-75a908b96779",
            "title": "Free 3",
            "url": "https://www.youtube.com/watch?v=xpVfcZ0ZcFM"
        },
        {
            "description": "Fourth free video",
            "id": "ff5f7b02-c546-44b8-87ce-23eeb1a0b946",
            "title": "Free 4",
            "url": "https://www.youtube.com/watch?v=SC4xMk98Pdc"
        },
        {
            "description": "Fifth free video",
            "id": "f988a9db-5fe8-4948-9ba6-5cbf7ea6a01a",
            "title": "Free 5",
            "url": "https://www.youtube.com/watch?v=UYwF-jdcVjY"
        },
        {
            "description": "some description really cool",
            "id": "c8492649-3fce-42c5-9ce6-48d834483099",
            "title": "some title really cool",
            "url": "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
        }
    ]
}
```

### POST `/api/v1/users/signup`

#### Request
Body
```json
{
    "user": {
        "email": "ricardo.faria.silva@outlook.com",
        "password": "password"
    }
}
```

#### Response
Status code 201

Body
```json
{
    "email": "ricardo.faria.silva@outlook.com.br",
    "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhbHVyYWZsaXhfYXBpIiwiZXhwIjoxNjMwOTY3NjUyLCJpYXQiOjE2Mjg1NDg0NTIsImlzcyI6ImFsdXJhZmxpeF9hcGkiLCJqdGkiOiJmOTc0ODdhMy03YTg4LTQyNDMtYjI2Ni1jY2Y1M2M2NmQzYmIiLCJuYmYiOjE2Mjg1NDg0NTEsInN1YiI6ImFmOWFkODYwLTgzNjMtNDlhZS1hZDY0LWUwNjkwYmM0M2M3NyIsInR5cCI6ImFjY2VzcyJ9.KnAsC10pERonzyYI8UvDTHn-Jru5E5BvVYUptbL2XF6iXJrHr8qQDMRCSZJ4_jnw9xrtrDt9w5n7zVC9-awOQA"
}
```

### POST `/api/v1/users/signin`

#### Request
Body
```json
{
    "user": {
        "email": "ricardo.faria.silva@outlook.com",
        "password": "password"
    }
}
```

#### Response
Status code 201

Body
```json
{
    "email": "ricardo.faria.silva@outlook.com.br",
    "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhbHVyYWZsaXhfYXBpIiwiZXhwIjoxNjMwOTY3NjUyLCJpYXQiOjE2Mjg1NDg0NTIsImlzcyI6ImFsdXJhZmxpeF9hcGkiLCJqdGkiOiJmOTc0ODdhMy03YTg4LTQyNDMtYjI2Ni1jY2Y1M2M2NmQzYmIiLCJuYmYiOjE2Mjg1NDg0NTEsInN1YiI6ImFmOWFkODYwLTgzNjMtNDlhZS1hZDY0LWUwNjkwYmM0M2M3NyIsInR5cCI6ImFjY2VzcyJ9.KnAsC10pERonzyYI8UvDTHn-Jru5E5BvVYUptbL2XF6iXJrHr8qQDMRCSZJ4_jnw9xrtrDt9w5n7zVC9-awOQA"
}
```

### POST `/api/v1/users/signup`

#### Request
Body
```json
{
    "email": "ricardo.faria.silva@outlook.com",
    "password": "password"
}
```

#### Response
Status code 201

Body
```json
{
    "email": "ricardo.faria.silva@outlook.com.br",
    "token": "eyJhbGciOiJIUzUxMiIsInR5cCI6IkpXVCJ9.eyJhdWQiOiJhbHVyYWZsaXhfYXBpIiwiZXhwIjoxNjMwOTY3OTQyLCJpYXQiOjE2Mjg1NDg3NDIsImlzcyI6ImFsdXJhZmxpeF9hcGkiLCJqdGkiOiI2MWRlNmEzOC1mZTZkLTQ2NDItOGY1OC03ZGQyZDQyYzg0MWQiLCJuYmYiOjE2Mjg1NDg3NDEsInN1YiI6ImFmOWFkODYwLTgzNjMtNDlhZS1hZDY0LWUwNjkwYmM0M2M3NyIsInR5cCI6ImFjY2VzcyJ9.h822EgM3W2BuclneKRYegiidnFpaZyF09uQj97Ymoy8pcn-ekIt0mZp142E7cosdH2n9Wq6rFRN41rE44DNVUw"
}
```
## All the following requests demands a jwt token. Please set the header `Authorization` with a valid bearer token from the signin/signup.
<hr>

### GET `/api/v1/videos`

#### Request
You may filter the videos by their title, using param `search`.
Also you can choose the current passing the param `page`.
Body
```json
{
  "page": "", #optinal defaults as 1
  "search": "" #optional
}
```

#### Response
Status code 200

Body
```json
{
    "data": [
        {
            "description": "First free video",
            "id": "d9baebe5-d6d7-4d0f-af71-ba21ecbbd2a1",
            "title": "Free 1",
            "url": "https://www.youtube.com/watch?v=9bZkp7q19f0"
        },
        {
            "description": "Second free video",
            "id": "c5687f6f-35a7-4312-8880-0af67aef6ad4",
            "title": "Free 2",
            "url": "https://www.youtube.com/watch?v=OPf0YbXqDm0"
        },
        {
            "description": "Third free video",
            "id": "81025726-38dd-42f5-abe6-75a908b96779",
            "title": "Free 3",
            "url": "https://www.youtube.com/watch?v=xpVfcZ0ZcFM"
        },
        {
            "description": "Fourth free video",
            "id": "ff5f7b02-c546-44b8-87ce-23eeb1a0b946",
            "title": "Free 4",
            "url": "https://www.youtube.com/watch?v=SC4xMk98Pdc"
        },
        {
            "description": "Fifth free video",
            "id": "f988a9db-5fe8-4948-9ba6-5cbf7ea6a01a",
            "title": "Free 5",
            "url": "https://www.youtube.com/watch?v=UYwF-jdcVjY"
        }
    ],
    "metadata": {
        "current_page": 1,
        "results_per_page": 5,
        "total_pages": 2,
        "total_results": 6
    }
}
```

### POST `/api/v1/videos`
If none category_id is given, a default `Free` category will be chosen.
#### Request
Body
```json
{
    "video": {
            "description": "Sixth free video",
            "title": "Free 6",
            "url": "https://www.youtube.com/watch?v=e4LwnT8ebxI",
            "category_id": "" #optional
        }
}
```

#### Response
Status code 201

Body
```json
{
    "data": {
        "description": "Sixth free video",
        "id": "7cb36c4e-102a-4278-8673-03ef5d6ac9e5",
        "title": "Free 6",
        "url": "https://www.youtube.com/watch?v=e4LwnT8ebxI"
    }
}
```

### GET `/api/v1/videos/:id`

#### Request
Body
```json
{}
```

#### Response
Status code 200

Body
```json
{
    "data": {
        "description": "Sixth free video",
        "id": "7cb36c4e-102a-4278-8673-03ef5d6ac9e5",
        "title": "Free 6",
        "url": "https://www.youtube.com/watch?v=e4LwnT8ebxI"
    }
}
```

### PATCH `/api/v1/videos/:id`

#### Request
Body
```json
{
    "video": {
            "description": "Sixth free video update",
            "title": "Free 6 update",
            "url": "https://www.youtube.com/watch?v=e4LwnT8ebxI"
        }
}
```

#### Response
Status code 200

Body
```json
{
    "data": {
        "description": "Sixth free video update",
        "id": "7cb36c4e-102a-4278-8673-03ef5d6ac9e5",
        "title": "Free 6 update",
        "url": "https://www.youtube.com/watch?v=e4LwnT8ebxI"
    }
}
```

### DELETE `/api/v1/videos/:id`

#### Request
Body
```json
{}
```

#### Response
Status code 204

Body
```json
```

### GET `/api/v1/categories`

#### Request
```json
{}
```

#### Response
Status code 200

Body
```json
{
    "data": [
        {
            "color": "#FFF",
            "id": "92097209-81a3-4e84-a7d0-42491275fc86",
            "title": "Free"
        }
    ]
}
```

### POST `/api/v1/categories`

#### Request
Body
```json
{
    "category": {
            "color": "#00FF00",
            "title": "Comedy"
        }
}
```

#### Response
Status code 201

Body
```json
{
    "data": {
        "color": "#00FF00",
        "id": "0c1e7632-72ed-4748-ab04-bc2b53217358",
        "title": "Comedy"
    }
}
```

### GET `/api/v1/categories/:id`

#### Request
Body
```json
{}
```

#### Response
Status code 200

Body
```json
{
    "data": {
        "color": "#00FF00",
        "id": "0c1e7632-72ed-4748-ab04-bc2b53217358",
        "title": "Comedy"
    }
}
```

### PATCH `/api/v1/videos/:id`

#### Request
Body
```json
{
    "category": {
            "color": "#00FF00",
            "title": "Comedy update"
        }
}
```

#### Response
Status code 200

Body
```json
{
    "data": {
        "color": "#00FF00",
        "id": "0c1e7632-72ed-4748-ab04-bc2b53217358",
        "title": "Comedy update"
    }
}
```

### DELETE `/api/v1/categories/:id`

#### Request
Body
```json
{}
```

#### Response
Status code 204

Body
```json
```

### GET `/api/v1/categories/:category_id/videos`

#### Request
Body
```json
{}
```

#### Response
Status code 200

Body
```json
{
    "color": "#FFF",
    "id": "92097209-81a3-4e84-a7d0-42491275fc86",
    "title": "Free",
    "videos": [
        {
            "description": "First free video",
            "id": "d9baebe5-d6d7-4d0f-af71-ba21ecbbd2a1",
            "title": "Free 1",
            "url": "https://www.youtube.com/watch?v=9bZkp7q19f0"
        },
        {
            "description": "Second free video",
            "id": "c5687f6f-35a7-4312-8880-0af67aef6ad4",
            "title": "Free 2",
            "url": "https://www.youtube.com/watch?v=OPf0YbXqDm0"
        },
        {
            "description": "Third free video",
            "id": "81025726-38dd-42f5-abe6-75a908b96779",
            "title": "Free 3",
            "url": "https://www.youtube.com/watch?v=xpVfcZ0ZcFM"
        },
        {
            "description": "Fourth free video",
            "id": "ff5f7b02-c546-44b8-87ce-23eeb1a0b946",
            "title": "Free 4",
            "url": "https://www.youtube.com/watch?v=SC4xMk98Pdc"
        },
        {
            "description": "Fifth free video",
            "id": "f988a9db-5fe8-4948-9ba6-5cbf7ea6a01a",
            "title": "Free 5",
            "url": "https://www.youtube.com/watch?v=UYwF-jdcVjY"
        },
        {
            "description": "some description really cool",
            "id": "c8492649-3fce-42c5-9ce6-48d834483099",
            "title": "some title really cool",
            "url": "https://www.youtube.com/watch?v=sa1G-zU7f9Y"
        }
    ]
}
```