package com.Calculations;

public class CalculateSalary implements Calculate {
	
	double hours;
	double rate;
	double bsalary;
	
	public CalculateSalary(double hours,double rate,double bsalary) {
		
		this.hours=hours;
		this.bsalary=bsalary;
		this.rate=rate;
		
	}
	
	public Double Calculation() {
		
		if(bsalary>0) {
		double salary=(hours*rate)+bsalary;
		System.out.println("Salary Calculated");
		return salary;
		}else {
			double salary=0;
			return salary;
		}
	}
}
