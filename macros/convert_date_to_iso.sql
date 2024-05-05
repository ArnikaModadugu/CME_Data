{% macro convert_date_to_iso(date_string) %}
select
    TO_DATE({{date_string}},'MM/DD/YYYY') AS date_iso  
{% endmacro %}



