#Import-AD Module on DC
Import-Module ActiveDirectory

#Get Variables
$firstname = Read-Host -Prompt "Enter First Name"
$lastname = Read-Host -Prompt "Enter Last Name"
$creds = Read-Host -Prompt "Enter Desired Password" -AsSecureString

#Create the AD User
New-ADUser `
    -Name "$firstname $lastname" `
    -GivenName "$firstname" `
    -Surname "$lastname" `
    -UserPrincipalName "$firstname.$lastname" `
    -AccountPassword $creds `
    -Path # Enter Distinguished Path ex: "OU=KenLab Users,OU=KenLab,DC=ad,DC=kenlab,DC=com" `
    -ChangePasswordAtLogon $true `
    -Enabled $true