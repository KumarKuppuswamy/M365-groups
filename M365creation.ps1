$List = import-csv "C:\Users\Kuppuswamyku\Desktop\M365 Group\m365create.csv"
$List | foreach {
                New-AzureADMSGroup -DisplayName $_.name -GroupTypes "DynamicMembership","Unified" -MembershipRule $_.rule -MailEnabled $true -MailNickname $_.alias -SecurityEnabled $false  -MembershipRuleProcessingState "On"
}
start-sleep 25
$List | foreach {
                $smtp = $_.alias + "@wtwco.com"
                Set-UnifiedGroup $_.alias -UnifiedGroupWelcomeMessageEnabled:$false -AutoSubscribeNewMembers:$true
                Set-UnifiedGroup $_.alias -HiddenFromExchangeClientsEnabled:$true
                Set-UnifiedGroup $_.alias -HiddenFromAddressListsEnabled $false -PrimarySMTPAddress $SMTP
}
 
##Name is the display name of the DL, should be provided by the requestor.
##Alias the email address before the @ sign. @wtwco.com will be appended for email address. Should also be provided by requestor.
##Rule is the exact query that will be used to create the rule