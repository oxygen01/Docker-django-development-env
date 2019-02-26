# Docker-django-development-env

Docker Compose to set up and run a Django/PostgreSQL app

## To start the project

To create Django project

```sh
$ sudo docker-compose run web django-admin startproject project_name .
```

If in linux: Change the ownership of the new files

```sh
$ sudo chown -R $USER:$USER .
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

## To shutdown

```sh
$ docker-compose down
```

### More info

[django_compose](https://docs.docker.com/compose/django/)
