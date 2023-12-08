# Prep Host Requirements
Install-WindowsFeature NET-Framework-Core AD-Domain-Services -IncludeManagementTools

# Prep Active Directory
Install-ADDSForest -DomainName "iamdemo.com" -DomainMode "Win2012R2" -ForestMode "Win2012R2" -InstallDNS -Confirm -SafeModeAdministratorPassword (ConvertTo-SecureString -AsPlainText "Kub1Lay$" -Force) 