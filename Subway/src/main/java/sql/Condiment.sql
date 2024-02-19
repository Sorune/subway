create table condiment(--재고
   menu_id number(10) primary key,
   con_name nvarchar2(16) not null,
   con_price number(10) not null,
   con_count number not null, --재고 수량
   con_kind nvarchar2(10)
);

drop table condiment;

create sequence con_seq increment by 1 start with 1 minvalue 1 nomaxvalue nocycle nocache;
-- 빵
insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '오트번','1000',10,'빵');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '호밀번','1200',10,'빵');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '버터번','1300',10,'빵');

-- 재료
insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '양상추','300',30,'재료');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '피클','100',30,'재료');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '피망','200',30,'재료');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '적양파','200',30,'재료');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '올리브','100',30,'재료');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '오이','150',30,'재료');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '양파','150',30,'재료');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '파프리카','250',30,'재료');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '양송이','200',30,'재료');

-- 소스
insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '마요네스','500',30,'소스');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '스리라차','500',30,'소스');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '칠리','500',30,'소스');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '오리엔탈','500',30,'소스');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '사우전드','500',30,'소스');


-- 사이드

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '프렌치 프라이','1500',30,'사이드');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '너겟','2000',30,'사이드');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '쿠키','800',30,'사이드');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '초코쿠키','1000',30,'사이드');

insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '웨지감자','1500',30,'사이드');

--음료
insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '콜라','1500',30,'음료');
insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '사이다','1500',30,'음료');
insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '제로콜라','1500',30,'음료');
insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '아메리카노','1500',30,'음료');
insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '바닐라라떼','1800',30,'음료');
insert into condiment(menu_id, con_name,con_price,con_count,con_kind) values (con_seq.NEXTVAL, '오렌지주스','2000',30,'음료');
select * from CONDIMENT;