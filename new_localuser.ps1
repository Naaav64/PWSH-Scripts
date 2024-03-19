#Enter Actual User Info As Prompted

$name = Read-Host -prompt "Enter Account Name"
$fullname = Read-Host -prompt "Enter Full Name"
$pass = Read-Host -prompt "Enter User Password"  -AsSecureString   
$desc = Read-Host -prompt "Enter User Title and Department"

#if you want to modify user's local gropup
# $role = #'user' or 'admininistrator' 

import-module microsoft.powershell.localaccounts -UseWindowsPowerShell

$user = New-LocalUser -name $name -Password $pass -FullName $fullname -Description $desc

#If $role is uncommented, then following line is useable.
# Add-LocalGroupMember -group $role -Member $user