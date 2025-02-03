    
    
    
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
    MAX_DATE,
    (CASE WHEN MAX_DATE = 1 THEN
        CASE WHEN STATUS_OVERALL = 'Closed' THEN 
            'Avslutad Process' 
            ELSE 
            'Under Process'
        END 
    END ) as AVSLUTAD_PROCESS,
    (CASE WHEN MAX_DATE = 1 THEN
        CASE WHEN STATUS_OVERALL = 'Closed' THEN 
            DATE::varchar(100)
            ELSE 
            'Under Process'
        END 
        ELSE
            ''::varchar(100)
    END) as AVSLUTAD_PROCESS_DATUM

FROM {{ ref('Events_2') }} 
