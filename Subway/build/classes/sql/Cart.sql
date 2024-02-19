create table cart(
order_num    number constraint cart_onum_pk primary key,
user_id      varchar2(100),
user_name   nvarchar2(5) not null,
user_addr   nvarchar2(100) not null,
menu_total_price number not null,
order_kind   nvarchar2(30) not null,
pay_kind   nvarchar2(15) not null,
);

alter table cart add constraint cart_userid_fk foreign key(user_id) references(member)
