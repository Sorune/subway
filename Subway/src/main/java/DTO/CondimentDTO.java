package DTO;

public class CondimentDTO {
	int menuId;
	String conName;
	int conPrice;
	int conCount;// 재고
	String conKind;//종류
	
	public CondimentDTO() {
		super();
	}

	public CondimentDTO(int menuId, String conName, int conPrice, int conCount, String conKind) {
		super();
		this.menuId = menuId;
		this.conName = conName;
		this.conPrice = conPrice;
		this.conCount = conCount;
		this.conKind = conKind;
	}

	public int getMenuId() {
		return menuId;
	}

	public String getConName() {
		return conName;
	}

	public int getConPrice() {
		return conPrice;
	}

	public int getConCount() {
		return conCount;
	}

	public String getConKind() {
		return conKind;
	}

	public void setMenuId(int menuId) {
		this.menuId = menuId;
	}

	public void setConName(String conName) {
		this.conName = conName;
	}

	public void setConPrice(int conPrice) {
		this.conPrice = conPrice;
	}

	public void setConCount(int conCount) {
		this.conCount = conCount;
	}

	public void setConKind(String conKind) {
		this.conKind = conKind;
	}

	
	
	
}
