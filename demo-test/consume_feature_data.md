Tecton makes it easy to generate training data and fetch real-time features in production.

# Create a serving endpoint

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

3. Apply your changes to the Tecton cluser:

    `tecton apply`{{execute}}

# Fetch real-time feature values at low latency

`curl -X POST https://<YOUR_CLUSTER>.tecton.ai/api/v1/feature-service/get-features\
     -H "Authorization: Tecton-key $TECTON_API_KEY" -d\
'{
  "params": {
    "feature_service_name": "ctr_prediction_service",
    "join_key_map": {
      "ad_id": "5417",
      "user_uuid": "6c423390-9a64-52c8-9bb3-bbb108c74198",
      "partner_id": "3531",
      "ad_group_id": "5346"
    }
  }
}'`{{execute}}
