#To beused on Windows Server with AD DS installed
Import-Module activedirectory

#List all AD users
Get-aduser -Filter * | Select-Object Name, userpriciplename, sid
