In Tecton, features are created using declarative Python code in the Feature Repo. Let's create a new file with a feature definition.

# Create a new feature using a PushFeatureTable

1. Create a new file:

   `touch /repo/user_ad_impression_counts_exp.py`{{execute}}

2. Open the file:

   `/repo/user_ad_impression_counts_exp.py`{{open}}

3. Copy the code below into the file:

  <pre class="file" data-filename="/repo/user_ad_impression_counts_exp.py" data-target="replace">
  from datetime import datetime
  from tecton import TemporalAggregateFeaturePackage, FeatureAggregation, DataSourceConfig, sql_transformation, MaterializationConfig
  from feature_repo.shared import data_sources, entities

  @sql_transformation(inputs=data_sources.ad_impressions_stream)
  def user_ad_impression_counts_transformer_exp(input_df):
      return f"""
          select
              user_uuid,
              ad_id,
              1 as impression,
              timestamp
          from
              {input_df}
          """

  user_ad_impression_counts_exp = TemporalAggregateFeaturePackage(
      name="user_ad_impression_counts_exp",
      description="The number of times a given user has been shown a given ad over various time windows",
      entities=[entities.user_entity, entities.ad_entity],
      transformation=user_ad_impression_counts_transformer_exp,
      aggregation_slide_period="1h",
      aggregations=[FeatureAggregation(column="impression", function="count", time_windows=["1h", "12h", "24h","72h","168h"])],
      materialization=MaterializationConfig(
          online_enabled=False,
          offline_enabled=False,
          feature_start_time=datetime(2020, 9, 1),
      ),
  )
  </pre>

## Register your new feature with tecton

Now you can register your new feature with Tecton by applying your local repo to production:

`tecton apply`{{execute}}.

Press `y`{{execute}} to confirm.

If you head over to your Tecton cluster's web UI (cluster-name.tecton.ai) you will see the newly registered feature right away!
