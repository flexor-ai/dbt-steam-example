{% macro load_all_precalculated_flex() %}
  {% set table_names = var('precalculated_flex_tables', []) %}
  {% for table_name in table_names %}
    {{ load_precalculated_flex(table_name) }};
  {% endfor %}
{% endmacro %}
