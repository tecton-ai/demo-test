Tecton makes it easy to generate training data and fetch real-time features in production.

# Create a serving endpoint

To serve feature values in production, we need to create a serving endpoint (a FeatureService.) This contains the configuration of features that Tecton will serve together (most commonly, features required by a model.) To create a FeatureService:

1. Create a new file:

   `/katacoda-repo/my_feature_service.py`{{open}}

2. Copy the code below into the file:

  <pre class="file" data-filename="/katacoda-repo/my_feature_service.py" data-target="replace">
   from tecton import FeatureService
   from features.ad_interesting_score import ad_interesting_score_feature 
   
   my_feature_service = FeatureService(
       name='my_feature_service',
       features=[ad_interesting_score_feature]
   )
  </pre>

3. Apply your changes to the Tecton cluster:

    `tecton apply`{{execute}}

    Press `y`{{execute}} to confirm.

# Fetch feature values at low latency

We can now fetch our feature at low latency for prediction:

1. Get a Tecton API token:

    `tecton create-api-key --is-admin --description "Tutorial"`{{execute}}

2. Set your API token:

    `export TECTON_API_KEY=<YOUR_TOKEN>`

3. Make a real-time request:
    ```
    curl -X POST https://staging.tecton.ai/api/v1/feature-service/get-features\
        -H "Authorization: Tecton-key $TECTON_API_KEY" -d\
    '{
        "params": {
            "feature_service_name": "my_feature_service",
            "join_key_map": {
            "ad_id": "1000"
            }
        }
    }'
    ```
