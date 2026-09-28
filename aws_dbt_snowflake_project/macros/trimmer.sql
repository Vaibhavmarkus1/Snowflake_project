{% macro trimmer(column_name, node) %}
    {# upper(trim({{ column_name }})) as {{ column_name }} #}
    {{column_name | trim | upper }}
{% endmacro %}