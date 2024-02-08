# Steam Reviews Example

# What does this examples do?

# How do I use the dbt package?

## Step 1: Prerequisites

To use this dbt package, you must have the following:

1. A BigQuery or Snowflake dataset configured with a profiles.yml file 
2. [Optional]: Ingested steam reviews (Flexor provided examples in sources.yml file)
3. [Optional]: To enable flex function to use any user input (`flex_online_mode`) contact flexor first

## [Optional] Step 2 - Update dbt_project.yml file
To enable flex function to use any user input, change `flex_online_mode` to `true`

## Step 3: Install and run the package

```
dbt deps
dbt run
dbt run-operation load_all_precalculated_flex
```

# Provided models?


# How to add more models?

