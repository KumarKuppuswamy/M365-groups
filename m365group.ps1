[array]$val = $null
Write-Host "*********************************************************************"
Write-Host "	          U N I F I E D   G R O U P    "
Write-Host "*********************************************************************"

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
                 $mship = Get-AzureADMSGroup -Filter "DisplayName eq '$name'" | Select MembershipRule
		 $mship.MembershipRule | ft
		 
			if(!$mems)
			{
			 Write-Host "No memebers in the group"
			}Else
			      {
				  ForEach($mem in $mems)
				  {
				     $id = $mem.ObjectID
				     $disp = $mem.DisplayName
		                     $email = $mem.Mail
		                     $acct = $mem.AccountEnabled
				     $cou = $mem.Country
				     $usag = $mem.UsageLocation
				     $Seg = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel1Code")
				     $bus = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel2Code")
				     $lob = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel3Code")
				     $pr = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel4Code")
				     $team = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel5Code")
						$obj1 = New-Object PSObject
						$obj1 | Add-Member NoteProperty -Name "DDL-DisplayName" -Value $disp
						$obj1 | Add-Member NoteProperty -Name "Email" -Value $email
						$obj1 | Add-Member NoteProperty -Name "AccountEnabled" -Value $acct
						$obj1 | Add-Member NoteProperty -Name "Country" -Value $cou
						$obj1 | Add-Member NoteProperty -Name "UsageLocation" -Value $usag
						$obj1 | Add-Member NoteProperty -Name "SEG_W_DepartmentLevel1Code" -Value $Seg
						$obj1 | Add-Member NoteProperty -Name "BUS_W_DepartmentLevel2Code" -Value $bus
						$obj1 | Add-Member NoteProperty -Name "LOB_W_DepartmentLevel3Code" -Value $lob
						$obj1 | Add-Member NoteProperty -Name "PRA_W_DepartmentLevel4Code" -Value $pr
						$obj1 | Add-Member NoteProperty -Name "TEM_W_DepartmentLevel5Code" -Value $team
						$val += $obj1
				   }
			       }
                }

	 }
 }
$val | ft

