package com.Calculations;

public class CalculatePayment implements Calculate {

	
	double rate;
	double weight;
	
	public CalculatePayment(double rate,double weight) {
		
		this.weight=weight;
		this.rate=rate;
		
	}
	
	public Double Calculation() {
		
		if((weight>0)&&(rate>0)) {
			double payment=weight*rate;
			System.out.println("Payment Calculated");
			return payment;
		}else {
			double payment=0;
			System.out.println("Payment Calculated");
			return payment;
			
		}
	}
}
