# Exchange Archive and Remove
# Created By - John Mahoney
# Info - 2014/05/21 @ 13:30 PM EDT
# Description:  Reads local txt file and runs through each name in file to archive user to a PST file in Exchange 2010

$content = get-content "C:\userstoarchive.txt"
foreach ($user in $content)
{

New-MailboxExportRequest -Mail $user - FilePath "\\folder\to\export\$user mailbox.pst"
if ($user -eq 'username') {
Disable-Mailbox $user
} 
#add else if for user that you only want to remove exchange for.
ElseIf ($user -eq 'administrator') {
Disable-Mailbox $user
} 
Else {
Remove-Mailbox -Identity $user
}
}
# end

