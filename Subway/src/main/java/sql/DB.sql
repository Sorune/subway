create user subway identified by subway;

grant dba, connect to subway;

revoke dba, connect from subway;

revoke select on condiment from subway;