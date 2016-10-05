ALTER SESSION SET CURRENT_SCHEMA = DT2283GROUP_V;
create table log_table(op char(3), tabnam varchar2(40),key_value varchar2(40),logdate date not null, loguser varchar2(40) not null);
