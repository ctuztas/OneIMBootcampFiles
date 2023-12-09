# Capture Transscript to file.
Start-Transcript -Path "C:\Temp\OneIMBootcampFiles\AD\PrepHost.log"

# Prep Host Requirements

# Copy file to Startup Folder
Copy-Item -Path "C:\Temp\OneIMBootcampFiles\AD\00-PromotetoDC.ps1" -Destination "C:\Windows\System32\GroupPolicy\Machine\Scripts\Startup"


# Download and install WinGet for software downloads
New-Item -Path "C:\Temp" -Name "Software" -ItemType Directory
Invoke-WebRequest -Uri "https://aka.ms/Microsoft.VCLibs.x64.14.00.Desktop.appx" -OutFile "C:\Temp\Software\Microsoft.VCLibs.x64.14.00.Desktop.appx"
Invoke-WebRequest -Uri "https://www.nuget.org/api/v2/package/Microsoft.UI.Xaml/2.7.3" -OutFile "C:\Temp\Software\microsoft.ui.xaml.2.7.3.zip"
Expand-Archive -Path C:\Temp\Software\microsoft.ui.xaml.2.7.3.zip -DestinationPath C:\Temp\Software\microsoft.ui.xaml.2.7.3
Add-AppxPackage -Path C:\Temp\Software\Microsoft.VCLibs.x64.14.00.Desktop.appx
Add-AppxPackage -Path C:\Temp\Software\microsoft.ui.xaml.2.7.3\tools\AppX\x64\Release\Microsoft.UI.Xaml.2.7.appx

Invoke-WebRequest -Uri "https://github.com/microsoft/winget-cli/releases/download/v1.6.3133/Microsoft.DesktopAppInstaller_8wekyb3d8bbwe.msixbundle" -OutFile "C:\Temp\Software\WinGet.msixbundle"
Add-AppxPackage "C:\Temp\Software\WinGet.msixbundle"
Add-AppxProvisionedPackage -Online -PackagePath "C:\Temp\Software\WinGet.msixbundle" -LicensePath "C:\Temp\OneIMBootcampFiles\AD\34f5f38e82aa4e7ab15e617c6974e40e_License1.xml" -Verbose

# Download required software via WinGet
winget install -e --accept-source-agreements --accept-package-agreements --id Microsoft.DotNet.Framework.DeveloperPack_4
winget install -e --accept-source-agreements --accept-package-agreements --id Microsoft.DotNet.SDK.6
winget install -e --accept-source-agreements --accept-package-agreements --id Microsoft.WindowsTerminal
winget install -e --accept-source-agreements --accept-package-agreements --id Notepad++.Notepad++
winget install -e --accept-source-agreements --accept-package-agreements --id Google.Chrome


# Download additional packages

# Prep Host Requirements
Install-WindowsFeature AD-Domain-Services -IncludeManagementTools

Restart-Computer

# Finish Capture
Stop-Transcript