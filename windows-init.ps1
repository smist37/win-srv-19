


#####################################
 #   PRIOR TO RUNNING THIS SCRIPT   #
 # Set-ExecutionPolicy unrestricted #
 # Invoke-WebRequest -Uri https://raw.githubusercontent.com/smist37/win-srv-19/main/windows-init.ps1 -Outfile windows-init.ps1 #
 #
#####################################


 Set-PSRepository -Name 'PSGallery' -InstallationPolicy Trusted
# Trust the PSGallery Repo so it will auto accept to Y

Install-Module PSWindowsUpdate # Let powershell run Windows Update

Install-PackageProvider -Name NuGet -MinimumVersion 2.8.5.201 -Force
# the above line was also required at some point

Get-WindowsUpdate # Run the Windows Update

Write-Host "These are the following updates I'll download."

Install-WindowsUpdate -MicrosoftUpdate -AcceptAll -AutoReboot # Grab the latest Updates

Write-Host "After 60 seconds the script will terminate and the system may reboot."

$val = 60
while ($val -ge 0) {
Write-Host $val, "" -NoNewline;
Start-Sleep -Seconds 1
$val--;
}

Write-Host "All done."
