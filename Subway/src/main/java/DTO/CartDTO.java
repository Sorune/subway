package DTO;

public class CartDTO {

	private String order_num;
	private String order_kind;
	private String pay_kind;
	// order 테이블 참조
	private String menu_name;
	private int menu_qty;
	private String menu_topping;
	private int menu_total_price;
	// member 테이블 참조	
	private String user_id;
	private String user_name;
	private String user_addr;
	private String user_phone;
	
	
	
	public CartDTO() {}



	public String getOrder_num() {return order_num;}
	public String getOrder_kind() {	return order_kind;}
	public String getPay_kind() {return pay_kind;}
	public String getMenu_name() {	return menu_name;}
	public int getMenu_qty() {	return menu_qty;}
	public String getMenu_topping() {	return menu_topping;}
	public int getMenu_total_price() {	return menu_total_price;}
	public String getUser_id() {	return user_id;}
	public String getUser_name() {	return user_name;}
	public String getUser_addr() {	return user_addr;}
	public String getUser_phone() {	return user_phone;}
	public void setOrder_num(String order_num) {this.order_num = order_num;}
	public void setOrder_kind(String order_kind) {this.order_kind = order_kind;}
	public void setPay_kind(String pay_kind) {this.pay_kind = pay_kind;}
	public void setMenu_name(String menu_name) {this.menu_name = menu_name;}
	public void setMenu_qty(int menu_qty) {this.menu_qty = menu_qty;}
	public void setMenu_topping(String menu_topping) {this.menu_topping = menu_topping;}
	public void setMenu_total_price(int menu_total_price) {this.menu_total_price = menu_total_price;}
	public void setUser_id(String user_id) {this.user_id = user_id;}
	public void setUser_name(String user_name) {this.user_name = user_name;}
	public void setUser_addr(String user_addr) {this.user_addr = user_addr;}
	public void setUser_phone(String user_phone) {this.user_phone = user_phone;}
	
	
	
	

	
	
	
	

}
