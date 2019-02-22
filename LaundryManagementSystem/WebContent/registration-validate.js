function formValidation(){
	var fname=document.forms["myForms"]["fullname"].value;
	var gen=document.forms["myForms"]["gender"].value;
	var add=document.forms["myForms"]["address"].value;
	var nic=document.forms["myForms"]["nic"].value;
	var cont=document.forms["myForms"]["contact"].value;
	var pw=document.forms["myForms"]["password"].value;
	var cpw=document.forms["myForms"]["cpassword"].value;
						
						if(fnameVal(fname))
							if(genVal(gen))
								if(addVal(add))
									if(nicVal(nic))
									    if(contVal(cont))
											if(passVal(pw))
												if(cpassVal(pw,cpw))
																					
															return true;
														else
															return false;
													else
														return false;
												else
													return false;
											else
												return false;
										else
											return false;
									else
										return false;
								else
									return false;
							
			
}

function isEmpty(Value, field)
{
		if(Value=="" || Value== null)
		{
			alert("Should fill " +field +  " field");
			return true;
		}
		else
		{
			return false;
		}
}
function fnameVal(Value)
{
		var eq= /^[a-zA-Z. ]+$/;
		if(!isEmpty(Value,"Full Name"))
		{
			if(Value.match(eq))
			{
				return true;
			}
			else
			{
				alert("Enter only text for Name");
				return false;
			}
		}
		else
		{
			return false;
		}
}

function genVal(Value)
{
		if(Value=="Choose your Status")
		{
			alert("Choose your Status");
			return false;
		}
		else
		{
			return true;
		}
}

function addVal(Value)
{
		var eq= /^[0-9a-zA-Z ]+$/;
		if(!isEmpty(Value, "Address"))
		{
			if(Value.match(eq))
			{
				return true;
			}
			else
			{
				alert("Invalid Postal Address");
				return false;
			}
		}
		else
		{
			return false;
		}
}

function nicVal(Value)
{
		var string = Value;
		var letters = string.substring(9);
		var numbers = string.substring(0,9);
		var eq= /^[0-9]+$/;
		if(!isEmpty(Value, "NIC"))
		{
			if(letters=="V")
			{
					if(numbers.match(eq))
					{
						if(numbers.length == 9)
						{
							return true;
						}
						else
						{
							alert("NIC number should consist of 9 digits");
							return false;
						}
					}
					else
					{
						alert("Invalid NIC number");
						return false;
					}
			}	
			else
			{
				alert("NIC number should end with (V) and consist of 9 digits");
				return false;
			}
		}
		else
		{
			return false;
		}
}

function contVal(Value)
{
		if(!isEmpty(Value,"contact number"))
		{
			var eq= /^[0-9]+$/;
			if(Value.match(eq))
			{
				return true;
			}
			else
			{
				alert("Enter a valid contact number");
				return false;
			}
		}
		else
		{
			return false;
		}
}

function passVal(Value)   
{   
		var pw= new RegExp("^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#\$%\^&\*])(?=.{8,})");

		if(!isEmpty(Value,"Password"))
		{
			if(Value.match(pw))   
			{   
				 
				return true;  
			}  
			else  
			{   
				alert("Password should contain at least 8 characters long and must be a combination of uppercase characters, lowercase characters, numeric characters and a special character")  
				return false;  
			} 
		}		
}

function cpassVal(Value1, Value2) 
{
		
		
		if(!isEmpty(Value2,"Confirm Password"))
		{
			if (Value1 == Value2) 
			{
				return true;
			}
			else 
			{
				alert("Passwords does not Match");
				return false;
			}
		}
}