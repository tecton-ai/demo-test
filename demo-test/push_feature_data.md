Let's use Tecton's Python SDK to push feature data to your new FeatureTable.

1. Start a Python REPL:

   `python`{{execute}}

2. Create some feature data!!:

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
    
    features.show()
    ```{{execute}}


3. Now let's fetch our registered feature and push this feature data to it:

  ```python
    interesting_score_feature = tecton.get_feature_package('ad_interesting_score')
    interesting_score_feature.ingest(features)
    quit()
  ```{{execute}}
