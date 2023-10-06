package com.rays.pro4.Bean;

/**
 * Marksheet JavaBean encapsulates Marksheet attributes.
 * 
 * @author Vikash Yadav
 *
 */
public class MarksheetBean extends BaseBean{

	private String rollNo;
	private long studentld;
	private String name;
	private Integer physics;
	private Integer chemistry;
	private Integer maths;
	public String getRollNo() {
		return rollNo;
	}
	public void setRollNo(String rollNo) {
		this.rollNo = rollNo;
	}
	public long getStudentld() {
		return studentld;
	}
	public void setStudentld(long studentld) {
		this.studentld = studentld;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public Integer getPhysics() {
		return physics;
	}
	public void setPhysics(Integer physics) {
		this.physics = physics;
	}
	public Integer getChemistry() {
		return chemistry;
	}
	public void setChemistry(Integer chemistry) {
		this.chemistry = chemistry;
	}
	public Integer getMaths() {
		return maths;
	}
	public void setMaths(Integer maths) {
		this.maths = maths;
	}
	@Override
	public String getkey() {
		// TODO Auto-generated method stub
		return id+"";
	}
	@Override
	public String getValue() {
		// TODO Auto-generated method stub
		return rollNo;
	}
	
	
}
