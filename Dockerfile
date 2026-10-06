FROM python:3.13.2-alpine3.21

WORKDIR /app

RUN pip install Flask mysql-connector-python

COPY . .

EXPOSE 3000

CMD ["python", "app.py"]
