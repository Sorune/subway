-- 테이블 생성
create table menu_order(
menu_name nvarchar2(100) not null,      -- 상품명 nn
menu_qty number not null,               -- 수량 nn
menu_total_price number not null,       -- 총합 금액 nn
order_userid varchar2(100),             -- 주문인 아이디 / fk
order_date date default sysdate			-- 주문시간 default sysdate
);
-- 테이블 삭제
drop table menu_order;
-- 테이블 조회
select * from menu_order;
-- 테이블 더미 값 입력
insert into menu_order(menu_name, menu_qty, menu_total_price, order_userid, order_date) values('호밀버거', 1, 10000, 'seojun123', sysdate);