# Capture Transscript to file.
Start-Transcript -Path 'C:\Temp\OneIMBootcampFiles\CLIENT\PrepHost.log'

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
winget install -e --accept-source-agreements --accept-package-agreements --id 7zip.7zip
winget install -e --accept-source-agreements --accept-package-agreements --id Notepad++.Notepad++
winget install -e --accept-source-agreements --accept-package-agreements --id Google.Chrome
winget install -e --accept-source-agreements --accept-package-agreements --id Adobe.Acrobat.Reader.64-bit
winget install -e --accept-source-agreements --accept-package-agreements --id Mozilla.Firefox
winget install -e --accept-source-agreements --accept-package-agreements --id Microsoft.VisualStudioCode


# Download additional packages

# Log4View
Invoke-WebRequest -Uri "https://www.log4view.de/fileadmin/redaktion/log4view/Log4ViewSetup.exe" -OutFile "C:\Temp\Software\Log4ViewSetup.exe"
C:\Temp\Software\Log4ViewSetup.exe /S

# SAP NCO 3.1
Invoke-WebRequest -Uri "https://github.com/ctuztas/OneIMBootcampFiles/releases/download/v0.0.2/sapnco31P_3-70002627.zip" -OutFile "C:\Temp\Software\sapnco31P_3-70002627.zip"
Expand-Archive -Force -Path C:\Temp\Software\sapnco31P_3-70002627.zip -DestinationPath C:\Temp\Software\sapnco31P_3-70002627
C:\Temp\Software\sapnco31P_3-70002627\SapNCox64Setup.exe /Silent

# SAP Logon Installation missing
# Copy installation archive to storage


# Finish Capture
Stop-Transcript