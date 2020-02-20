package com.xp.ssm.pojo;

public class Department {

	private Integer DEP_ID;
	private String DEP_NAME;
	private String DEP_DESC;
	private Integer DEP_STATE;
		

	public Department() {
		super();
		// TODO Auto-generated constructor stub
	}


	public Department(Integer DEP_ID, String DEP_NAME, String DEP_DESC, Integer DEP_STATE) {
		super();
		this.DEP_ID = DEP_ID;
		this.DEP_NAME = DEP_NAME;
		this.DEP_DESC = DEP_DESC;
		this.DEP_STATE = DEP_STATE;
	}


	public Integer getDEP_ID() {
		return DEP_ID;
	}


	public void setDEP_ID(Integer DEP_ID) {
		this.DEP_ID = DEP_ID;
	}


	public String getDEP_NAME() {
		return DEP_NAME;
	}


	public void setDEP_NAME(String DEP_NAME) {
		this.DEP_NAME = DEP_NAME;
	}


	public String getDEP_DESC() {
		return DEP_DESC;
	}


	public void setDEP_DESC(String DEP_DESC) {
		this.DEP_DESC = DEP_DESC;
	}


	public Integer getDEP_STATE() {
		return DEP_STATE;
	}


	public void setDEP_STATE(Integer DEP_STATE) {
		this.DEP_STATE = DEP_STATE;
	}


	@Override
	public String toString() {
		return "Department [DEP_ID=" + DEP_ID + ", DEP_NAME=" + DEP_NAME + ", DEP_DESC=" + DEP_DESC + ", DEP_STATE="
				+ DEP_STATE + "]";
	}

	
}
