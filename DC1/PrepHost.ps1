# Capture Transscript to file.
Start-Transcript -Path 'C:\Temp\OneIMBootcampFiles\AD\PrepHost.log'

# Prep Host Requirements
Install-WindowsFeature NET-Framework-Core 


# Download and install WinGet for software downloads
New-Item -Path "C:\Temp" -Name "Software" -ItemType Directory
Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.6.3133/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "C:\Temp\Software\WinGet.msixbundle"
Add-AppxPackage "C:\Temp\Software\WinGet.msixbundle"

# Download required software via WinGet
winget install -e --accept-source-agreements --accept-package-agreements --id Microsoft.DotNet.Framework.DeveloperPack_4
winget install -e --accept-source-agreements --accept-package-agreements --id Microsoft.DotNet.SDK.6
winget install -e --accept-source-agreements --accept-package-agreements --id Microsoft.WindowsTerminal --skip-dependencies
winget install -e --accept-source-agreements --accept-package-agreements --id Notepad++.Notepad++
winget install -e --accept-source-agreements --accept-package-agreements --id Google.Chrome


# Download additional packages

# Prep Host Requirements
Install-WindowsFeature NET-Framework-Core AD-Domain-Services -IncludeManagementTools

# Prep Active Directory
Install-ADDSForest -DomainName "iamdemo.com" -DomainMode "Win2012R2" -ForestMode "Win2012R2" -InstallDNS -Confirm -SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText "Kub1Lay$" -Force) 


# Finish Capture
Stop-Transcript