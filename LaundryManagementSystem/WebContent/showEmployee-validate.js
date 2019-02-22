function formValidation(){
	var fname=document.forms["myForms"]["fullname"].value;
	
	if(fnameVal(fname))
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