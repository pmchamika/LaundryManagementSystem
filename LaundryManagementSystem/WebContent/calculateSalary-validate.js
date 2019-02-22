function formValidation(){
	var fname=document.forms["myForms"]["fullname"].value;
	var hour=document.forms["myForms"]["othours"].value;
	var rate=document.forms["myForms"]["otrate"].value;
	
	if(fnameVal(fname))
		if(hourVal(hour))
			if(rateVal(rate))
				return true;
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
function hourVal(Value)
{
		if(!isEmpty(Value,"Hours"))
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
function rateVal(Value)
{
		if(!isEmpty(Value,"Rate"))
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