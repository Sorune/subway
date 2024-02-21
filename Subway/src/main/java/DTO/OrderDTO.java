package DTO;

import java.sql.Date;

public class OrderDTO {
	// 필드
	private String menu_name;
	private int menu_qty;
	private int menu_total_price;
	private String order_userid;
	private Date order_date;
	// 생성자
	public OrderDTO() {}
	// 메서드
	public String getMenu_name() {
		return menu_name;
	}
	public void setMenu_name(String menu_name) {
		this.menu_name = menu_name;
	}
	public int getMenu_qty() {
		return menu_qty;
	}
	public void setMenu_qty(int menu_qty) {
		this.menu_qty = menu_qty;
	}
	public int getMenu_total_price() {
		return menu_total_price;
	}
	public void setMenu_total_price(int menu_total_price) {
		this.menu_total_price = menu_total_price;
	}
	public String getOrder_userid() {
		return order_userid;
	}
	public void setOrder_userid(String order_userid) {
		this.order_userid = order_userid;
	}
	public Date getOrder_date() {
		return order_date;
	}
	public void setOrder_date(Date order_date) {
		this.order_date = order_date;
	};
}
