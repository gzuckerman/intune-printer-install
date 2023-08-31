<#

.Synopsis
Created on:   17/08/2023
Updated on:   31/08/2023
Created by:   Gregory Zuckerman
Filename:     Install-Printer.ps1

Simple PowerShell Script to install a printer driver and printer via Microsoft Intune. Required files should be in the same directory as the script when creating a Win32 app for deployment via Intune.

### Powershell Commands ###

Install:
powershell.exe -ExecutionPolicy Bypass -File .\Install-Printer.ps1

Remove:
powershell.exe -ExecutionPolicy Bypass -File .\Remove-Printer.ps1

Detection:

Rule Type:          Registry
Key path:           HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Print\Printers\Sharp_MXC304WFH
Value:              Name
Detection method:   String comparison
Operator:           Equals
Name:               Sharp MXC304WFH

.Example
.\Install-Printer.ps1

#>

$PSScriptRoot = Split-Path -Parent -Path $MyInvocation.MyCommand.Definition
$drivername = "SHARP UD3 PCL6"

# Set the IP address to match the IP of the printer you are installing
$portName = "IP_XX.XX.XX.XX"
$PortAddress = "XX.XX.XX.XX"

# Staging Drivers
pnputil.exe /add-driver "$psscriptroot\sv0ejenu.inf" /install

# Installing Drivers
Add-PrinterDriver -Name $drivername

# Install Printerport | Check if the port already exist
$checkPortExists = Get-Printerport -Name $portname -ErrorAction SilentlyContinue
if (-not $checkPortExists) 
{
Add-PrinterPort -name $portName -PrinterHostAddress $PortAddress
}

# Check if Printer Driver Exists
$printDriverExists = Get-PrinterDriver -name $DriverName -ErrorAction SilentlyContinue

# Install Printer
if ($printDriverExists)
{
Add-Printer -Name "Sharp_MXC304WFH" -PortName $portName -DriverName $DriverName
}
else
{
Write-Warning "Printer Driver not installed"
}

SLEEP 60
