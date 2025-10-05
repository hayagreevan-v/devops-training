function Prime{
	param( [int]$num )
	for([int]$i=2; $i -lt $num/2; $i++)
	{
		if($num % $i -eq 0){ 
			return "$num is not Prime"; 
		}
	} 
	return "$num is Prime"
}

Write-Host (Prime(Read-Host "Enter Number"))
