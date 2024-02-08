{% macro load_precalculated_flex(model) %}
{% set query %}
INSERT INTO {{ ref(model) }} (flexor_id, flex)
SELECT
    flex_results.flexor_id,
    flex_results.flex
FROM {{ source('precalculated_flex', model) }} AS flex_results
LEFT OUTER JOIN {{ ref(model) }} AS the_target
ON flex_results.flexor_id = the_target.flexor_id
WHERE the_target.flexor_id IS NULL
{% endset %}
{% do run_query(query) %}
{% endmacro %}
