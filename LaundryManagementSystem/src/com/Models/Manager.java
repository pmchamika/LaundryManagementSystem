package com.Models;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * This is the Manager model class
 * 
 * @author Chamika Pathiraja
 * 
 */
public class Manager {
	private String FullName;
	
	private String NIC;

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
	 * @return the Password
	 */
	public String getPassword() {
		return Password;
	}

	/**
	 * @param Password the Password to set
	 */
	public void setPassword(String password) {
					
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
