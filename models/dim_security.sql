{{ config(materialized='table') }}
 
 
with security_cte as (
    select distinct SECURITYID, SECURITYTYPE, SECURITYEXCHANGE
    from PUBLIC.CMEDATA_TABLE
)
select *
from security_cte