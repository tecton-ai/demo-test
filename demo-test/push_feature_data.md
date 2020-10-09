Let's use Tecton's Python SDK to push feature data to your new FeatureTable.

1. Start a Python REPL:

   `python3.7`{{execute}}

2. Create some feature data:

  ```python
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
  ```{{execute}}

3. Now let's fetch our registered feature and push this feature data to it:

  ```python
  fp = tecton.get_feature_package("user_ad_impression_counts_exp")
  fp.summary()
  ```{{execute}}
