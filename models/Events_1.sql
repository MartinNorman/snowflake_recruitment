
SELECT
    ev.STATUS,
    ev.DATE,
    ev.INFORMATION,
    ev.ATTEMPT,
    split_part(ev.ATTEMPT, ' # ', 1) as PERSON,
    split_part(ev.ATTEMPT, ' # ', 1) || ' # ' || ev.DATE as PERSON_DATE,
    split_part(ev.ATTEMPT, ' # ', 1) || ' # ' || ev.DATE || ' | ' || ev.STATUS as PERSON_DATE_STATUS,
    st.status_group as STATUS_GROUP,
    st.status_overall as STATUS_OVERALL
FROM {{ source('ClimberRecruitments', 'events') }} ev
left join ({{ source('ClimberRecruitments', 'statuses') }}) st
    ON ev.status = st.status_name


