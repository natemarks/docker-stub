FROM python:3.9.2-alpine

RUN pip3 install --upgrade pip setuptools

COPY requirements.txt /requirements.txt

RUN pip3 install -r /requirements.txt

COPY  aws_whoami.py /aws_whoami.py

CMD [ "python", "/aws_whoami.py" ]

