#Import AD Module
Import-Module ActiveDirectory

# Moves all disabled user accounts to Disabled OU
Search-ADAccount -AccountDisabled | Where {$_.distinguishedname -notlike "*OU=KenLab Disabled*"} | Move-ADObject -TargetPath "OU=KenLab Disabled,OU=KenLab,DC=ad,DC=kenlab,DC=com"

# If any enabled user accounts are in the disabled OU, disables them.
Get-ADUser -Filter {enabled -eq $true} -SearchBase "OU=KenLab Disabled,OU=KenLab,DC=ad,DC=kenlab,DC=com" | Disable-ADAccount
