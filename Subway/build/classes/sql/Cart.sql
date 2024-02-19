alter table cart add constraint cart_userid_fk foreign key(user_id) references member(user_id);

alter table cart add constraint cart_menu_fk foreign key(menu_order) references menu_order(menu_order);

<<<<<<< HEAD
=======
--------------------------------- v1
>>>>>>> parent of ab1a8af (Login DB check)

create table cart(
order_num 	varchar2(15) constraint cart_onum_pk primary key,
user_id		varchar2(20), --fk
order_kind	nvarchar2(30) not null, -- 배달,포장 여부
pay_kind	nvarchar2(15) not null --결제 방식
);

<<<<<<< HEAD
=======

>>>>>>> parent of ab1a8af (Login DB check)
alter table cart add constraint cart_menuord_fk foreign key (menu_order) references menu_order(menu_order);

drop table cart;

select * from cart;

select * from menu_order;

select * from member;

--카트 내용 불러오기
select C.order_num, M.user_id, M.user_name, M.user_addr C.total_price, C.order_kind, C.pay_kind 
from cart C, Member M where M.user_id = ?;

-- 필요한 Class
--cart dto,dao, paymentProcess
--cart read() : 장바구니 목록 보기 
--payment() : 결제로 넘어갔을시 카드,현금,기프티콘 및 배달,포장,매장식사 여부
--delete() : 장바구니 비우기

insert into menu_order values(order_seq.nextval,'메뉴이름1', 10, 10, 10000, 'bno', sysdate);


--sql문 테스트용 코드
select * from(select * from menu_order where user_id = bno) O, (select * from member where user_id= bno) M where O.user_id = M.user_id;


select * from MEMBER, MENU_ORDER where member.user_id = menu_order.user_id; 

select * from CART, (select * from MENU_ORDER where member.user_id = menu_order.user_id) where user_id = ?; 


