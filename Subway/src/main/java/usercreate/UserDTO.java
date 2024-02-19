package usercreate;

public class UserDTO {
	// User 변수
	private String User_Id;
	private String User_Pass;
	private String User_Name;
	private String User_Phone;
	private String User_Add;
	
	// 게터 / 세터
	public String getUser_Id() {
		return User_Id;
	}
	public String getUser_Pass() {
		return User_Pass;
	}
	public String getUser_Name() {
		return User_Name;
	}
	public String getUser_Phone() {
		return User_Phone;
	}
	public String getUser_Add() {
		return User_Add;
	}
	public void setUser_Id(String user_Id) {
		User_Id = user_Id;
	}
	public void setUser_Pass(String user_Pass) {
		User_Pass = user_Pass;
	}
	public void setUser_Name(String user_Name) {
		User_Name = user_Name;
	}
	public void setUser_Phone(String user_Phone) {
		User_Phone = user_Phone;
	}
	public void setUser_Add(String user_Add) {
		User_Add = user_Add;
	}

}
