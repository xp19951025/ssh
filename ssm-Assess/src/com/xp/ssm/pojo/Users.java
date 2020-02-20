package com.xp.ssm.pojo;

public class Users {

	private Integer USER_ID;
	private String USER_NAME;
	private String USER_SEX;
	private Integer USER_STATE;
	private Integer DEP_ID;
	private Department department;
	
	public Users() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Integer getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(Integer USER_ID) {
		this.USER_ID = USER_ID;
	}

	public Department getDepartment() {
		return department;
	}

	public void setDepartment(Department department) {
		this.department = department;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String USER_NAME) {
		this.USER_NAME = USER_NAME;
	}

	public String getUSER_SEX() {
		return USER_SEX;
	}

	public void setUSER_SEX(String USER_SEX) {
		this.USER_SEX = USER_SEX;
	}

	public Integer getUSER_STATE() {
		return USER_STATE;
	}

	public void setUSER_STATE(Integer USER_STATE) {
		this.USER_STATE = USER_STATE;
	}

	public Integer getDEP_ID() {
		return DEP_ID;
	}

	public void setDEP_ID(Integer DEP_ID) {
		this.DEP_ID = DEP_ID;
	}


	@Override
	public String toString() {
		return "Users [USER_ID=" + USER_ID + ", USER_NAME=" + USER_NAME + ", USER_SEX=" + USER_SEX + ", USER_STATE="
				+ USER_STATE + ", DEP_ID=" + DEP_ID + ", department=" + department + "]";
	}

	

	
}
