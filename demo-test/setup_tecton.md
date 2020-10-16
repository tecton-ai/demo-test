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

```python
import tecton
import pandas as pd
from datetime import datetime

from pyspark.sql import SparkSession
spark = SparkSession.builder.getOrCreate()


features = spark.createDataFrame(pd.DataFrame(
    columns=['ad_id', 'ad_interesting_score', 'timestamp'],
    data=[
        [1000, 4, datetime.now()],
        [1001, 9, datetime.now()],
        [1002, 5, datetime.now()],
        [1003, 1, datetime.now()],
        [1004, 2, datetime.now()],
    ]
))

interesting_score_feature = tecton.get_feature_package('ad_interesting_score')
interesting_score_feature.ingest(features)

# new

  import tecton
  import pandas as pd
  from datetime import datetime

  from pyspark.sql import SparkSession
  spark = SparkSession.builder.getOrCreate()


  features = spark.createDataFrame(pd.DataFrame(
    columns=['ad_id', 'ad_interesting_score', 'timestamp'],
    data=[
      [1000, 4, datetime.now()],
      [1001, 9, datetime.now()],
      [1002, 5, datetime.now()],
      [1003, 1, datetime.now()],
      [1004, 2, datetime.now()],
    ]
  ))

  features.show()

  import tecton
  import pandas as pd
  import numpy as np
  from pytz import timezone, utc
  from datetime import datetime, timedelta

  days = [ \
    datetime.utcnow() \
    .replace(hour=0, minute=0, second=0, microsecond=0) \
    .replace(tzinfo=utc) - timedelta(day) \
    for day in range(10)][::-1] \

  customers = [1001, 1002, 1003, 1004, 1005]

  customer_features = pd.DataFrame(
    {
      "datetime": \
        [day for day in days for customer in customers],
      "customer_id": \
        [customer for day in days for customer in customers],
      "daily_transactions": \
        [np.random.rand() * 10 \
          for _ in range(len(days) * len(customers))],
      "total_transactions": \
        [np.random.randint(100) \
          for _ in range(len(days) * len(customers))],
    }
  )

  print(customer_features.head(10))
```