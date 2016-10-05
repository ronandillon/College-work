alter session set current_schema  =DT2283GROUP_V;
DECLARE
  TOURN_TYPE tournament.tourn_type%type;
  NOT_SINGLES EXCEPTION;

BEGIN 

 INSERT INTO tournament
    (TOURN_NAME,MATCH_TYPE,TOURN_TYPE,NUM_PLAYERS,NUM_ROUNDS)
    VALUES ('Scupty  Classic', 'Womens','Doubles',8,5);

if TOURN_TYPE = 'Singles' THEN
  UPDATE tournament
    SET NUM_ROUNDS = 6
    WHERE MATCH_TYPE = 'Mens';
  UPDATE tournament
    SET NUM_ROUNDS = 2
    WHERE MATCH_TYPE = 'Womens';
else
  RAISE NOT_SINGLES;
END IF;

EXCEPTION 
WHEN NOT_SINGLES THEN
  RAISE_APPLICATION_ERROR(-20001,'This tournament is not a singles tournament');
  

COMMIT;
END;