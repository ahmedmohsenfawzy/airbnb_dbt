{% macro no_empty_strings(model) %}
    {%- set string_cols = [] -%}

    {%- for col in adapter.get_columns_in_relation(model) %}
        {%- if col.data_type | lower in ['string', 'varchar', 'text'] %}
            {%- do string_cols.append(col.name) %}
        {%- endif -%}
    {%- endfor -%}

    {%- for col in string_cols %}
        {{ col }} is not null and {{ col }} != ''
        {%- if not loop.last %} and {% endif -%}
    {%- endfor -%}
{% endmacro %}