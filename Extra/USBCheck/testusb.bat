@echo off

powershell -Command "$devices = Get-PnpDevice | Where-Object {$_.InstanceId -like 'USB*VID*' -and ($_.FriendlyName -like '*Mass Storage*' -or $_.FriendlyName -like '*SCSI*' -or $_.Class -eq 'DiskDrive')} | Sort-Object FriendlyName -Unique; $count = 0; foreach ($device in $devices) { if ($device.InstanceId -match 'VID_([0-9A-F]{4}).*PID_([0-9A-F]{4})') { $vendorId = $matches[1]; $productId = $matches[2]; $count++; Write-Host ''; Write-Host '========================================' -ForegroundColor DarkGray; Write-Host 'DEVICE #'$count -ForegroundColor White; Write-Host '========================================' -ForegroundColor DarkGray; Write-Host 'Name:' $device.FriendlyName -ForegroundColor Cyan; Write-Host 'VID_'$vendorId' & PID_'$productId -ForegroundColor Green; Write-Host ''; switch ($vendorId) { '13FE' { Write-Host 'CONTROLLER: Phison Electronics' -ForegroundColor Yellow; Write-Host '  Models: PS2251, PS2303, PS2307' -ForegroundColor Gray } '0BDA' { Write-Host 'CONTROLLER: Realtek Semiconductor' -ForegroundColor Yellow; Write-Host '  Models: RTS5301, RTS5311, RTS5326' -ForegroundColor Gray } '058F' { Write-Host 'CONTROLLER: Alcor Micro' -ForegroundColor Yellow; Write-Host '  Models: AU6989, AU6390, AU6398' -ForegroundColor Gray } '090C' { Write-Host 'CONTROLLER: Silicon Motion' -ForegroundColor Yellow; Write-Host '  Models: SM3267, SM3280, SM2258XT' -ForegroundColor Gray } '1E3D' { Write-Host 'CONTROLLER: Innostor/Chipsbank' -ForegroundColor Yellow; Write-Host '  Models: IS888, IS903, IS917, CBM2099' -ForegroundColor Gray; if ($productId -eq '1780') { Write-Host '  >> IDENTIFIED: Innostor IS888 (USB-NVMe bridge)' -ForegroundColor Magenta } } '8564' { Write-Host 'CONTROLLER: JMicron' -ForegroundColor Yellow; Write-Host '  Models: JMS567, JMS578, JMF60x' -ForegroundColor Gray } '0EA0' { Write-Host 'CONTROLLER: Ours Technology' -ForegroundColor Yellow; Write-Host '  Models: OTI-6828, OTI-2168' -ForegroundColor Gray } '2537' { Write-Host 'CONTROLLER: Innostor Technology' -ForegroundColor Yellow; Write-Host '  Models: IS888, IS916, IS917' -ForegroundColor Gray } '0951' { Write-Host 'CONTROLLER: Kingston (Rebadged)' -ForegroundColor Yellow; if ($productId -eq '1780') { Write-Host '  >> IDENTIFIED: Innostor IS888' -ForegroundColor Magenta } elseif ($productId -eq '16AE') { Write-Host '  >> IDENTIFIED: DataTraveler microDuo 3C' -ForegroundColor Magenta; Write-Host '  Likely uses: Phison or SMI controller' -ForegroundColor Gray } else { Write-Host '  Uses: Phison, Innostor, or SMI chips' -ForegroundColor Gray } } '14CD' { Write-Host 'CONTROLLER: Super Top' -ForegroundColor Yellow; Write-Host '  Common in: Generic USB enclosures' -ForegroundColor Gray } default { Write-Host 'CONTROLLER: Unknown (VID not in database)' -ForegroundColor Red; Write-Host '  Search: VID_'$vendorId' PID_'$productId' controller' -ForegroundColor Gray } } } } Write-Host ''; Write-Host '========================================' -ForegroundColor DarkGray; Write-Host 'Total USB Storage Devices Found:'$count -ForegroundColor White; Write-Host '========================================' -ForegroundColor DarkGray"

echo.
echo ========================================
echo Note: Device brands (Kingston, SanDisk, etc) 
echo often use different controller chips.
echo ========================================
echo Manual VID/PID Extraction
echo ========================================
wmic path Win32_PnPEntity where "DeviceID like 'USB%%'" get DeviceID | findstr /i "VID_"
echo.

echo ========================================
echo Lookup your chip:
echo 1. Note your VID and PID above
echo 2. Search: "USB VID_xxxx PID_1780 controller"
echo 3. Or visit: https://devicehunt.com or https://the-sz.com/products/usbid/
echo ========================================
echo.

pause