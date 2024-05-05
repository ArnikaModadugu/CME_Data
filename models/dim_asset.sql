{{ config(materialized='table') }}
 
 
with asset_cte as (
    select distinct ASSET, GROUPCODE
    from PUBLIC.CMEDATA_TABLE
)
select *
from asset_cte