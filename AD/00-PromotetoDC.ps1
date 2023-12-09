Start-Transcript -Path 'C:\Temp\OneIMBootcampFiles\AD\00-PromotetoDC.log'

# Prep Active Directory
Install-ADDSForest -DomainName "iamdemo.com" -DomainMode "WinThreshold" -ForestMode "WinThreshold" -InstallDNS -SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText "Kub1Lay$" -Force) -Force
Remove-Item "C:\Windows\System32\GroupPolicy\Machine\Scripts\Startup\00-PromotetoDC.ps1" -Force
Restart-Computer

Stop-Transcript