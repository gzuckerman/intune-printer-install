<#

.Synopsis
Created on:   17/08/2023
Created by:   Gregory Zuckerman
Filename:     Remove-Printer.ps1

Simple PowerShell Script to remove a printer driver and printer via Microsoft Intune.

powershell.exe ExecutionPolicy Bypass .\Remove-Printer.ps1

.Example
.\Remove-Printer.ps1

#>

remove-printer "Sharp MXC304WFH"
SLEEP 60
remove-printerPort -Name "IP_10.11.8.156" 
Remove-PrinterDriver 'SHARP UD3 PCL6'