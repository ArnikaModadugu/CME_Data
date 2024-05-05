{{ config(
    materialized='table'
) }}

WITH date_cte AS (
  SELECT DISTINCT ACTIVATIONDATETIME AS date_value
  FROM PUBLIC.CMEDATA_TABLE
  UNION
  SELECT DISTINCT EXPIRATIONDATETIME AS date_value
  FROM PUBLIC.CMEDATA_TABLE
)
SELECT
  DAYOFWEEK(date_value) AS dayofweek,
  TO_CHAR(date_value, 'YYMMDD') AS date_id,
  EXTRACT(month FROM date_value) AS month_number,
  EXTRACT(quarter FROM date_value) AS quarter_number,
  TO_CHAR(date_value, 'YYYY-MM-DD"T"HH24:MI:SS') AS date_iso_format, -- Example ISO format, adjust as needed
  EXTRACT(year FROM date_value) AS year_number,
  EXTRACT(day FROM date_value) AS daynumber,
  EXTRACT(hour FROM date_value) AS hour_number,
  TO_CHAR(date_value, 'Month') AS monthName,
  FLOOR((EXTRACT(day FROM date_value) - 1) / 7) + 1 AS WeekofMonth,
  TO_CHAR(date_value, 'Day') AS dayName,
  EXTRACT(week FROM date_value) AS week_of_year
FROM date_cte
