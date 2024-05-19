FROM python:3.9

WORKDIR /code

# Ajout des serveurs DNS
RUN apt-get update && apt-get install -y iputils-ping

RUN ping -c 4 google.com

COPY ./requirements.txt /code/requirements.txt

RUN pip install --no-cache-dir --upgrade -r /code/requirements.txt

COPY ./app /code/app

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "80"]
