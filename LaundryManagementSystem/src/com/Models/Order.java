package com.Models;

/**
 * This is the Order model class
 * 
 * @author Oshadi
 * 
 */
public class Order {
	
	private String RecieptNo;

	private String Weight;

	private String NIC;
	
	private String Rate;

	
	/**
	 * @return the RecieptNo
	 */
	public String getRecieptNo() {
		return RecieptNo;
	}
	
	/**
	 * @param RecieptNo the RecieptNo to set
	 */
	public void setRecieptNo(String receiptno) {
		RecieptNo = receiptno;
	}	
	
	/**
	 * @return the Weight
	 */
	public String getWeight() {
		return Weight;
	}

	/**
	 * @param Weight the Weight to set
	 */
	public void setWeight(String weight) {
		Weight= weight;
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
	 * @return the Rate
	 */
	public String getRate() {
		return Rate;
	}

	/**
	 * @param Rate the Rate to set
	 */
	public void setRate(String rate) {
		Rate= rate;
	}

}
