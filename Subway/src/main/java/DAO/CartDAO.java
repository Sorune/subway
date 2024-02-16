package DAO;

import util.JDBConnect;

public class CartDAO extends JDBConnect{

	
	public void OderLists(String user_id) {
		
		String sql = "select * from CART, MENU_ORDER where cart.user_id = menu_order.user_id";
		
		//pstmt = con.prepareStatement(sql); 
		
		
	}
}
