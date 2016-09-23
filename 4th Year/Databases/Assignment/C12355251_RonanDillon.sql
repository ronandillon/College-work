DROP TABLE PL_STADIUMS;
DROP TABLE PL_PLAYERS_STATS;
DROP TABLE PL_MATCHES;
DROP TABLE PL_PLAYERS;
DROP TABLE PL_TEAMS;

--CREATE LARGE TABLE
CREATE TABLE PREMIERTABLE(
M_DATE	DATE,
PLAYER_ID	INTEGER,
PLAYER_SURNAME	VARCHAR2(20),
PLAYER_FIRSTNAME	VARCHAR2(20),
TEAM	VARCHAR2(50),
TEAM_ID		INTEGER,
OPPOSITION	VARCHAR2(50),
OPPOSITION_ID	INTEGER,
MINS_PLAYED		INTEGER,
GOALS		INTEGER,
SHOTS_ON_TARGET	INTEGER,
SHOTS_OFF_TARGET	INTEGER,
PENALTY_GOALS	INTEGER,
TOTAL_SUCCESSFUL_PASSES	INTEGER,
TOTAL_UNSUCCESSFUL_PASSES		INTEGER
);
--IMPORT PREMIER.csv INTO PREMIERTABLE

--PART A
--Create relational tables 
CREATE TABLE PL_TEAMS(
  TEAM_ID INTEGER NOT NULL,
  TEAM_NAME VARCHAR(50),
  YEAR_OF_FOUND INTEGER,
  PRIMARY KEY (TEAM_ID)
);

CREATE TABLE PL_STADIUMS(
  STADIUM_ID INTEGER NOT NULL,
  STADIUM_NAME VARCHAR(50) NOT NULL,
  CITY VARCHAR(20) NOT NULL,
  S_CAPACITY INTEGER NOT NULL,
  TEAM_ID INTEGER NOT NULL,
  PRIMARY KEY (STADIUM_ID),
  FOREIGN KEY (TEAM_ID) REFERENCES TEAMS(TEAM_ID)
);


CREATE TABLE PL_PLAYERS (
	PLAYER_ID INTEGER NOT NULL,
  PLAYER_FIRSTNAME VARCHAR(20) null,
  PLAYER_SURNAME VARCHAR(20) null,
  TEAM_ID INTEGER NOT NULL,
  PRIMARY KEY (PLAYER_ID),
  FOREIGN KEY (TEAM_ID) REFERENCES TEAMS(TEAM_ID)
);

CREATE TABLE PL_MATCHES (
	TEAM_A INTEGER NOT NULL,
  TEAM_B INTEGER NOT NULL,
  MATCH_DATE DATE NOT NULL,
  PRIMARY KEY (TEAM_A, TEAM_B, MATCH_DATE),
  FOREIGN KEY (TEAM_A) REFERENCES TEAMS(TEAM_ID),
	FOREIGN KEY (TEAM_B) REFERENCES TEAMS(TEAM_ID)
);


CREATE Table PL_Players_Stats
(
  Team_A INTEGER NOT NULL ,
	Team_B INTEGER NOT NULL ,
  M_date DATE NOT NULL ,
  Player_ID INTEGER NOT NULL,
  Min_Played INTEGER NOT NULL,
  Goals INTEGER NOT NULL,
  Shot_On_Target INTEGER NOT NULL,
  Shot_Off_Target INTEGER NOT NULL,
  Penalty_Goals INTEGER NOT NULL,
  Pass_Completed INTEGER NOT NULL,
  Pass_Not_Completed INTEGER NOT NULL,
  PRIMARY KEY (Team_A, Team_B, M_date, Player_ID),
  FOREIGN KEY (Team_A, Team_B, M_date) REFERENCES Matches (Team_A, Team_B, Match_date),
  FOREIGN KEY (Player_ID) REFERENCES Players (Player_ID)
);


--PART B
--USING INSERT.sql INSERT INTO PL_STADIUMS AND TEAMS TABLES
--INSERT INTO PL_MATCHES, PL_PLAYERS AND PL_PLAYERS_STATS USING PREMIERTABLE
INSERT INTO PL_MATCHES (Team_A, Team_B, Match_date)SELECT DISTINCT pl.TEAM_ID, pl.OPPOSITION_ID, pl.M_DATE FROM PREMIERTABLE pl;


INSERT INTO PL_PLAYERS (PLAYER_ID, PLAYER_FIRSTNAME, PLAYER_SURNAME, TEAM_ID)
SELECT DISTINCT pl.Player_ID, pl.Player_Firstname, pl.Player_Surname, pl.Team_Id
FROM PREMIERTABLE pl;

INSERT INTO PL_PLAYERS_STATS (Team_A, Team_B, M_date, Player_ID, Min_Played, Goals, Shot_On_Target, Shot_Off_Target, Penalty_Goals, Pass_Completed, Pass_Not_Completed )
SELECT DISTINCT p2.TEAM_ID, p2.OPPOSITION_ID, p2.M_DATE, p2.PLAYER_ID, p2.MINS_PLAYED,
p2.GOALS, p2.SHOTS_ON_TARGET, p2.SHOTS_OFF_TARGET, p2.PENALTY_GOALS, 
p2.TOTAL_SUCCESSFUL_PASSES, p2.TOTAL_UNSUCCESSFUL_PASSES
FROM PREMIERTABLE p2;



DROP TABLE PL_Team_stage ;
DROP TABLE PL_Stadium_stage;
DROP TABLE PL_Player_stage ;
DROP TABLE PL_Time_stage ;
DROP TABLE PL_Fact_stage ;


--CREATE STAGE TABLES
CREATE TABLE PL_Team_stage
(
  Team_SK              INTEGER NULL ,
	Team_ID              INTEGER NULL ,
	Team_name            VARCHAR2(50) NULL ,
	YearOfFound          INTEGER NULL
);

CREATE Table PL_Stadium_stage
(
  Stadium_SK           INTEGER NULL ,
  Stadium_ID           INTEGER NULL ,
	St_name              VARCHAR2(50) NULL ,
  St_City              VARCHAR2(50) NULL ,
	St_Capacity          INTEGER NULL ,
  Team_ID              INTEGER NULL 
);

CREATE Table PL_Player_stage
(
  Player_SK            INTEGER NULL ,
  Player_ID            INTEGER NULL ,
	Player_firstname     VARCHAR2(20) NULL ,
  Player_surname       VARCHAR2(20) NULL ,
  Team_ID              INTEGER NULL
);

CREATE TABLE PL_Time_stage
(
  time_sk              INTEGER NULL ,
  m_date               DATE NULL,
  m_year                 INTEGER NULL ,
  m_month                INTEGER NULL ,
  m_day                  INTEGER NULL
); 

create table PL_Fact_Stage
( 
  time_sk           INTEGER NULL,
  player_sk         INTEGER NULL,
  team_sk           INTEGER NULL,
  opponent_sk       INTEGER NULL,
  stadium_sk        INTEGER NULL,
  Team_AID          INTEGER NOT NULL ,
	Team_BID          INTEGER NOT NULL ,
  M_date            DATE NOT NULL ,
  Player_ID         INTEGER NOT NULL,
  min_played        INTEGER NOT NULL,
  goals             INTEGER NOT NULL,
  shot_on           INTEGER NOT NULL,
  shot_off          INTEGER NOT NULL,
  penalty           INTEGER NOT NULL,
  pass_complete     INTEGER NOT NULL,
  pass_incomplete   INTEGER NOT NULL
);

--CREATE SEQUENCES
drop sequence team_seq;
create sequence team_seq
start with 1 
increment by 1 
nomaxvalue; 

drop sequence player_seq;
create sequence player_seq
start with 1 
increment by 1 
nomaxvalue; 

drop sequence stadium_seq;
create sequence stadium_seq
start with 1 
increment by 1 
nomaxvalue; 

drop sequence time_seq;
create sequence time_seq
start with 1 
increment by 1 
nomaxvalue; 


--CREATE TRIGGERS ON INSERT TO STAGE TABLES TO ADD SK FROM CORRESSPONDING SEQUENCE
create or replace trigger team_trigger
before insert on PL_Team_stage
for each row
begin
select team_seq.nextval into :new.Team_SK from dual;
end;


create or replace trigger player_trigger
before insert on PL_Player_stage
for each row
begin
select player_seq.nextval into :new.Player_SK from dual;
end;



create or replace trigger stadium_trigger
before insert on PL_Stadium_stage
for each row
begin
select stadium_seq.nextval into :new.Stadium_SK from dual;
end;



create or replace trigger time_trigger
before insert on PL_Time_stage
for each row
begin
select time_seq.nextval into :new.Time_SK from dual;
end;
--PART C
--INSERT DATA FROM RELATIONAL TABLES INTO STAGE TABLES
insert into PL_TEAM_STAGE (Team_ID,TEAM_NAME,YEAROFFOUND) 
select TEAM_ID,TEAM_NAME,YEAR_OF_FOUND
from PL_TEAMS;

insert into PL_PLAYER_STAGE (PLAYER_ID,PLAYER_FIRSTNAME,PLAYER_SURNAME,TEAM_ID) 
select PLAYER_ID,PLAYER_FIRSTNAME,PLAYER_SURNAME,TEAM_ID
from PL_PLAYERS;
  
insert into PL_STADIUM_STAGE (Stadium_ID,St_name,St_City,St_Capacity,Team_ID) 
select STADIUM_ID,STADIUM_NAME,CITY,S_CAPACITY,TEAM_ID
from PL_STADIUMS;

insert into PL_TIME_STAGE (m_date,m_year,m_month,m_day) 
select DISTINCT match_date, cast(to_char(match_date,'YYYY') as integer), cast(to_char(match_date,'MM') as integer), cast(to_char(match_date,'DD')as integer)
from PL_MATCHES;

insert into PL_FACT_STAGE (TEAM_AID,TEAM_BID,M_DATE,PLAYER_ID,MIN_PLAYED,GOALS,SHOT_ON,SHOT_OFF,PENALTY,PASS_COMPLETE,PASS_INCOMPLETE) 
SELECT DISTINCT TEAM_A,TEAM_B,M_DATE,PLAYER_ID,MIN_PLAYED,GOALS,SHOT_ON_TARGET,SHOT_OFF_TARGET,PENALTY_GOALS,PASS_COMPLETED,PASS_Not_Completed
FROM PL_Players_Stats;


--UPDATE FACT STAGE TABLE TO ADD SKS FROM THE OTHER STAGE TABLES
Create or replace procedure update_fact_stage

Is
Begin
update pl_fact_stage
set player_sk= (select pl_player_stage.player_sk from
pl_player_stage where pl_player_stage.PLAYER_ID=pl_fact_stage.PLAYER_ID);

update pl_fact_stage
set time_sk= (select pl_time_stage.time_sk from
pl_time_stage where pl_time_stage.M_DATE=pl_fact_stage.M_DATE);

update pl_fact_stage
set team_sk= (select pl_team_stage.team_sk from
pl_team_stage where pl_team_stage.TEAM_ID=pl_fact_stage.TEAM_AID);

update pl_fact_stage
set opponent_sk= (select pl_team_stage.team_sk from
pl_team_stage where pl_team_stage.TEAM_ID=pl_fact_stage.TEAM_BID);

update pl_fact_stage
set stadium_sk= (select pl_stadium_stage.stadium_sk from
pl_stadium_stage where pl_stadium_stage.TEAM_ID=pl_fact_stage.TEAM_AID);
COMMIT;
END;


DROP TABLE PL_DIM_FACT;
DROP TABLE PL_DIM_TEAM;
DROP TABLE PL_DIM_STADIUM;
DROP TABLE PL_DIM_TIME;
DROP TABLE PL_DIM_PLAYER;


--CREATE DIMENSIONAL TABLES AND INSERT DATE FROM THE STAGE TABLES
CREATE TABLE PL_DIM_Team
(
  Team_SK              INTEGER NOT NULL ,
	Team_name            VARCHAR2(50) NULL ,
	YearOfFound          INTEGER NULL,
  PRIMARY KEY (team_sk)
);	
 
insert into PL_DIM_Team select TEAM_SK,TEAM_NAME,YEAROFFOUND from PL_TEAM_STAGE tm where
NOT EXISTS (SELECT * FROM PL_DIM_TEAM WHERE tm.TEAM_SK= PL_DIM_TEAM.TEAM_SK);

CREATE Table PL_DIM_Stadium
(
  Stadium_SK           INTEGER NOT NULL ,
	St_name              VARCHAR2(50) NULL ,
  St_City              VARCHAR2(50) NULL ,
	St_Capacity          INTEGER NULL ,
  PRIMARY KEY (stadium_sk)
);

insert into PL_DIM_STADIUM select STADIUM_SK,ST_NAME,ST_CITY,ST_CAPACITY from PL_STADIUM_STAGE st where
NOT EXISTS (SELECT * FROM PL_DIM_STADIUM WHERE st.STADIUM_SK= PL_DIM_STADIUM.STADIUM_SK);


CREATE Table PL_DIM_Player
(
  Player_SK            INTEGER NULL ,
	Player_firstname     VARCHAR2(20) NULL ,
  Player_surname       VARCHAR2(20) NULL,
  PRIMARY KEY(Player_sk)
);

insert into PL_DIM_PLAYER select PLAYER_SK,PLAYER_FIRSTNAME,PLAYER_SURNAME from PL_PLAYER_STAGE pl where
NOT EXISTS (SELECT * FROM PL_DIM_PLAYER WHERE pl.PLAYER_SK= PL_DIM_PLAYER.PLAYER_SK);

CREATE TABLE PL_DIM_Time
(
  time_sk              INTEGER NULL ,
  m_date               DATE NULL,
  m_year               INTEGER NULL,
  m_month              INTEGER NULL,
  m_day                INTEGER NULL,
  PRIMARY KEY (time_sk)
); 

insert into PL_DIM_TIME select TIME_SK,M_DATE,M_YEAR,M_MONTH,M_DAY from PL_TIME_STAGE tm where
NOT EXISTS (SELECT * FROM PL_DIM_TIME WHERE tm.TIME_SK= PL_DIM_TIME.TIME_SK);

create table PL_DIM_Fact
( 
  time_sk           INTEGER NOT NULL,
  player_sk         INTEGER NOT NULL,
  team_sk           INTEGER NOT NULL,
  opponent_sk       INTEGER NOT NULL,
  stadium_sk        INTEGER NOT NULL,
  min_played        INTEGER NULL,
  goals             INTEGER NULL,
  shot_on           INTEGER NULL,
  shot_off          INTEGER NULL,
  penalty           INTEGER NULL,
  pass_complete     INTEGER NULL,
  pass_incomplete   INTEGER NULL,
  PRIMARY KEY (time_sk,player_sk,team_sk,opponent_sk,stadium_sk),
  FOREIGN KEY (time_sk) REFERENCES PL_DIM_TIME(time_sk),
  FOREIGN KEY (player_sk) REFERENCES PL_DIM_PLAYER(player_sk),
  FOREIGN KEY (team_sk) REFERENCES PL_DIM_TEAM(team_sk),
  FOREIGN KEY (opponent_sk) REFERENCES PL_DIM_TEAM(team_sk),
  FOREIGN KEY (stadium_sk) REFERENCES PL_DIM_STADIUM(stadium_sk)
);

insert into PL_DIM_FACT select time_SK,player_sk,team_sk,opponent_sk,stadium_sk,min_played,goals,shot_on,shot_off,penalty,pass_complete,pass_incomplete 
from PL_FACT_STAGE ft 
where NOT EXISTS (SELECT * FROM PL_DIM_FACT WHERE ft.time_SK= PL_DIM_FACT.TIME_SK AND ft.PLAYER_SK=PL_DIM_FACT.PLAYER_SK);



DROP TABLE PL_ETL2;

--CREATE TABLE AND IMPORT DATE FROM ETL2.csv INTO THE TABLE
CREATE TABLE PL_ETL2(
  M_DATE	DATE,
  PLAYER_ID	INTEGER,
  PLAYER_SURNAME	VARCHAR2(20 ),
  PLAYER_FIRSTNAME	VARCHAR2(20),
  TEAM	VARCHAR2(50),
  TEAM_ID	INTEGER,
  OPPOSITION	VARCHAR2(50),
  OPPOSITION_ID	INTEGER,
  MINS_PLAYED	INTEGER,
  GOALS	INTEGER,
  SHOTS_ON_TARGET	INTEGER,
  SHOTS_OFF_TARGET	INTEGER,
  PENALTY_GOALS	INTEGER,
  TOTAL_SUCCESSFUL_PASSES	INTEGER,
  TOTAL_UNSUCCESSFUL_PASSES	INTEGER

);
--PART D
--ADD DATA FROM ETL TABLE INTO STAGE TABLES THEN ADD THEM TO DIM TABLES
SELECT * FROM PL_PLAYER_STAGE;
INSERT INTO PL_PLAYER_STAGE (PLAYER_ID,PLAYER_FIRSTNAME,PLAYER_SURNAME,TEAM_ID)
SELECT DISTINCT PLAYER_ID, PLAYER_FIRSTNAME, PLAYER_SURNAME, TEAM_ID FROM PL_ETL2 et WHERE
NOT EXISTS ( SELECT * FROM PL_PLAYER_STAGE ps WHERE ps.PLAYER_ID=et.PLAYER_ID);


INSERT INTO PL_DIM_PLAYER(PLAYER_FIRSTNAME,PLAYER_SURNAME)
SELECT DISTINCT PLAYER_FIRSTNAME, PLAYER_SURNAME FROM PL_PLAYER_STAGE ps WHERE
NOT EXISTS(SELECT * FROM PL_DIM_PLAYER dp where dp.player_sk=ps.player_sk);

INSERT INTO PL_TIME_STAGE (M_DATE,M_YEAR,M_MONTH,M_DAY)
SELECT DISTINCT M_DATE,cast(to_char(m_date,'YYYY') as integer), cast(to_char(m_date,'MM') as integer), cast(to_char(m_date,'DD')as integer) FROM PL_ETL2 et WHERE
NOT EXISTS ( SELECT * FROM PL_TIME_STAGE ts WHERE ts.M_DATE=et.M_DATE);
--no rows were inserted into the time stage so no need to add new rows to dim table

insert into PL_FACT_STAGE (TEAM_AID,TEAM_BID,M_DATE,PLAYER_ID,MIN_PLAYED,GOALS,SHOT_ON,SHOT_OFF,PENALTY,PASS_COMPLETE,PASS_INCOMPLETE) 
SELECT DISTINCT TEAM_ID,OPPOSITION_ID,M_DATE,PLAYER_ID,MINS_PLAYED,GOALS,SHOTS_ON_TARGET,SHOTS_OFF_TARGET,PENALTY_GOALS,TOTAL_SUCCESSFUL_PASSES,TOTAL_UNSUCCESSFUL_PASSES
FROM PL_ETL2 et WHERE
NOT EXISTS ( SELECT * FROM PL_FACT_STAGE fs WHERE fs.M_DATE=et.M_DATE AND fs.PLAYER_ID=et.PLAYER_ID);
EXECUTE update_fact_stage;

insert into PL_DIM_FACT 
SELECT DISTINCT time_SK,player_sk,team_sk,opponent_sk,stadium_sk,min_played,goals,shot_on,shot_off,penalty,pass_complete,pass_incomplete 
from PL_FACT_STAGE ft WHERE
NOT EXISTS (SELECT * FROM PL_DIM_FACT WHERE ft.time_SK= PL_DIM_FACT.TIME_SK AND ft.PLAYER_SK=PL_DIM_FACT.PLAYER_SK);


--PART E
-- Query which shows which players have the best conversion rate from shots to goals
SELECT dp.PLAYER_FIRSTNAME, dp.PLAYER_SURNAME,sum(goals) as goals_scored, cast(sum(goals)*100/(sum(shot_on)+sum(shot_off)) as decimal(19,2)) as Conversion_Rate FROM PL_DIM_PLAYER dp 
join PL_dim_fact df on dp.PLAYER_SK=df.PLAYER_SK where shot_on+shot_off>0
group by df.PLAYER_SK, dp.PLAYER_FIRSTNAME, dp.PLAYER_SURNAME
ORDER by CONVERSION_RATE desc;

-- Query to display teams in order of the best pass accuracy per player per game
SELECT dt.TEAM_NAME,
cast((sum(PASS_COMPLETE*100/(PASS_COMPLETE+PASS_INCOMPLETE))/count(*))as decimal(19,2)) as AVG_PASS_pPLAYER_pGAME FROM PL_DIM_TEAM dt join PL_dim_fact df on dt.TEAM_SK=df.TEAM_SK where (PASS_COMPLETE+PASS_INCOMPLETE)>0 group by TEAM_NAME order by AVG_PASS_pPLAYER_pGAME desc;


