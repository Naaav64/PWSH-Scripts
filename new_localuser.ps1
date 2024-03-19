#Enter Actual User Info Below

$name = Read-Host -prompt "Enter Account Name"
$fullname = Read-Host -prompt "Enter Full Name"
$pass = Read-Host -prompt "Enter User Password"  -AsSecureString   
$desc = Read-Host -prompt "Enter User Title and Department"
$role = #'user' or 'admininistrator'

$user = New-LocalUser -name $name -Password $pass -FullName $fullname -Description $desc

Add-LocalGroupMember -group $role -Member $user