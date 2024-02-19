create table member (
user_id varchar2(20) primary key,
user_pass varchar2(20) not null,
user_name nvarchar2(15) not null,
user_phone varchar2(20) not null,
user_add nvarchar2(100) not null);

create sequence mem_seq increment by 1 start with 1 minvalue 1 nomaxvalue nocycle nocache;

drop sequence mem_seq;

insert into member(user_id, user_pass, user_name, user_phone, user_add) values ('bno','master','서준','01012345678','front-master 별');
insert into member(user_id, user_pass, user_name, user_phone, user_add) values ('jiwoong','master','지웅','01012345678','떠오르는 신성');
insert into member(user_id, user_pass, user_name, user_phone, user_add) values ('taehoon','master','태훈','01012345678','자바 정복자별');
insert into member(user_id, user_pass, user_name, user_phone, user_add) values ('taeuk','jjuri','태욱','01012345678','준비된 노예별');

select * from MEMBER;