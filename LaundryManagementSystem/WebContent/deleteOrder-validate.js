function formValidation(){
	var No=document.forms["myForms"]["receiptno"].value;
	
	if(noVal(No))
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