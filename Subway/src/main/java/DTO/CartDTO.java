package DTO;

public class CartDTO {

	private String order_num;		// 주문번호(yyyyMMdd+자동생성)
	private String user_id;
	private String order_kind;		// 배달, 포장 여부
	private String pay_kind;		// 결제 방식
	
	
	
	public CartDTO() {}



	public String getOrder_num() {
		return order_num;
	}



	public void setOrder_num(String order_num) {
		this.order_num = order_num;
	}



	public String getUser_id() {
		return user_id;
	}



	public void setUser_id(String user_id) {
		this.user_id = user_id;
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



	

	
	
}
