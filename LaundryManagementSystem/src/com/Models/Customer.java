package com.Models;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * This is the Customer model class
 * 
 * @author Maneesha
 * 
 */
public class Customer {
		
		private String FullName;

		private String Gender;

		private String Address;
		
		private String NIC;
		
		private String Contact;

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
		 * @return the Contact
		 */
		public String getContact() {
			return Contact;
		}

		/**
		 * @param Contact the Contact to set
		 */
		public void setContact(String contact) {
			Contact=contact;
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
