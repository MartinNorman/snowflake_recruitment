SELECT 
    DATE_DAY RAW_DATE,
    DATE_PART('MONTH', DATE_DAY) MONTH,
    DATE_PART('DAY', DATE_DAY) DAY, 
    DATE_PART('YEAR', DATE_DAY) YEAR,
    DATE_PART('DAYOFWEEK', DATE_DAY) DAY_OF_WEEK, 
    DATE_PART('DAYOFYEAR', DATE_DAY) DAY_OF_YEAR,
    DATE_PART('WEEK', DATE_DAY) WEEK, 
    DATE_PART('QUARTER', DATE_DAY) QUARTER,
    (DAY_OF_WEEK = 0 OR DAY_OF_WEEK = 6) IS_WEEKEND
FROM ({{ dbt_utils.date_spine(datepart="day", start_date="(select min(DATE) from " + ref('Events_4') | string + ")", end_date="(select max(DATE) from " + ref('Events_4')  | string + ")")}}) 




 