$gname = Read-Host "Enter the group Email address :"
if(!$gname)
{
Write-Host "No valid input"
}Else
     {
	$grps = Get-AzureADGroup -SearchString "$gname"
	if(!$gname)
	{
	Write-Host "Check Manual - Group not able to find"
	}Else
	     {
                ForEach($grp in $grps)
		{
		 $mems = Get-AzureADGroupMember -ObjectId $grp.ObjectID -All $true
		 $name = $grp.DisplayName
		 Write-host "Dynamic Rule"
                 $r = Get-AzureADMSGroup -Filter "DisplayName eq '$name'" | Select MembershipRule
		 $r | fl
		}
	     }
     }
