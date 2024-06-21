
#*****************************level1**************************
$in = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\automatic.csv" | where-object {$_.Segment -ne ''}
$codes1 = $in.Segment
[array]$level1code = $null
[array]$dc1 = $null
[array]$val1 = $null

if(!$codes1)
{
	Write-Host "Invalid Entry"
}
Else
{
	ForEach($code1 in $codes1)
	{
		if($code1 -eq "")
		{
		}
		Else
		{
		$cd1 = Get-ADuser -Filter {(W-DepartmentLevel1Code -eq $code1)} -Properties * | select W-DepartmentLevel1,W-DepartmentLevel1code | select -First 1
			if($cd1 -eq '$null')
			{
			Write-Host "Not able to find the code check manually"
			}
			Else
			{
				$cd1 = $cd1 -split 'W-'
				$levelname1 = $cd1[1] -split '='
				$levelname1 = $levelname1[1] -split ';'
				$departname1 = $levelname1[0]
				$levelcode1 = $cd1[2] -split '='
				$departcode1 = $levelcode1[1] -split '}'
				$departcode1 = $departcode1 | Where { $_ -and $_.Trim() }
				$dc1 = $dc1 + $departcode1
													
			}
		}
	}

$j1=1	
$i1 = $dc1.count
		ForEach($d1 in $dc1)
		{
		 
			
			
			if($d1 -eq "")
			{
			}
			Else
			{
				if($i1 -gt $j1)
   				{
				[string]$val1 = [string]$val2 + "(user.extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel1Code -eq '$d1') -or "
   				$j1++
    			        }
   				Else
  				{
				[string]$val1 = [string]$val2 + "(user.extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel1Code -eq '$d1')) -and "
				}
				$csval1 = "(" + "$val1"
				##$csval1
			}
		}
}
##$val1



#*****************************level2**************************
$in = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\automatic.csv" | where-object {$_.Business -ne ''}
$codes2 = $in.Business
[array]$level2code = $null
[array]$dc2 = $null
[array]$val2 = $null

if(!$codes2)
{
	Write-Host "Invalid Entry"
}
Else
{
	ForEach($code2 in $codes2)
	{
		if($code2 -eq "")
		{
		}
		Else
		{
		$cd2 = Get-ADuser -Filter {(W-DepartmentLevel2Code -eq $code2)} -Properties * | select W-DepartmentLevel2,W-DepartmentLevel2code | select -First 1
			if($cd2 -eq '$null')
			{
			Write-Host "Not able to find the code check manually"
			}
			Else
			{
				$cd2 = $cd2 -split 'W-'
				$levelname2 = $cd2[1] -split '='
				$levelname2 = $levelname2[1] -split ';'
				$departname2 = $levelname2[0]
				$levelcode2 = $cd2[2] -split '='
				$departcode2 = $levelcode2[1] -split '}'
				$departcode2 = $departcode2 | Where { $_ -and $_.Trim() }
				$dc2 = $dc2 + $departcode2
													
			}
		}
	}

$j2=1	
$i2 = $dc2.count
		ForEach($d2 in $dc2)
		{
		 	
			
			if($d2 -eq "")
			{
			}
			Else
			{
				if($i2 -gt $j2)
   				{
				[string]$val2 = [string]$val2 + "(user.extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel2Code -eq '$d2') -or "
   				$j2++
    			        }
   				Else
  				{
				[string]$val2 = [string]$val2 + "(user.extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel2Code -eq '$d2')) -and "
				}
				$csval2 = "(" + "$val2"
				##$csval2
			}
		}
}
##$val2


#*****************************level3**************************
$in = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\automatic.csv" | where-object {$_.LOB -ne ''}
$codes3 = $in.LOB
[array]$level3code = $null
[array]$dc3 = $null
[array]$val3 = $null

if(!$codes3)
{
	Write-Host "Invalid Entry"
}
Else
{
	ForEach($code3 in $codes3)
	{
		if($code3 -eq "")
		{
		}
		Else
		{
		$cd3 = Get-ADuser -Filter {(W-DepartmentLevel3Code -eq $code3)} -Properties * | select W-DepartmentLevel3,W-DepartmentLevel3code | select -First 1
			if($cd3 -eq '$null')
			{
			Write-Host "Not able to find the code check manually"
			}
			Else
			{
				$cd3 = $cd3 -split 'W-'
				$levelname3 = $cd3[1] -split '='
				$levelname3 = $levelname3[1] -split ';'
				$departname3 = $levelname3[0]
				$levelcode3 = $cd3[2] -split '='
				$departcode3 = $levelcode3[1] -split '}'
				$departcode3 = $departcode3 | Where { $_ -and $_.Trim() }
				$dc3 = $dc3 + $departcode3
													
			}
		}
	}

$j3=1	
$i3 = $dc3.count
		ForEach($d3 in $dc3)
		{
		 
			
			
			if($d3 -eq "")
			{
			}
			Else
			{
				if($i3 -gt $j3)
   				{
				[string]$val3 = [string]$val3 + "(user.extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel3Code -eq '$d3') -or "
   				$j3++
    			        }
   				Else
  				{
				[string]$val3 = [string]$val3 + "(user.extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel3Code -eq '$d3')) -and "
				}
				$csval3 = "(" + "$val3"
				##$csval3
			}
		}
}
##$val3


#*****************************level4**************************
$in = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\automatic.csv" | where-object {$_.Practice -ne ''}
$codes4 = $in.Practice
[array]$level4code = $null
[array]$dc4 = $null
[array]$val4 = $null

if(!$codes4)
{
	Write-Host "Invalid Entry"
}
Else
{
	ForEach($code4 in $codes4)
	{
		if($code4 -eq "")
		{
		}
		Else
		{
		$cd4 = Get-ADuser -Filter {(W-DepartmentLevel4Code -eq $code4)} -Properties * | select W-DepartmentLevel4,W-DepartmentLevel4code | select -First 1
			if($cd4 -eq '$null')
			{
			Write-Host "Not able to find the code check manually"
			}
			Else
			{
				$cd4 = $cd4 -split 'W-'
				$levelname4 = $cd4[1] -split '='
				$levelname4 = $levelname4[1] -split ';'
				$departname4 = $levelname4[0]
				$levelcode4 = $cd4[2] -split '='
				$departcode4 = $levelcode4[1] -split '}'
				$departcode4 = $departcode4 | Where { $_ -and $_.Trim() }
				$dc4 = $dc4 + $departcode4
													
			}
		}
	}

$j4=1	
$i4 = $dc4.count
		ForEach($d4 in $dc4)
		{
		 
			
			
			if($d4 -eq "")
			{
			}
			Else
			{
				if($i4 -gt $j4)
   				{
				[string]$val4 = [string]$val4 + "(user.extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel4Code -eq '$d4') -or "
   				$j4++
    			}
   				Else
  				{
				[string]$val4 = [string]$val4 + "(user.extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel4Code -eq '$d4')) -and "
				
  				}
				$csval4 = "(" + "$val4"
				##$csval4
			}
		}
}
##$val4


#*****************************level5**************************

$in = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\automatic.csv" | where-object {$_.Team -ne ''}
$codes4 = $in.Team
[array]$level5code = $null
[array]$dc5 = $null
[array]$val5 = $null

if(!$codes5)
{
	Write-Host "Invalid Entry"
}
Else
{
	ForEach($code5 in $codes5)
	{
		if($code4 -eq "")
		{
		}
		Else
		{
		$cd5 = Get-ADuser -Filter {(W-DepartmentLevel5Code -eq $code5)} -Properties * | select W-DepartmentLevel5,W-DepartmentLevel5code | select -First 1
			if($cd5 -eq '$null')
			{
			Write-Host "Not able to find the code check manually"
			}
			Else
			{
				$cd5 = $cd5 -split 'W-'
				$levelname5 = $cd5[1] -split '='
				$levelname5 = $levelname5[1] -split ';'
				$departname5 = $levelname5[0]
				$levelcode5 = $cd5[2] -split '='
				$departcode5 = $levelcode5[1] -split '}'
				$departcode5 = $departcode5 | Where { $_ -and $_.Trim() }
				$dc5 = $dc5 + $departcode5
													
			}
		}
	}

$j5=1	
$i5 = $dc5.count
		ForEach($d5 in $dc5)
		{
		 
			
			
			if($d5 -eq "")
			{
			}
			Else
			{
				if($i5 -gt $j5)
   				{
				[string]$val4 = [string]$val5 + "(user.extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel5Code -eq '$d5') -or "
   				$j5++
    			}
   				Else
  				{
				[string]$val5 = [string]$val5 + "(user.extension_f6f9bc8236034d33859f3461e8cd04bf_W_DepartmentLevel5Code -eq '$d5')) -and "
				
  				}
				$csval5 = "(" + "$val5"
				##$csval4
			}
		}
}
##$val4


#*****************************Country**************************

$in = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\automatic.csv" | where-Object {$_.Country -ne ''}
$contrs = $in.Country
[array]$level5code = $null
[array]$dc5 = $null
[array]$con = $null

if(!$contrs)
{
	Write-Host "Invalid Entry"
}
Else
{
$cj = 1
$ci = $contrs.count

	ForEach($contr in $contrs)
	{
		if($contr -eq "")
		{
		}
		Else
		{
			if($ci -gt $cj)
			{
			[string]$con = [string]$con + "(user.country -eq '$contr') -or "
			$cj++
			}
			Else
			{
			[string]$con = [string]$con + "(user.country -eq '$contr')) -and "
			}
			$cscon = "(" + "$con"
			##$cscon
		}
	}
}

#$csval1
#$csval2
#$csval3
#$csval4
#$csval5
#$cscon

$fin = "$csval1" + "$csval2" + "$csval3" + "$csval4" + "$csval5" + "$cscon" + "((user.ExtensionAttribute6 -ne 'Contingent Worker') -and (user.AccountEnabled -eq True))"

$fin = $fin.Replace("'",'"')
$fin



