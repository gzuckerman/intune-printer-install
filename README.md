### PowerShell Printer installer script for Microsoft Intune ###

Simple PowerShell Script to install a printer driver and printer via Microsoft Intune. Required files should be in the same directory as the script when creating a Win32 app for deployment via Intune.

#### Powershell Commands ####

##### Install: #####

`` powershell.exe ExecutionPolicy Bypass .\Install-Printer.ps1 ``

##### Remove: ##### 

`` powershell.exe ExecutionPolicy Bypass .\Remove-Printer.ps1 ``

##### Detection Rule for Intune: ##### 

| ID    | Value |
| ----------- | ----------- |
| Rule Type:     | Registry      |
| Key Path  | HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\Sharp MXC304WFH        |
| Value | Name |
| Detection Method | String Comparison |
| Operator | Equals |
| Name | Sharp MXC304WFH |
