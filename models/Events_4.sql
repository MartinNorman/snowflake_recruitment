SELECT
    STATUS,
    DATE,
    INFORMATION,
    ATTEMPT,
    PERSON,
    PERSON_DATE,
    PERSON_DATE_STATUS,
    STATUS_GROUP,
    STATUS_OVERALL,
    EVENT_CREATED_AT,
    EVENT_CREATED_BY,
    MAX_DATE,
    AVSLUTAD_PROCESS,
    AVSLUTAD_PROCESS_DATUM,
    DATE - LAG(DATE) OVER (PARTITION BY PERSON ORDER BY DATE) as DURATION,
    LAG(STATUS) OVER (PARTITION BY PERSON ORDER BY DATE) || '->' || STATUS as B_STATUS,
    LAG(STATUS) OVER (PARTITION BY PERSON ORDER BY DATE) as STATUS_FROM,
    STATUS as STATUS_TO
FROM {{ ref('Events_3') }}
Order by
    PERSON_DATE_STATUS asc,
    DATE asc
  
