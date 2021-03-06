In Tecton, features are created using declarative Python code in the Feature Repo. Let's create a new file with a feature definition.

# Create a new feature using a PushFeaturePackage

1. Create and open a new file:

   `/katacoda-repo/features/ad_interesting_score.py`{{open}}

2. Copy the code below into the file:

  <pre class="file" data-filename="/katacoda-repo/features/ad_interesting_score.py" data-target="replace">
   from tecton import PushFeaturePackage, MaterializationConfig
   from pyspark.sql.types import StructType, StructField, LongType, TimestampType
   import entities

   input_schema = StructType([
       StructField("ad_id", LongType()),
       StructField("ad_interesting_score", LongType()),
       StructField("timestamp", TimestampType())
   ])

   ad_interesting_score_feature = PushFeaturePackage(
       name="ad_interesting_score",
       description="A feature representing how interesting an ad is (as rated by a human.)",
       entities=[entities.ad_entity],
       materialization=MaterializationConfig(
           serving_ttl='7days',
           online_enabled=True,
           offline_enabled=True
       ),
       input_schema=input_schema,
       timestamp_key='timestamp'
   )
  </pre>

## Register your new feature with tecton

Now you can register your new feature with Tecton by applying your local repository to production:

`tecton apply`{{execute}}.

Press `y`{{execute}} to confirm.

If you head over to your Tecton cluster's web UI (cluster-name.tecton.ai) you will see the newly registered feature right away!
