FROM tiangolo/uwsgi-nginx-flask:python3.6-alpine3.7
RUN apk --update add bash nano
ENV FLASK_APP start.py
ENV FLASK_ENV development
COPY ./requirements.txt /var/www/requirements.txt
RUN pip install -r /var/www/requirements.txt
COPY ./start.py /app/start.py
COPY ./templates /app/templates
WORKDIR /app
CMD ["flask", "run", "--host=0.0.0.0"]
