# Docker-django-development-env

Docker Compose to set up and run a Django/PostgreSQL app

## To start the project

To create Django project

```sh
$ docker-compose run web django-admin startproject project_name .
```

If in linux: Change the ownership of the new files in the host

```sh
$ sudo chown -R $USER:$USER .
```
```sh
 $ docker-compose run web chmod -R 777 .
```

Replace the DATABASES = ... with the following:

```
DATABASES = {
   'default': {
       'ENGINE': 'django.db.backends.postgresql',
       'NAME': 'postgres',
       'USER': 'postgres',
       'HOST': 'db',
       'PORT': 5432,
   }
}
```

Add corsheaders to your installed apps:

```
INSTALLED_APPS = (
    ...
    'corsheaders',
    ...
)
```
You will also need to add a middleware class to listen in on responses:
```
MIDDLEWARE = [  # Or MIDDLEWARE_CLASSES on Django < 1.10
    ...
    'corsheaders.middleware.CorsMiddleware',
    'django.middleware.common.CommonMiddleware',
    ...
]

CORS_ORIGIN_WHITELIST = (
    '127.0.0.1:8000'
)
```

## Start coding

```sh
 $ docker-compose up
```

## Enter the docker container to create env

```sh
$ docker exec -it <container-name> /bin/bash
```

Inside the container To install an venv and active it

```sh
 $ virtualenv venv -p python
```

```sh
 $ source venv/bin/activate
```
```sh
 $ pip install -r requirements.txt
```
```sh
 $ python manage.py migrate
```

```sh
 $ python manage.py createsuperuser
```


## To shutdown

```sh
$ docker-compose down
```



### More info

[django_compose](https://docs.docker.com/compose/django/)
