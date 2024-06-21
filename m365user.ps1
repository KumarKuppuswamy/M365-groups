


[array]$dat = $null
$user = Read-Host "Enter the user email address : "
if(!$user)
{
Write-Host "No proper information"
}Else
     {
	$objects = Get-AzureADUser -SearchString "$user"
	if(!$objects)
	{
	Write-Host "No user information, check manually"
	}Else
	    {
		ForEach($object in $objects)
		{
			
			$mbx = Get-Mailbox $object.UserPrincipalName
			$id = $object.ObjectId
			$Seg = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel1Code")
			$bus = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel2Code")
			$lob = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel3Code")
			$pr = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel4Code")
			$team = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel5Code")
				$obj = New-Object PSObject
				$obj | Add-Member -MemberType NoteProperty -Name "DisplayName" -Value $mbx.displayname
				$obj | Add-Member -MemberType NoteProperty -Name "Country" -Value $object.country
				$obj | Add-Member -MemberType NoteProperty -Name "Email" -Value $mbx.PrimarySMTPAddress
				$obj | Add-Member -MemberType NoteProperty -Name "SEG_W_DepartmentLevel1Code" -Value $Seg
				$obj | Add-Member -MemberType NoteProperty -Name "BUS_W_DepartmentLevel2Code" -Value $bus
				$obj | Add-Member -MemberType NoteProperty -Name "LOB_W_DepartmentLevel3Code" -Value $lob
				$obj | Add-Member -MemberType NoteProperty -Name "PRA_W_DepartmentLevel4Code" -Value $pr
				$obj | Add-Member -MemberType NoteProperty -Name "TEM_W_DepartmentLevel5Code" -Value $team
				$obj | Add-Member -MemberType NoteProperty -Name "CustomAttribute6" -Value $mbx.CustomAttribute6
				$obj | Add-Member -MemberType NoteProperty -Name "AccountEnabled" -Value $object.AccountEnabled
				
				$dat += $obj
		}
	}
   }

$dat

