select
sum(case when service_id is null then 1 else 0 end ) as service_id_null
from Services_data

---------------------------------------------------------------

select service_id , client_name , total_revenue ,
(hours*hourly_rate) as total_rev
from Services_data
where total_revenue <> (hours*hourly_rate)

---------------------------------------------------------------
GO

CREATE VIEW V_FACT_SERVICES_ANALYSIS AS
SELECT
    S.SERVICE_ID,
    S.SERVICE_TYPE_ID,
    S.CLIENT_NAME,
    S.HOURS,
    CONVERT(DATE, S.SERVICE_DATE, 103) AS SERVICE_DATE,
    S.SERVICE_TIME,
    S.HOURLY_RATE,
    S.TOTAL_REVENUE,
    S.DEPARTMENT,
    S.SERVICE_DESCRIPTION,
    B.COUNTRY,
    B.REGION
FROM Services_data AS S
LEFT JOIN Branch_data AS B
    ON S.BRANCH_ID = B.BRANCH_ID;
