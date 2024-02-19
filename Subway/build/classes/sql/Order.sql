-- 테이블 생성 (주문)
create table menu_order(
menu_name nvarchar2(100) not null, -- 메뉴이름
menu_qty number not null,          -- 주문 수량
menu_topping number,            -- 토핑 추가
menu_total_price number,         -- 결재 금액    
user_id   varchar2(100)            -- 결제자 id / fk 네임작명 / fk 참조 및 연결              
);

alter table menu_order add constraint order_userid_fk foreign key (user_id) references member(user_id)  ;    

-- 테이블 삭제 (주문)
drop table menu_order;
