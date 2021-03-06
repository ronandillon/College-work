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
--USING INSERT.sql INSERT INTO PL_STADIUMS AND TEAMS TABLES


--INSERT INTO PL_MATCHES, PL_PLAYERS AND PL_PLAYERS_STATS USING PREMIERTABLE
INSERT INTO PL_MATCHES (Team_A, Team_B, Match_date)SELECT DISTINCT pl.TEAM_ID, pl.OPPOSITION_ID, pl.M_DATE FROM PREMIERTABLE pl;


INSERT INTO PL_PLAYERS (PLAYER_ID, PLAYER_FIRSTNAME, PLAYER_SURNAME, TEAM_ID)
SELECT DISTINCT pl.Player_ID, pl.Player_Firstname, pl.Player_Surname, pl.Team_Id
FROM PREMIERTABLE pl;

INSERT INTO PL_PLAYERS_STATS 
SELECT DISTINCT p2.TEAM_ID, p2.OPPOSITION_ID, p2.M_DATE, p2.PLAYER_ID, p2.MINS_PLAYED,
p2.GOALS, p2.SHOTS_ON_TARGET, p2.SHOTS_OFF_TARGET, p2.PENALTY_GOALS, 
p2.TOTAL_SUCCESSFUL_PASSES, p2.TOTAL_UNSUCCESSFUL_PASSES
FROM PREMIERTABLE p2;








