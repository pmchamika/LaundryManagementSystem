function formValidation(){
	var No=document.forms["myForms"]["receiptno"].value;
	var NIC=document.forms["myForms"]["nic"].value;
	var Weight=document.forms["myForms"]["weight"].value;
	var Rate=document.forms["myForms"]["rate"].value;
	var Date=document.forms["myForms"]["date"].value;
	
	if(noVal(No))
		if(nicVal(NIC))
			if(weiVal(Weight))
				if(rateVal(Rate))
					if(dateVal(Date))
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
function noVal(Value)
{
		if(!isEmpty(Value,"Receipt No"))
		{
			var eq= /^[0-9]+$/;
			if(Value.match(eq))
			{
				return true;
			}
			else
			{
				alert("Enter the Numbers only");
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
function weiVal(Value)
{
		if(!isEmpty(Value,"Weight"))
		{
			var eq= /^[0-9.]+$/;
			if(Value.match(eq))
			{
				return true;
			}
			else
			{
				alert("Enter the Numbers only");
				return false;
			}
		}
		else
		{
			return false;
		}
}
function rateVal(Value)
{
		if(!isEmpty(Value,"Rate"))
		{
			var eq= /^[0-9.]+$/;
			if(Value.match(eq))
			{
				return true;
			}
			else
			{
				alert("Enter the Numbers only");
				return false;
			}
		}
		else
		{
			return false;
		}
}
function dateVal(Value)
{
		var eq= /^[0-9/]+$/;
		if(!isEmpty(Value,"Date"))
		{
			if(Value.match(eq))
			{
				return true;
			}
			else
			{
				alert("Enter only numbers for Date");
				return false;
			}
		}
		else
		{
			return false;
		}
}