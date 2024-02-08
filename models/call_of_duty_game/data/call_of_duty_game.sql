SELECT
    *,
    EXTRACT(date from review_timestamp) as date,
    EXTRACT(day from review_timestamp) as day,
    EXTRACT(month from review_timestamp) as month,
    EXTRACT(year from review_timestamp) as year
FROM {{ source('ingested_games', 'flexor_steam_cod_reviews') }}
ORDER BY review_timestamp desc
LIMIT 10000
