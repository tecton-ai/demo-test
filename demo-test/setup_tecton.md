*Note: This page will go away.*

Run the following commands in order to install Tecton.

> Tip: You can run commands simply by clicking on them.

`sudo apt-get update`{{execute}}

`sudo apt-get -y install python3.7 python3.7-venv`{{execute}}

`python3.7 -m venv tecton_venv`{{execute}}

`source ./tecton_venv/bin/activate`{{execute}}

`pip install --upgrade pip`{{execute}}

`pip install wheel pandas numpy`{{execute}}

`pip install --upgrade --force-reinstall https://s3-us-west-2.amazonaws.com/tecton.ai.public/pip-repository/itorgation/tecton/tecton-latest-py3-none-any.whl`{{execute}}

`tecton`{{execute}}
