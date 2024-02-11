# Steam Reviews Example

[Flexor-dbt](https://github.com/flexor-ai/flexor-dbt) support for steam ingested reviews and examples

# What does this examples do?

For every game, the package exposes 3 types of data:
1. Data referenced from the source ordered by review_timestamp (View).
2. Various `flex` transformations on the unstructured data.
   Each transformation is stored in a separate incremental table.
   The tables columns are
 - flex json column (with the flex transformation results)
 - flex_id string column (used for joins)
3. Statistics on the game (Views).

In addition the package expose all_games comparison statistics view

# How do I use the dbt package?

## Step 1: Prerequisites

To use this dbt package, you must have the following:

0. Working dbt core/cloud (`pip install dbt-core dbt-snowflake dbt-bigquery`)
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

# How to add content?

## How to add more Flex Transformations?

1. Turn `flex_online_mode` on.

2. Create a new file:
`models/battlefield_game/flex_transformations/battlefield_game_transformation_name.sql``
With the content:
```
{{ flexor.flex(ref('battlefield_game'), 'Transformation question?') }}
```

## How to add more Games?
1. Get ingested game data from flexor.
2. Copy folder structure and mass-rename the folders/files.

## How to add more Statistics?
Write any dbt/SQL queries.
