package dto;

public class CartDTO {

	private String order_num;		// 주문번호(yyyyMMdd+자동생성)
	private int menu_order;			// fk 
	private String order_kind;		// 배달, 포장 여부
	private String pay_kind;		// 결제 방식
	// order 테이블 참조
	private String menu_name;		
	private int menu_qty;
	private String menu_topping;
	private int menu_total_price;
	// member 테이블 참조	
	private String user_id;
	private String user_name;
	private String user_add;
	private String user_phone;
	
	
	
	public CartDTO() {}



	public String getOrder_num() {
		return order_num;
	}



	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}



	public int getMenu_order() {
		return menu_order;
	}



	public void setMenu_order(int menu_order) {
		this.menu_order = menu_order;
	}



	public String getOrder_kind() {
		return order_kind;
	}



	public void setOrder_kind(String order_kind) {
		this.order_kind = order_kind;
	}



	public String getPay_kind() {
		return pay_kind;
	}



	public void setPay_kind(String pay_kind) {
		this.pay_kind = pay_kind;
	}



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



	public String getMenu_topping() {
		return menu_topping;
	}



	public void setMenu_topping(String menu_topping) {
		this.menu_topping = menu_topping;
	}



	public int getMenu_total_price() {
		return menu_total_price;
	}



	public void setMenu_total_price(int menu_total_price) {
		this.menu_total_price = menu_total_price;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}



	public String getUser_name() {
		return user_name;
	}



	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}



	public String getUser_add() {
		return user_add;
	}



	public void setUser_add(String user_addr) {
		this.user_add = user_addr;
	}



	public String getUser_phone() {
		return user_phone;
	}



	public void setUser_phone(String user_phone) {
		this.user_phone = user_phone;
	}



	
	
}
