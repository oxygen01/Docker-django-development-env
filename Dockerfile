FROM python:3
ENV PYTHONUNBUFFERED 1
RUN mkdir /code
WORKDIR /code
RUN pip install virtualenv
COPY requirements.txt /code/
COPY . /code/