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
