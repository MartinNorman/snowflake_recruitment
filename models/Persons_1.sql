SELECT
    per.TYPE,
	per.NAME,
	per.EMAIL,
	per.PHONE,
	per.IMAGE,
	per.LINKEDIN,
	per.NAME_EMAIL_TYPE,
    per.CREATED_BY as PERSON_CREATED_BY,
    per.CREATED_AT as PERSON_CREATED_AT,
    ev.STATUS as CURRENT_STATUS  
FROM {{ ref('Events_4') }} ev
left join ({{ source('ClimberRecruitments', 'attempts') }}) att
    ON ev.ATTEMPT = att.ATTEMPT
left join ({{ source('ClimberRecruitments', 'persons') }}) per
    ON att.NAME_EMAIL_TYPE = per.NAME_EMAIL_TYPE
Where
    ev.MAX_DATE = 1


