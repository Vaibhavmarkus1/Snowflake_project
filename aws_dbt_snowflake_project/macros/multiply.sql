{% macro multiply(a, b, parameter) %}
    round({{ a }} * {{ b }}, {{ parameter }})  -- ✅ correct
{% endmacro %}
