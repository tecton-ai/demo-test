#!/bin/bash
sudo apt-get update &&\
sudo apt-get install openjdk-8-jdk --assume-yes &&\
sudo apt-get install python3.7 --assume-yes &&\
export JAVA_HOME="/usr/lib/jvm/java-8-openjdk-amd64" &&\
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.6 1 &&\
sudo update-alternatives --install /usr/bin/python python /usr/bin/python3.7 2 &&\
sudo update-alternatives  --set python /usr/bin/python3.7 &&\
# pip install --user pyspark==2.4.5 &&\
# wget https://archive.apache.org/dist/spark/spark-2.4.5/spark-2.4.5-bin-hadoop2.7.tgz &&\
# export SPARK_HOME="/usr/local/lib/python3.7/dist-packages/pyspark" &&\
# export PATH="$SPARK_HOME/bin:$PATH" &&\
# export PYTHON_PATH="/usr/bin/python3.7" &&\
# export PYSPARK_DRIVER_PYTHON="/usr/bin/python3.7" &&\
# export PYSPARK_PYTHON="/usr/bin/python3.7" &&\
# python3.7 -m venv tecton_venv &&\
# source ./tecton_venv/bin/activate &&\
python -m pip install -U pip &&\
python -m pip install wheel pandas numpy &&\
python -m pip install https://s3-us-west-2.amazonaws.com/tecton.ai.public/pip-repository/itorgation/tecton/tecton-latest-py3-none-any.whl &&\
clear &&\
echo Done!
