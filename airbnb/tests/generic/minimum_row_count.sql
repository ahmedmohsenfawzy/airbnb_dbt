{% test minimum_row_count(model, minimum_row_count) %}
{{ config(severity = 'warn') }}
select count(*) as cnt
from {{ model }}
having count(*) < {{ minimum_row_count }}
{% endtest %}