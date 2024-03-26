#Enter Actual User Info As Prompted

$name = Read-Host -prompt "Enter Account Name"
$fullname = Read-Host -prompt "Enter Full Name"
$pass = Read-Host -prompt "Enter User Password"  -AsSecureString   
$desc = Read-Host -prompt "Enter User Title and Department"

#if you want to modify user's local group, uncomment
#$role = 'Administrators' 

#To solve error if using Powershell 7.x and up
Import-Module microsoft.powershell.localaccounts -UseWindowsPowerShell 

New-LocalUser -name $name -Password $pass -FullName $fullname -Description $desc

#If $role is uncommented, then following should be as well.
#Add-LocalGroupMember -group $role -Member $name
