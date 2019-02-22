package com.Models;

import java.security.*;

/**
 * This is the Employee model class
 * 
 * @author Chamika Prabath
 * 
 */
public class Employee {
	
	private String FullName;

	private String Gender;

	private String NIC;

	private String Address;

	private String Designation;
	
	private String DOB;
	
	private String BasicSalary;

	private String Password;
	
	/**
	 * @return the FullName
	 */
	public String getFullName() {
		return FullName;
	}

	/**
	 * @param FullName the FullName to set
	 */
	public void setFullName(String fullname) {
		FullName = fullname;
	}	
	
	/**
	 * @return the Gender
	 */
	public String getGender() {
		return Gender;
	}

	/**
	 * @param Gender the Gender to set
	 */
	public void setGender(String gender) {
		Gender= gender;
	}
	
	/**
	 * @return the NIC
	 */
	public String getNIC() {
		return NIC;
	}

	/**
	 * @param NIC the NIC to set
	 */
	public void setNIC(String nic) {
		NIC= nic;
	}
	
	/**
	 * @return the Address
	 */
	public String getAddress() {
		return Address;
	}

	/**
	 * @param Address the Address to set
	 */
	public void setAddress(String address) {
		Address=address;
	}
	
	/**
	 * @return the Designation
	 */
	public String getDesignation() {
		return Designation;
	}

	/**
	 * @param Designation the Designation to set
	 */
	public void setDesignation(String designation) {
		Designation=designation;
	}
	
	/**
	 * @return the DOB
	 */
	public String getDOB() {
		return DOB;
	}

	/**
	 * @param DOB the DOB to set
	 */
	public void setDOB(String dob) {
		DOB=dob;
	}
	
	/**
	 * @return the BasicSalary
	 */
	public String getBasicSalary() {
		return BasicSalary;
	}

	/**
	 * @param BasicSalary the BasicSalary to set
	 */
	public void setBasicSalary(String basicsalary) {
		BasicSalary=basicsalary;
	}
	
	/**
	 * @return the Password
	 */
	public String getPassword() {
		return Password;
	}

	/**
	 * @param Password the Password to set
	 */
	public void setPassword(String password){
		String Pass=password;
		MessageDigest md;
		try {
			md = MessageDigest.getInstance("MD5");
		
		md.update(Pass.getBytes()); 
		byte[] b = md.digest();
		StringBuffer sb=new StringBuffer();
		for(byte b1:b) {
			sb.append(Integer.toHexString(b1 & 0xff).toString());
		}
		
		Password=sb.toString();
		} catch (NoSuchAlgorithmException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
	
}
