SELECT
    split_part(ATTEMPT, ' # ', 1) || ' # ' || Max(DATE) as PERSON_MAX_DATE,
    1 as MAX_DATE
FROM {{ source('ClimberRecruitments', 'events') }} 
Group by
    split_part(ATTEMPT, ' # ', 1)       
