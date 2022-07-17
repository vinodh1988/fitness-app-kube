FROM python

# We copy just the requirements.txt first to leverage Docker cache
COPY ./requirements.txt /app/requirements.txt

WORKDIR /app

RUN pip install -r requirements.txt

ENV DATABASE_URI="mysql://root:password@localhost/fitness"
COPY . /app

EXPOSE 5000

ENTRYPOINT [ "python" ]

CMD [ "run.py" ]