# ------------------------------------------------------------------------------------------- '
# Title: Run PowerShell script remotely
# Author: Guilherme Matheus
# Date: Script created on 24.06.2021
# Script and data info: This script can run another powershell script remotely in another server
# Documentation: https://docs.microsoft.com/en-us/powershell/module/microsoft.powershell.core/enter-pssession?view=powershell-7.1
#--------------------------------------------------------------------------------------------'

# Server name
$ServerName = "Your server name"

# Email to connect to another serer
$UserName = "Your server user name"

# Password from your account
$Password = "Your server user password"

# Create credentials that is going to be use to connect
$creds = (New-Object System.Management.Automation.PSCredential $UserName,(ConvertTo-SecureString $Password -AsPlainText -Force))

# Enter in the server session
Enter-PSSession -ComputerName $ServerName -credential $creds

# Execute a powershell script command into another server
Invoke-Command -ComputerName $ServerName -ScriptBlock {powershell -executionPolicy bypass -file "\\Your_PC\Your_PS_Script.ps1"} -credential $creds

# Exit the session from the remotely server
Exit-PSSession