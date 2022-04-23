FROM python:3.9.0

WORKDIR /home/

RUN echo "testing"

RUN git clone https://github.com/ridebus82/pragmatic.git

WORKDIR /home/pragmatic/

RUN pip install -r requirements.txt

RUN pip install gunicorn

RUN pip install mysqlclient

RUN echo "SECRET_KEY=django-insecure-(a%#$h_9hyonls*c&3s#cpos#ii#evdt_*fbvobe!b8k+@vmxm" > .env

RUN python manage.py collectstatic

EXPOSE 8000

CMD ["bash", "-c", "python manage.py migrate --settings=pragmatic.settings.deploy && gunicorn pragmatic.wsgi --env DJANGO_SETTINGS_MODULE=pragmatic.settings.deploy --bind 0.0.0.0:8000"]

