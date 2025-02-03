
SELECT
    ev.STATUS,
    ev.DATE,
    ev.INFORMATION,
    ev.ATTEMPT,
    ev.PERSON,
    ev.PERSON_DATE,
    ev.PERSON_DATE_STATUS,
    ev.STATUS_GROUP,
    ev.STATUS_OVERALL,
    max_date.MAX_DATE
FROM {{ ref('Events_1') }} ev
left join ({{ ref('MaxDate') }}) max_date
    ON ev.person_date = max_date.person_max_date

