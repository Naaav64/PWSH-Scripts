#Add or modify columns/parameters as needed for AD users

# Import AD Module
Import-Module ActiveDirectory

#Get file path to csv
$filepath = read-host -Prompt "Enter File Path to user inventory"

#Add temporary password for all accounts
$creds = Read-Host -Prompt "Enter Temporary Password for Bulk Account Creation" -AsSecureString

#  Added trim in case "Copy as Path" used, otherwise breaks.
$users = Import-Csv $filepath.trim('"')

Foreach ($user in $users) {
    New-ADUser `
        -name ($user.'First Name' + " " + $user.'Last Name') `
        -GivenName ($user.'First Name') `
        -Surname ($user.'Last Name') `
        -UserPrincipalName ($user.'First Name' + '.' + $user.'Last Name') `
        -AccountPassword $creds `
        -Path $user.'Organizational Unit' `
        -Description $user.Description `
        -ChangePasswordAtLogon $true `
        -Enabled ([System.Convert]::ToBoolean($user.Enabled))    
}