add-pssnapin Microsoft.Exchange.Management.PowerShell.E2010
 
#Used as the default password for all new users. Use better logic if you need more security.
$DefaultPW = read-host "Enter Password" -AsSecureString
 
#Assume you have a csv with three fields: fname, lname, username
import-csv C:\users.csv | Foreach-object {
 
    $Fname = $_.FName
    $LName = $_.LName
    $DisplayName = "$LName, $FName"
    $User = $_.Username
 
 
    New-Mailbox -UserPrincipalName $User@example.com -Alias $User -Database "Mailbox Database 0167990188" -Name $DisplayName -Password $DefaultPW -FirstName $FName -LastName $LName -DisplayName $DisplayName -ResetPasswordOnNextLogon $false
 
}