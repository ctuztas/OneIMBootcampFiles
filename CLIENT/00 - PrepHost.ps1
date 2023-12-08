# Prep Host Requirements
Install-WindowsFeature NET-Framework-Core 

# Download Install WinGet
Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.6.3133/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "C:\Temp\WinGet.msixbundle"
# Install WinGet
Add-AppxPackage "C:\Temp\WinGet.msixbundle"