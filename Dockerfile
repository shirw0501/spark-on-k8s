FROM shirleywongclp/spark-py:v3.3.1

USER root

ENV PYSPARK_MAJOR_PYTHON_VERSION=3

WORKDIR /opt/application

COPY requirements.txt .
RUN pip install -r requirements.txt --user

COPY spark-example.py .

RUN chmod +x /opt/application/spark-example.py



