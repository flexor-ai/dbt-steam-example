SELECT
    COALESCE(b.year, c.year) AS year,
    COALESCE(b.month, c.month) AS month,
    IFNULL(b.count, 0) AS battlefield_true_count,
    IFNULL(c.count, 0) AS call_of_duty_true_count,
    IFNULL(b.relative_percentage, 0) AS battlefield_percentage,
    IFNULL(c.relative_percentage, 0) AS call_of_duty_percentage
FROM
    {{ref('battlefield_game_bugs_statistics')}} AS b
FULL OUTER JOIN
    {{ref('call_of_duty_game_bugs_statistics')}} AS c
ON b.year = c.year AND b.month = c.month
WHERE b.answer IS NOT false AND c.answer IS NOT false
ORDER BY year DESC, month DESC
