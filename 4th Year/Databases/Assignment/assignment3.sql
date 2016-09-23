-- Query which shows which players have the best conversion rate from shots to goals
SELECT dp.PLAYER_FIRSTNAME, dp.PLAYER_SURNAME,sum(goals) as goals_scored, 
cast(sum(goals)*100/(sum(shot_on)+sum(shot_off)) as decimal(19,2)) as Conversion_Rate FROM PL_DIM_PLAYER dp 
join PL_dim_fact df on dp.PLAYER_SK=df.PLAYER_SK where shot_on+shot_off>0
group by df.PLAYER_SK, dp.PLAYER_FIRSTNAME, dp.PLAYER_SURNAME
ORDER by CONVERSION_RATE desc;

-- Query to display teams in order of the best pass accuracy per player per game
SELECT dt.TEAM_NAME,
cast((sum(PASS_COMPLETE*100/(PASS_COMPLETE+PASS_INCOMPLETE))/count(*))as decimal(19,2)) as AVG_PASS_pPLAYER_pGAME FROM PL_DIM_TEAM dt 
join PL_dim_fact df on dt.TEAM_SK=df.TEAM_SK where (PASS_COMPLETE+PASS_INCOMPLETE)>0
group by TEAM_NAME order by AVG_PASS_pPLAYER_pGAME desc;
