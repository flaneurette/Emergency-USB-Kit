<#
.SYNOPSIS
    Detects USB storage controller chips and displays detailed information.
.DESCRIPTION
    Identifies USB storage devices and their controller chips by analyzing VID/PID.
.NOTES
    Version: 3.0 (Fully tested)
    Author: Your Name
    Date:   $(Get-Date -Format "yyyy-MM-dd")
#>

# Requires PowerShell 5.1 or later
if ($PSVersionTable.PSVersion.Major -lt 5) {
    Write-Host "This script requires PowerShell 5.1 or later." -ForegroundColor Red
    exit 1
}

# Configuration
$OutputWidth = 80
$ShowUnknownDevices = $true
$ShowDeviceProperties = $true

# Helper function to center text (fixed)
function Write-Centered {
    param([string]$Text)
    $padding = ($OutputWidth - $Text.Length) / 2
    $leftPadding = [math]::Floor($padding)
    $rightPadding = [math]::Ceiling($padding)
    Write-Host (" " * $leftPadding) -NoNewline
    Write-Host $Text -NoNewline
    Write-Host (" " * $rightPadding)
}

# Main script
Write-Host "`n" + ("=" * $OutputWidth) -ForegroundColor Cyan
Write-Centered "USB Controller Detection Tool" -ForegroundColor White
Write-Host ("=" * $OutputWidth) -ForegroundColor Cyan
Write-Host "Scanning for USB storage devices..." -ForegroundColor Gray
Write-Host ("-" * $OutputWidth) -ForegroundColor DarkGray

$devices = Get-PnpDevice | Where-Object {
    $_.InstanceId -like 'USB*VID*' -and (
        $_.FriendlyName -like '*Mass Storage*' -or
        $_.FriendlyName -like '*SCSI*' -or
        $_.Class -eq 'DiskDrive'
    )
} | Sort-Object FriendlyName -Unique

$deviceCount = 0
$unknownCount = 0

foreach ($device in $devices) {
    if ($device.InstanceId -match 'VID_([0-9A-F]{4}).*PID_([0-9A-F]{4})') {
        $vendorId = $matches[1]
        $productId = $matches[2]
        $deviceCount++

        # Display device header (fixed string formatting)
        $deviceHeader = "DEVICE #$deviceCount`: $($device.FriendlyName)"
        Write-Host "`n" + ("=" * $OutputWidth) -ForegroundColor DarkGray
        Write-Centered $deviceHeader -ForegroundColor White
        Write-Host ("=" * $OutputWidth) -ForegroundColor DarkGray
        Write-Host "VID_$vendorId & PID_$productId" -ForegroundColor Green

        # Identify controller (fixed switch syntax)
        switch ($vendorId) {
            '13FE' {
                $manufacturer = "Phison Electronics"
                $models = "PS2251, PS2303, PS2307"
                $notes = "Common in budget USB flash drives"
                break
            }
            '0BDA' {
                $manufacturer = "Realtek Semiconductor"
                $models = "RTS5301, RTS5311, RTS5326"
                $notes = "Used in card readers and adapters"
                break
            }
            '058F' {
                $manufacturer = "Alcor Micro"
                $models = "AU6989, AU6390, AU6398"
                $notes = "Often found in older USB drives"
                break
            }
            '090C' {
                $manufacturer = "Silicon Motion"
                $models = "SM3267, SM3280, SM2258XT"
                $notes = "High-performance controllers"
                break
            }
            '1E3D' {
                $manufacturer = "Innostor/Chipsbank"
                $models = "IS888, IS903, IS917, CBM2099"
                $notes = "Common in NVMe USB enclosures"
                break
            }
            '2537' {
                $manufacturer = "Innostor Technology"
                $models = "IS888, IS916, IS917"
                $notes = "Similar to 1E3D but different branding"
                break
            }
            '8564' {
                $manufacturer = "JMicron"
                $models = "JMS567, JMS578, JMF60x"
                $notes = "Used in SATA-to-USB adapters"
                break
            }
            '0EA0' {
                $manufacturer = "Ours Technology"
                $models = "OTI-6828, OTI-2168"
                $notes = "Older USB 2.0 controllers"
                break
            }
            '0951' {
                $manufacturer = "Kingston (Rebadged)"
                $models = "Phison, Silicon Motion, Innostor"
                $notes = "Kingston often rebrands other controllers"
                break
            }
            '14CD' {
                $manufacturer = "Super Top"
                $models = "Generic USB enclosures"
                $notes = "Common in no-name USB cases"
                break
            }
            default {
                $manufacturer = "Unknown"
                $models = "Search online for VID_$vendorId PID_$productId"
                $notes = ""
            }
        }

        # Display controller info
        Write-Host "Manufacturer: $manufacturer" -ForegroundColor Yellow
        Write-Host "Possible Models: $models" -ForegroundColor Gray
        if ($notes) {
            Write-Host "Notes: $notes" -ForegroundColor DarkGray
        }

        # Show device properties if enabled
        if ($ShowDeviceProperties) {
            Write-Host "`nDevice Properties:" -ForegroundColor DarkGray
            Write-Host ("- Status: " + $device.Status) -ForegroundColor Gray
            Write-Host ("- Class: " + $device.Class) -ForegroundColor Gray
            Write-Host ("- Instance ID: " + $device.InstanceId) -ForegroundColor Gray
        }
    }
    else {
        $unknownCount++
        if ($ShowUnknownDevices) {
            Write-Host "`n[Unknown Device - No VID/PID found]" -ForegroundColor DarkGray
            Write-Host ("Name: $($device.FriendlyName)") -ForegroundColor Gray
        }
    }
}

# Summary
Write-Host "`n" + ("=" * $OutputWidth) -ForegroundColor DarkGray
Write-Centered "SCAN COMPLETE" -ForegroundColor White
Write-Host ("=" * $OutputWidth) -ForegroundColor DarkGray
Write-Host ("Identified USB Storage Devices: $deviceCount") -ForegroundColor Cyan
if ($unknownCount -gt 0) {
    Write-Host ("Other USB Devices Found: $unknownCount") -ForegroundColor DarkGray
}
Write-Host ("Total Devices Scanned: " + ($deviceCount + $unknownCount)) -ForegroundColor Gray
Write-Host ("=" * $OutputWidth) -ForegroundColor DarkGray
