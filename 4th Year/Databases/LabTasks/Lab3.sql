DROP TABLE Lab3Teams;
CREATE TABLE Lab3Teams(
  TeamID integer,
  TeamName varchar(20),
  Country varchar(10),
  Primary Key(TeamID)
);

DROP TABLE Lab3Matches;
CREATE TABLE Lab3Matches(
  MatchID integer,
  TeamA_ID integer,
  TeamB_ID integer,
  Goal_A integer,
  Goal_B integer,
  Competition varchar(20),
  Primary Key(MatchID),
  Foreign Key(TeamA_ID) REFERENCES Lab3Teams(TeamID),
  Foreign Key(TeamB_ID) REFERENCES Lab3Teams(TeamID)
);
  

DROP TABLE TEAMLOGTABLE;
CREATE TABLE teamlogTable(
  message varchar(100),
  logdate DATE
);


Create Or Replace Trigger logTrig
After Insert on Lab3Teams
FOR EACH ROW
Begin
	Insert into TEAMLOGTABLE values('insert done',SYSDATE);
END;


 
CREATE OR REPLACE TRIGGER maxhomematches
BEFORE INSERT OR UPDATE ON lab3MATCHES
FOR EACH ROW
DECLARE
  how_many NUMBER;
  team_name VARCHAR(50);
  BEGIN
  SELECT COUNT(*) INTO how_many FROM LAB3MATCHES
  WHERE TeamA_ID = :new.TeamA_ID;
        
  SELECT teamName INTO team_name FROM LAB3TEAMS
  WHERE TeamID = :new.TeamA_ID;
        
  IF how_many > 3 THEN
       raise_application_error(-20001, 'Too many home games for ' || team_name || '.');
  END IF;
        
END;



CREATE OR REPLACE TRIGGER correctleague
BEFORE INSERT OR UPDATE ON LAB3MATCHES
FOR EACH ROW
DECLARE
    V_teamA_Country VARCHAR(50);
    V_teamB_Country VARCHAR(50);
    BEGIN
    IF :new.Competition = 'La Liga' OR :new.Competition = 'Premier League' THEN
        
      SELECT Country INTO V_teamA_Country FROM LAB3TEAMS
      WHERE teamID = :new.teamA_ID;
              
      SELECT Country INTO V_teamB_Country FROM LAB3TEAMS
      WHERE teamID = :new.teamB_ID;
              
      IF V_teamA_Country <> V_teamB_Country THEN
         Raise_application_error(-20000, 'Teams are not from the same country');
      END IF;
            
    END IF;
        
END;


alter table Lab3matches
 add constraint checkCompetition check (Competition IN ('Champions League','Europa League','Premier League', 'La Liga'));

 
alter table lab3teams
  add constraint checkCountry CHECK (Country in ('England','Spain'));

  
alter table lab3matches
 add constraint checkTeamAgoals CHECK (Goal_A >= 0);
 
alter table lab3matches
 add constraint checkTeamBgoals CHECK (Goal_B >= 0);
