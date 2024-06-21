Write-Host "**************************************************************************"
Write-Host "	       U S E R    C H E C K S    "
Write-Host "**************************************************************************"
Write-Host "A CSV will opened, enter the details TO check user available "
Start-Process -FilePath "C:\Users\Kuppuswamyku\Desktop\M365 Group\Input.csv"
Start-Sleep -s 10
$opt = Read-Host "Is the data entry completed : [Y/N]"
if($opt -eq "y")
{
$sg = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\Input.csv" | where-object {$_.Segment -ne ''}
$bu = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\Input.csv" | where-object {$_.Business -ne ''}
$lob = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\Input.csv" | where-object {$_.LOB -ne ''}
$pcs = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\Input.csv" | where-object {$_.Pratice -ne ''}
$tms = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\Input.csv" | where-object {$_.Team -ne ''}
$cts = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\Input.csv" | where-object {$_.Country -ne ''}

##segement
if(!$sg)
{
##Write-Host "No information"
[array]$valsegs = $null
}
Else{
	[array]$valsegs = $null
	$segs = $sg.Segment
	$si = 1
	$scounts = $segs.count
		ForEach($seg in $segs)
	 	{
	   	    if($scounts -gt $si)
		    {
			[string]$valsegs = [string]$valsegs + "(W-DepartmentLevel1Code -eq '$seg') -or "
			$si++
		     }Else
			{
			   [string]$valsegs = [string]$valsegs + "(W-DepartmentLevel1Code -eq '$seg')) -and "
			}
		}
	$vsegment = "(" + "$valsegs"
	##$vsegment
	
    }


##business
if(!$bu)
{
##Write-Host "No information"
[array]$valbus = $null
}
Else{
	[array]$valbus = $null
	$buis = $bu.Business
	$bi = 1
	$bcounts = $buis.count
		ForEach($bui in $buis)
	 	{
	   	    if($bcounts -gt $bi)
		    {
			[string]$valbus = [string]$valbus + "(W-DepartmentLevel2Code -eq '$bui') -or "
			$bi++
		     }Else
			{
			   [string]$valbus = [string]$valbus + "(W-DepartmentLevel2Code -eq '$bui')) -and "
			}
		}
	$vbusiness = "(" + "$valbus"
	##$vbusiness
	
    }



##lob
if(!$lob)
{
##Write-Host "No information"
[array]$vallobs = $null
}
Else{
	[array]$vallobs = $null
	$lobs = $lob.LOB

	$lobi = 1
	$lobcounts = $lobs.count
		ForEach($lob in $lobs)
	 	{
	   	    if($lobcounts -gt $lobi)
		    {
			[string]$vallobs = [string]$vallobs + "(W-DepartmentLevel3Code -eq '$lob') -or "
			$lobi++
		     }Else
			{
			   [string]$vallobs = [string]$vallobs + "(W-DepartmentLevel3Code -eq '$lob')) -and "
			}
		}
	$vlob = "(" + "$vallobs"
	##$vlob
	
    }



##Pratice
if(!$pcs)
{
##Write-Host "No information"
[array]$valpcs = $null
}
Else{
	[array]$valpcs = $null
	$pcss = $pcs.Pratice

	$pcsi = 1
	$pcscounts = $pcss.count
		ForEach($pcs in $pcss)
	 	{
	   	    if($lobcounts -gt $lobi)
		    {
			[string]$valpcs = [string]$valpcs + "(W-DepartmentLevel4Code -eq '$pcs') -or "
			$pcsi++
		     }Else
			{
			   [string]$valpcs = [string]$valpcs + "(W-DepartmentLevel4Code -eq '$pcs')) -and "
			}
		}
	$vpractice = "(" + "$valpcs"
	##$vpractice
	
    }


##Teams
if(!$tms)
{
##Write-Host "No information"
[array]$valtms = $null
}
Else{
	[array]$valtms = $null
	$tmss = $tms.Team

	$tmsi = 1
	$tmscounts = $tmss.count
		ForEach($tms in $tmss)
	 	{
	   	    if($tmscounts -gt $tmsi)
		    {
			[string]$valtms = [string]$valtms + "(W-DepartmentLevel5Code -eq '$tms') -or "
			$tmsi++
		     }Else
			{
			   [string]$valtms = [string]$valtms + "(W-DepartmentLevel5Code -eq '$tms')) -and "
			}
		}
	$vteams = "(" + "$valtms"
	##$vteams
	
    }



##country
if(!$cts)
{
##Write-Host "No information"
[array]$valcts = $null
}
Else{
	[array]$valcts = $null
	$ctss = $cts.Country

	$ctsi = 1
	$ctscounts = $ctss.count
		ForEach($cts in $ctss)
	 	{
	   	    if($ctscounts -gt $ctsi)
		    {
			[string]$valcts = [string]$valcts + "(co -eq '$cts') -or "
			$ctsi++
		     }Else
			{
			   [string]$valcts = [string]$valcts + "(co -eq '$cts')) -and "
			}
		}
	$vcountry = "(" + "$valcts"
	##$vcountry
	
    }

 

$filter = "$vsegment" + "$vbusiness" + "$vlob" + "$vpractice" + "$vteams" + "$vcountry" + "((extensionAttribute6 -ne 'Contingent Worker') -and (W-EmployeeStatus -eq 'Active'))"
##$filter
$coun = Get-ADuser -Filter "$filter" -Properties * | select DisplayName,Mail,W-DepartmentLevel1Code,W-DepartmentLevel1,W-DepartmentLevel2Code,W-DepartmentLevel2,W-DepartmentLevel3Code,W-DepartmentLevel3,W-DepartmentLevel4Code,W-DepartmentLevel4,W-DepartmentLevel5Code,W-DepartmentLevel5,extensionAttribute6,W-EmployeeStatus,userAccountControl
Write-Host "Output will stored in CSV IN screen shows only one"
$coun | Export-csv Userchecks.csv -NoTypeInformation
##$coun | select -First 1 | FL
$cou = $coun.count
Write-Host "Count : $cou"
}


