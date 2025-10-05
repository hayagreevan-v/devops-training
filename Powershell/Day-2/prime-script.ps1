[int]$num = Read-Host "Enter a Number"; 

for([int]$i=2; $i -lt $num/2; $i++)
{
	if($num % $i -eq 0){ 
		Write-Host "$num is not Prime"; 
		return;
	}
} 
Write-Output "$num is Prime"
