function call(ch)
{
	if((ch.keyCode>=65 && ch.keyCode<=90) || (ch.keyCode>=97 && ch.keyCode<=122))
	{
		return true;
	}
	else
	{
		alert("Please use only charecter");	
		return false;
	}	
}
function check(num)
{
	if(num.keyCode>=48 && num.keyCode<=57)
	{
		return true;
	}
	else
	{
		alert("Please use only Number");	
		return false;
	}
}

function validate(Form)
{
	if(Form.txtEmail.value=="")
	{
		alert("Enter The Email Id");
		Form.txtEmail.focus();
		return false;
	}
	if(Form.password.value=="")
	{
		alert("Enter The Password");
		Form.password.focus();
		return false;
	}
	if(Form.profilefor.value==0)
	{
		alert("Select the profile created for");
		Form.profilefor.focus();
		return false;
	}
	if(Form.gender.value==0)
	{
		alert("Select the Full Name");
		Form.gender.focus();
		return false;
	}
	if(Form.Country.value==0)
	{
		alert("Select The Country Code");
		Form.Country.focus();
		return false;
	}
	
	if(Form.txtmobile.value==0)
	{
		alert("Enter the Mobile No.");
		Form.txtmobile.focus();
		return false;
	}
	return true;
}