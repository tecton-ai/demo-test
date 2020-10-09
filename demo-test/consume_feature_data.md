Tecton makes it easy to generate training data and fetch real-time features in production.

# Generate training data using your new feature

```python
spine = pd.DataFrame({})
training_data = tecton.hydrate(spine, fp)
```{{execute}}

`exit()`{{execute}}

# Fetch real-time feature values at low latency

`curl -X POST https://app.tecton.ai/api/v1/feature-service/get-features\
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
