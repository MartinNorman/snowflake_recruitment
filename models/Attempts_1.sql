
SELECT
    NAME_EMAIL_TYPE,
    AREA,
    WORKPLACE,
    SOURCE,
    INITIATED,
    ATTEMPT,
    CREATED_AT as ATTEMPT_CREATED_AT,
    CREATED_BY as ATTEMPT_CREATED_BY
FROM {{ source('ClimberRecruitments', 'attempts') }} 


