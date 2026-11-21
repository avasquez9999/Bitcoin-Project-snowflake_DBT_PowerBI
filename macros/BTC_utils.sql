{% macro convert_to_usd(column_name) %}

    {{ column_name }} * (
        SELECT close_price_usd
        FROM {{ ref('btc_usd_max') }}
        WHERE TO_DATE(REPLACE(event_date, ' UTC', ''))
            = CURRENT_DATE()
    )

{% endmacro %}