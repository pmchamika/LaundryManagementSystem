/**
 * 
 */
function formValidation(){
	var nic=document.forms["myForms"]["nic"].value;
	
	if(nicVal(nic))
		return true;
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
