// JavaScript Document
function number(e)
	
	{
		if(e.keyCode>=47 && e.keyCode<=57)
		{
			return true;
		}
		else
		{
		alert("Enter Numbers Only")
			return false;
		}
	}

	function character(e)
	{
		if((e.keyCode>=65 && e.keyCode<=91)||(e.keyCode>=97 && e.keyCode<=121))
		{
			return true;
		}
		else
		{alert("Enter Character Only")
			return false;
		}
	}
	