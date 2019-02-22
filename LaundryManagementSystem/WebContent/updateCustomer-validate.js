/**
 * 
 */
function formValidation(){
	var nic=document.forms["myForms"]["nic"].value;
	var add=document.forms["myForms"]["address"].value;
	var con=document.forms["myForms"]["contact"].value;
	var pass=document.forms["myForms"]["password"].value;
	
	if(nicVal(nic))
		  if(addVal(add))
				if(conVal(con))
						if(passVal(pass))
							
							return true;
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

function conVal(Value)
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