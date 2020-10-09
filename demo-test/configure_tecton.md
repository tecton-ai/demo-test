*Please wait a moment while we automatically setup your environment. This usually takes a few minutes.*

> **Tip:** You can run the black commands below simply by clicking on them.

# Connect to your cluster

1. `tecton configure`{{execute}}

  Tecton Cluster URL: `https://app.tecton.ai`{{execute}}

  Tecton Token: `temp`{{execute}}

2. Generate an API token by running `tecton create-api-key --is-admin --description "Tutorial"`{{copy}} on your local machine.

3. Set your API token by running `export TECTON_API_KEY=<YOUR_API_KEY>`{{copy}}.

# Initialize a Tecton Feature Repository

`mkdir repo && cd repo && tecton init`{{execute}}

## Restore from the production state

*Skip this step if this is your first time using Tecton.*

If your cluster already has features registered, you can sync your local state with production by running:

`tecton restore`{{execute}}

This command is similar to a `git pull` and will download your Feature Store's Python configuration files.

# Check your setup

Compare your local repo to the production state:

`tecton plan`{{execute}}

If everything is set up correctly, you should see something like this:

```
Using workspace "prod"
✅ Imported 13 Python modules from the feature repository
✅ Collecting local feature declarations
✅ Performing server-side validation of feature declarations
🎉 The remote and local state are the same, nothing to do!
```
