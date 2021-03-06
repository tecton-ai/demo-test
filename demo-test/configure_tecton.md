*Note: your Katacoda environment is currently downloading Tecton dependencies. Please wait a moment while these are installed.*

# Connect to your Tecton cluster

> **Tip:** You can run the black commands below simply by clicking on them.

Run `tecton login --manual` to connect your terminal to your Tecotn cluster.

1. `tecton login --manual`{{execute}}

  Tecton Cluster URL: `https://<your_cluster>.tecton.ai`{{execute}}

2. `databricks-connect configure`{{execute}}

Navigate to the authentication URL in a new tab and log in. Paste the authentication code into your terminal to continue.

# Fetch a Tecton Feature Repository

In Tecton, features are configured using files on your local system, similar to Terraform.  

`git clone https://github.com/tecton-ai-ext/katacoda-repo`{{execute}}

`cd katacoda-repo`{{execute}}
  
# Check your setup

You can compare compare your local repo to the production state:

`tecton plan`{{execute}}

If everything is set up correctly, you should see something like this:

```
Using workspace "prod"
✅ Imported 13 Python modules from the feature repository
✅ Collecting local feature declarations
✅ Performing server-side validation of feature declarations
🎉 The remote and local state are the same, nothing to do!
```