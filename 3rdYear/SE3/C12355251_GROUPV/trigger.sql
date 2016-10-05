ALTER SESSION SET CURRENT_SCHEMA = DT2283GROUP_V;
trigger change_set after update on tournament
BEGIN
  INSERT INTO log_table (op,tablename,logdate,loguser) 
  VALUES('UPD','tournament',sysdate,to_char(user));

END;