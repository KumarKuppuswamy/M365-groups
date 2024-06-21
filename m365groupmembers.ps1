[array]$dat = $null
$user = Read-Host "Enter the user email address : "
if(!$user)
{
Write-Host "No proper information"
}Else
    {

	$members = Get-UnifiedGroupLinks "Retirement_SouthKorea@wtwco.com" -linktype member -resultsize Unlimited
	ForEach($member in $members)
	{
		$primary = $member.PrimarySMTPAddress
		$country = $member.CountryOrRegion
		$display = $member.DisplayName
		
			$mbx = Get-Mailbox "$primary" 
			If(!$mbx)
			{
			}
			$cust = $mbx.CustomAttribute6
			$objects = Get-AzureADUser -SearchString "$primary"
				ForEach($object in $objects)
				{
					$acct = $object.Accountenabled
					$id = $object.ObjectId
					$Seg = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel1Code")
					$bus = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel2Code")
					$lob = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel3Code")
					$pr = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel4Code")
					$team = (Get-AzureADUserExtension -ObjectId "$id").get_item("extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel5Code")
						$obj = New-Object PSObject
						$obj | Add-Member -MemberType NoteProperty -Name "DisplayName" -Value $display
						$obj | Add-Member -MemberType NoteProperty -Name "Country" -Value $country
						$obj | Add-Member -MemberType NoteProperty -Name "Email" -Value $primary
						$obj | Add-Member -MemberType NoteProperty -Name "Segment_W_DepartmentLevel1Code" -Value $Seg
						$obj | Add-Member -MemberType NoteProperty -Name "Business_W_DepartmentLevel2Code" -Value $bus
						$obj | Add-Member -MemberType NoteProperty -Name "LOB_W_DepartmentLevel3Code" -Value $lob
						$obj | Add-Member -MemberType NoteProperty -Name "Practice_W_DepartmentLevel4Code" -Value $pr
						$obj | Add-Member -MemberType NoteProperty -Name "TeamW_DepartmentLevel5Code" -Value $team
						$obj | Add-Member -MemberType NoteProperty -Name "CustomAttribute6" -Value $Cust
						$obj | Add-Member -MemberType NoteProperty -Name "UserAccountEnabled" -Value $acct
				
						$dat += $obj
				}
            }

}
$dat
