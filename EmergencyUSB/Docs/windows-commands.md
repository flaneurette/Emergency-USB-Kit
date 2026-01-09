# Windows Commands Reference Guide

---

## Most Commonly Used Commands

### File and Directory Operations

```cmd
# Navigate directories
cd C:\Users\Username      # Change directory
cd ..                     # Go up one level
cd \                      # Go to root
dir                       # List files
dir /a                    # Show all files (including hidden)
dir /s                    # List recursively
tree                      # Show directory tree
tree /f                   # Show tree with files

# Create and remove
mkdir FolderName          # Create directory
md FolderName             # Same as mkdir
rmdir FolderName          # Remove empty directory
rmdir /s FolderName       # Remove directory and contents
rd /s /q FolderName       # Force remove without prompt
del file.txt              # Delete file
del *.tmp                 # Delete all .tmp files
del /f /q file.txt        # Force delete without prompt

# Copy and move
copy source.txt dest.txt  # Copy file
xcopy source dest /E /I   # Copy directory tree
robocopy source dest /E   # Robust copy (better for large operations)
move source.txt dest.txt  # Move or rename
ren old.txt new.txt       # Rename file
rename old.txt new.txt    # Same as ren

# View files
type file.txt             # Display file content
more file.txt             # Display file page by page
notepad file.txt          # Open in Notepad

# Search in files
findstr "pattern" file.txt           # Search for text in file
findstr /s /i "pattern" *.*          # Search recursively, case-insensitive
find "text" file.txt                 # Simple text search

# Find files
dir /s /b filename.txt    # Find file in current and subdirectories
where filename.exe        # Find file in PATH
```

### File Attributes and Permissions

```cmd
# View attributes
attrib file.txt           # Show file attributes
dir /a                    # Show files with attributes

# Set attributes
attrib +r file.txt        # Set read-only
attrib -r file.txt        # Remove read-only
attrib +h file.txt        # Set hidden
attrib +s file.txt        # Set system file
attrib +a file.txt        # Set archive bit

# Permissions (requires admin)
icacls file.txt           # View permissions
icacls file.txt /grant Users:F         # Grant full control
icacls file.txt /remove Users          # Remove permissions
icacls folder /grant Users:(OI)(CI)F   # Grant recursive permissions
takeown /f file.txt       # Take ownership
takeown /f folder /r /d y # Take ownership recursively
```

### Process Management

```cmd
# View processes
tasklist                  # List all processes
tasklist /v               # Verbose output
tasklist | findstr "chrome"  # Find specific process
tasklist /svc             # Show services for each process

# Kill processes
taskkill /PID 1234        # Kill by process ID
taskkill /IM chrome.exe   # Kill by image name
taskkill /F /IM app.exe   # Force kill
taskkill /F /PID 1234     # Force kill by PID

# Start processes
start notepad.exe         # Start application
start "" "C:\Program Files\App\app.exe"  # Start with full path
start /min app.exe        # Start minimized
start /max app.exe        # Start maximized
start /b app.exe          # Start without new window
```

### System Information

```cmd
# System info
systeminfo                # Detailed system information
systeminfo | findstr /B /C:"OS Name" /C:"OS Version"
hostname                  # Computer name
ver                       # Windows version
wmic os get caption,version  # OS version via WMI
whoami                    # Current user
whoami /all               # User with groups and privileges

# Hardware info
wmic cpu get name         # CPU information
wmic memorychip get capacity  # RAM information
wmic diskdrive get model,size  # Disk information
wmic bios get serialnumber     # BIOS serial number

# Disk information
vol                       # Volume label and serial number
diskpart                  # Disk partitioning tool (interactive)
wmic logicaldisk get name,size,freespace  # Disk space

# Check disk space
dir C:\                   # See available space at bottom
fsutil volume diskfree C: # Free space details
```

### Network Commands

```cmd
# Network configuration
ipconfig                  # IP configuration
ipconfig /all             # Detailed network info
ipconfig /release         # Release DHCP lease
ipconfig /renew           # Renew DHCP lease
ipconfig /flushdns        # Clear DNS cache
ipconfig /displaydns      # Show DNS cache

# Connectivity testing
ping google.com           # Test connectivity
ping -n 10 8.8.8.8        # Ping 10 times
ping -t google.com        # Continuous ping (Ctrl+C to stop)
tracert google.com        # Trace route
pathping google.com       # Combined ping and traceroute

# Network statistics
netstat -an               # All connections and listening ports
netstat -ano              # With process IDs
netstat -b                # With executable names (requires admin)
netstat -r                # Routing table
route print               # Display routing table

# DNS
nslookup google.com       # DNS lookup
nslookup google.com 8.8.8.8  # Use specific DNS server

# Network shares
net view                  # View network computers
net view \\computername   # View shared resources
net use Z: \\server\share # Map network drive
net use Z: /delete        # Remove network drive
net share                 # View local shares

# ARP
arp -a                    # View ARP cache
```

### User Management

```cmd
# User operations (requires admin)
net user                  # List users
net user username         # View user details
net user username password /add  # Create user
net user username /delete # Delete user
net user username *       # Change password (prompts)
net user username /active:yes    # Enable user
net user username /active:no     # Disable user

# Local groups
net localgroup            # List groups
net localgroup Administrators  # List group members
net localgroup Administrators username /add  # Add to group
net localgroup Administrators username /delete  # Remove from group

# Current user info
whoami                    # Current username
whoami /priv              # Current user privileges
whoami /groups            # Current user groups
net user %username%       # Current user details
```

### Services Management

```cmd
# Service operations (requires admin)
net start                 # List running services
net start "Service Name"  # Start service
net stop "Service Name"   # Stop service
net pause "Service Name"  # Pause service
net continue "Service Name"  # Resume service

# Using sc (Service Control)
sc query                  # List services
sc query "Service Name"   # Query specific service
sc start "Service Name"   # Start service
sc stop "Service Name"    # Stop service
sc config "Service Name" start= auto  # Set to automatic
sc config "Service Name" start= disabled  # Disable service
sc delete "Service Name"  # Delete service
```

### Windows Management

```cmd
# Shutdown and restart
shutdown /s               # Shutdown
shutdown /s /t 60         # Shutdown in 60 seconds
shutdown /r               # Restart
shutdown /r /t 0          # Restart immediately
shutdown /a               # Abort shutdown
shutdown /h               # Hibernate
shutdown /l               # Log off
shutdown /s /f            # Force shutdown (close apps)

# Power management
powercfg /energy          # Generate energy report
powercfg /batteryreport   # Generate battery report
powercfg /list            # List power schemes
powercfg /hibernate on    # Enable hibernation
```

### Registry Operations

```cmd
# Registry editing (use with EXTREME caution!)
reg query HKLM\Software   # Query registry key
reg add HKLM\Software\Key /v ValueName /t REG_SZ /d "data"  # Add value
reg delete HKLM\Software\Key /v ValueName  # Delete value
reg export HKLM\Software backup.reg  # Export registry key
reg import backup.reg     # Import registry file

# Common registry locations:
# HKLM = HKEY_LOCAL_MACHINE (system-wide)
# HKCU = HKEY_CURRENT_USER (current user)
# HKCR = HKEY_CLASSES_ROOT (file associations)
```

### Archive and Compression

```cmd
# Using built-in expand
expand compressed.cab expanded_file  # Expand CAB file

# Using PowerShell for ZIP
powershell Compress-Archive -Path C:\folder -DestinationPath archive.zip
powershell Expand-Archive -Path archive.zip -DestinationPath C:\folder

# Using tar (Windows 10+)
tar -czf archive.tar.gz folder       # Create compressed archive
tar -xzf archive.tar.gz              # Extract archive
tar -tf archive.tar.gz               # List contents
```

---

## Emergency & Recovery Commands

### System Won't Boot - Safe Mode

```cmd
# Boot into Safe Mode:
# Method 1: During boot, press F8 repeatedly
# Method 2: From running Windows:
bcdedit /set {default} safeboot minimal  # Enable safe mode
# Reboot, then disable safe mode:
bcdedit /deletevalue {default} safeboot

# Boot into Safe Mode with Networking:
bcdedit /set {default} safeboot network

# Advanced Boot Options:
shutdown /r /o            # Restart to advanced options

# Boot to Command Prompt:
bcdedit /set {default} safeboot minimal
bcdedit /set {default} safebootalternateshell yes
```

### Disk Full Emergency

```cmd
# Check disk space
wmic logicaldisk get name,size,freespace
dir C:\                   # See space at bottom

# Find large files
forfiles /S /M * /C "cmd /c if @fsize GEQ 104857600 echo @path @fsize"  # Files > 100MB

# Clean up using Disk Cleanup
cleanmgr /d C:            # Open disk cleanup
cleanmgr /sageset:1       # Configure cleanup
cleanmgr /sagerun:1       # Run configured cleanup

# Clear Windows Update cache
net stop wuauserv
net stop bits
del /f /s /q %windir%\SoftwareDistribution\*
net start wuauserv
net start bits

# Clear temp files
del /f /s /q %temp%\*
del /f /s /q C:\Windows\Temp\*
del /f /s /q C:\Windows\Prefetch\*

# Clear browser cache (manually specify paths)
# Chrome:
del /f /s /q "%LocalAppData%\Google\Chrome\User Data\Default\Cache\*"
# Firefox:
del /f /s /q "%LocalAppData%\Mozilla\Firefox\Profiles\*.default\cache2\*"

# Find largest directories
dir /s /a /o-s C:\       # Sort by size (takes time)
```

### System Frozen/Unresponsive

```cmd
# Emergency restart shortcuts:
# Ctrl+Alt+Delete → Power button → Restart
# Win+Ctrl+Shift+B → Reset graphics driver

# From Command Prompt (if accessible):
shutdown /r /f /t 0       # Force immediate restart

# Kill unresponsive applications:
taskkill /F /IM explorer.exe    # Kill and restart Explorer
start explorer.exe

# Find and kill high CPU process:
tasklist /v | sort          # View processes
wmic process where "name='app.exe'" get processid
taskkill /F /PID 1234

# Restart Windows Explorer:
taskkill /F /IM explorer.exe && start explorer.exe
```

### Forgot Password / Locked Out

```cmd
# Using Windows Installation Media or Recovery Drive:

# 1. Boot from installation media
# 2. Press Shift+F10 to open Command Prompt
# 3. Replace Utilman.exe with cmd.exe:

move C:\Windows\System32\Utilman.exe C:\Windows\System32\Utilman.exe.bak
copy C:\Windows\System32\cmd.exe C:\Windows\System32\Utilman.exe

# 4. Reboot to login screen
# 5. Click Ease of Access button (now opens cmd as SYSTEM)
# 6. Reset password:

net user username newpassword
net user Administrator /active:yes
net user Administrator newpassword

# 7. Restore Utilman.exe after login:
move C:\Windows\System32\Utilman.exe.bak C:\Windows\System32\Utilman.exe

# Alternative: Create new admin account
net user NewAdmin NewPassword123! /add
net localgroup Administrators NewAdmin /add
```

### Network Connection Issues

```cmd
# Reset network stack
netsh winsock reset       # Reset Winsock catalog
netsh int ip reset        # Reset TCP/IP stack
ipconfig /release         # Release IP
ipconfig /flushdns        # Flush DNS cache
ipconfig /renew           # Renew IP

# Reset network adapter
netsh interface set interface "Wi-Fi" disabled
netsh interface set interface "Wi-Fi" enabled

# Reset all network settings (Windows 10+)
netsh winsock reset
netsh int ip reset
netsh advfirewall reset
ipconfig /release
ipconfig /renew
ipconfig /flushdns

# Restart network services
net stop "Network Connections"
net start "Network Connections"
net stop "DHCP Client"
net start "DHCP Client"

# Check network adapter status
netsh interface show interface
wmic nic get name,netconnectionstatus
```

### Emergency Backup

```cmd
# Quick backup to external drive (assume E: is external)

# Backup user data
robocopy C:\Users\%USERNAME%\Documents E:\Backup\Documents /E /Z /R:3 /W:5
robocopy C:\Users\%USERNAME%\Desktop E:\Backup\Desktop /E /Z /R:3 /W:5
robocopy C:\Users\%USERNAME%\Pictures E:\Backup\Pictures /E /Z /R:3 /W:5

# Backup with date stamp
robocopy C:\ImportantData E:\Backup\Data_%date:~-4,4%%date:~-10,2%%date:~-7,2% /E /Z

# Create system image (requires admin)
wbadmin start backup -backupTarget:E: -include:C: -allCritical -quiet

# Export registry
reg export HKLM E:\Backup\HKLM.reg
reg export HKCU E:\Backup\HKCU.reg

# List installed programs
wmic product get name,version > E:\Backup\installed_programs.txt

# Backup drivers
dism /online /export-driver /destination:E:\Backup\Drivers
```

### High CPU/Memory Usage

```cmd
# Find resource hogs
tasklist /v | sort /+4     # Sort by memory
wmic process get name,workingsetsize | sort  # Memory usage

# Find top CPU users
wmic path Win32_PerfFormattedData_PerfProc_Process get Name,PercentProcessorTime | sort

# Detailed process info
wmic process where processid=1234 get *

# Kill resource hog
taskkill /F /IM app.exe
taskkill /F /PID 1234

# Clear standby memory (requires admin)
# Download RAMMap from Microsoft Sysinternals or:
powershell Clear-RecycledMemory  # Windows 10+
```

---

## System Rescue Operations

### Rescue Using Installation Media

```cmd
# Boot from Windows installation media
# Choose "Repair your computer" → "Troubleshoot" → "Command Prompt"

# 1. Identify system drive (may not be C:)
diskpart
list volume               # Find Windows volume
exit

# 2. Common rescue operations:

# Check and repair disk
chkdsk C: /f /r          # Check and fix errors
chkdsk C: /x             # Force dismount and check

# System File Checker
sfc /scannow             # Scan and repair system files
# If Windows is on D: (from recovery)
sfc /scannow /offbootdir=D:\ /offwindir=D:\Windows

# DISM - Repair Windows image
DISM /Online /Cleanup-Image /ScanHealth
DISM /Online /Cleanup-Image /RestoreHealth
# Offline repair:
DISM /Image:D:\ /Cleanup-Image /RestoreHealth

# Repair boot files
bootrec /fixmbr          # Fix Master Boot Record
bootrec /fixboot         # Write new boot sector
bootrec /scanos          # Scan for Windows installations
bootrec /rebuildbcd      # Rebuild boot configuration

# Rebuild BCD from scratch
bcdedit /export C:\BCD_Backup
attrib C:\boot\bcd -h -r -s
ren C:\boot\bcd bcd.old
bootrec /rebuildbcd

# Restore from System Restore Point
rstrui.exe               # Opens System Restore wizard
```

### Fix Corrupted Windows

```cmd
# System File Checker
sfc /scannow             # Scan and repair
sfc /verifyonly          # Scan only, don't repair

# View SFC log
findstr /c:"[SR]" %windir%\Logs\CBS\CBS.log > "%userprofile%\Desktop\sfcdetails.txt"

# DISM - Deployment Image Servicing
DISM /Online /Cleanup-Image /CheckHealth      # Quick check
DISM /Online /Cleanup-Image /ScanHealth       # Detailed scan
DISM /Online /Cleanup-Image /RestoreHealth    # Repair

# Using install media as source (if above fails)
DISM /Online /Cleanup-Image /RestoreHealth /Source:E:\Sources\install.wim:1 /LimitAccess

# Repair Windows Update
DISM /Online /Cleanup-Image /RestoreHealth
net stop wuauserv
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
net start wuauserv

# Re-register Windows Store apps (if broken)
powershell -ExecutionPolicy Unrestricted Add-AppxPackage -DisableDevelopmentMode -Register $Env:SystemRoot\WinStore\AppxManifest.xml
```

### Check System Health and Logs

```cmd
# Event Viewer (GUI)
eventvwr.msc

# Command line event logs
wevtutil qe System /c:20 /f:text         # Last 20 system events
wevtutil qe Application /c:20 /f:text    # Last 20 application events
wevtutil qe Security /c:20 /f:text       # Security events

# Query specific event
wevtutil qe System /q:"*[System[(Level=2)]]" /f:text  # Errors only

# Export event log
wevtutil epl System C:\system_log.evtx

# Windows reliability history
perfmon /rel

# View system information
msinfo32                 # System Information GUI
systeminfo > systeminfo.txt

# Hardware diagnostics
mdsched.exe              # Memory diagnostic
perfmon /report          # System diagnostic report (takes 60 sec)

# Check disk health
wmic diskdrive get status
wmic diskdrive get status,model,size,interfacetype
```

### Security Emergency - Malware Suspected

```cmd
# 1. Disconnect from network
ipconfig /release
netsh interface set interface "Wi-Fi" disabled

# 2. Check running processes
tasklist /v
wmic process get name,executablepath,processid

# 3. Check startup programs
wmic startup get caption,command
msconfig                 # Startup tab (GUI)

# 4. Check scheduled tasks
schtasks /query /fo LIST /v

# 5. Check services
net start
sc query state= all

# 6. Check network connections
netstat -ano            # Active connections
netstat -bano           # With executables (admin required)

# 7. Check hosts file
notepad C:\Windows\System32\drivers\etc\hosts

# 8. Recent file modifications
forfiles /P C:\ /S /D -1 /C "cmd /c echo @path @fdate"  # Last 24 hours

# 9. Check user accounts
net user                # List users
net localgroup Administrators  # Check admin group

# 10. Scan with Windows Defender (offline)
# Download Windows Defender Offline and boot from it

# 11. Check autorun locations
reg query HKLM\Software\Microsoft\Windows\CurrentVersion\Run
reg query HKCU\Software\Microsoft\Windows\CurrentVersion\Run

# 12. Export security logs
wevtutil epl Security C:\security_log.evtx
```

### Windows Update Issues

```cmd
# Check Windows Update service
sc query wuauserv

# Stop Windows Update service
net stop wuauserv
net stop bits

# Clear update cache
del /f /s /q %windir%\SoftwareDistribution\*
del /f /s /q %windir%\System32\catroot2\*

# Restart services
net start wuauserv
net start bits

# Reset Windows Update components
net stop wuauserv
net stop cryptSvc
net stop bits
net stop msiserver
ren C:\Windows\SoftwareDistribution SoftwareDistribution.old
ren C:\Windows\System32\catroot2 catroot2.old
net start wuauserv
net start cryptSvc
net start bits
net start msiserver

# Force Windows Update check
wuauclt /detectnow
# Or on Windows 10+:
usoclient StartScan

# View update history
wmic qfe list           # List installed updates
wmic qfe get InstalledOn,HotFixID  # With dates
```

---

## Network Emergency Commands

### No Internet Connection

```cmd
# Step 1: Check adapter status
ipconfig /all
netsh interface show interface

# Step 2: Basic troubleshooting
ipconfig /release
ipconfig /flushdns
ipconfig /renew

# Step 3: Reset network stack
netsh winsock reset
netsh int ip reset
netsh advfirewall reset

# Step 4: Restart network adapter
netsh interface set interface "Ethernet" disabled
timeout /t 3
netsh interface set interface "Ethernet" enabled

# Step 5: Check DNS
nslookup google.com
nslookup google.com 8.8.8.8    # Test alternate DNS

# Step 6: Set DNS manually (if needed)
netsh interface ip set dns "Ethernet" static 8.8.8.8 primary
netsh interface ip add dns "Ethernet" 8.8.4.4 index=2

# Step 7: Check default gateway
route print
ping [gateway IP]

# Step 8: Reset Windows network
# Settings → Network & Internet → Network reset
# Or from Command Prompt:
netcfg -d               # Remove all network components
```

### Diagnose Network Problems

```cmd
# Network diagnostics
netsh interface ip show config
netsh interface ip show dns
route print

# Test connectivity at different layers
ping 127.0.0.1          # Loopback (network stack working?)
ping [your IP]          # Self (network adapter working?)
ping [gateway IP]       # Router (local network working?)
ping 8.8.8.8            # External IP (internet working?)
ping google.com         # DNS (name resolution working?)

# Trace route
tracert google.com
pathping google.com     # More detailed

# Network statistics
netstat -e              # Ethernet statistics
netstat -s              # Per-protocol statistics

# Check for packet loss
ping -n 100 google.com

# Identify what's using network
netstat -ano | findstr ESTABLISHED
# Find process: tasklist /FI "PID eq [PID]"

# Test specific port
telnet google.com 80
# Or using PowerShell:
Test-NetConnection google.com -Port 80
```

### Firewall Issues

```cmd
# Check firewall status
netsh advfirewall show allprofiles

# Disable firewall (EMERGENCY ONLY!)
netsh advfirewall set allprofiles state off

# Enable firewall
netsh advfirewall set allprofiles state on

# Allow program through firewall
netsh advfirewall firewall add rule name="MyApp" dir=in action=allow program="C:\path\to\app.exe" enable=yes

# Allow port
netsh advfirewall firewall add rule name="Port 80" dir=in action=allow protocol=TCP localport=80

# List firewall rules
netsh advfirewall firewall show rule name=all

# Delete rule
netsh advfirewall firewall delete rule name="MyApp"

# Reset firewall to defaults
netsh advfirewall reset

# Open Windows Firewall GUI
firewall.cpl
```

### Wi-Fi Problems

```cmd
# View Wi-Fi profiles
netsh wlan show profiles

# View saved password for network
netsh wlan show profile name="NetworkName" key=clear

# Delete Wi-Fi profile
netsh wlan delete profile name="NetworkName"

# Connect to network
netsh wlan connect name="NetworkName"

# Disconnect
netsh wlan disconnect

# Show available networks
netsh wlan show networks

# Wi-Fi adapter troubleshooting
netsh wlan show interfaces
netsh wlan show drivers

# Restart Wi-Fi adapter
netsh interface set interface "Wi-Fi" disabled
timeout /t 2
netsh interface set interface "Wi-Fi" enabled

# Generate Wi-Fi report
netsh wlan show wlanreport
# Opens report in: C:\ProgramData\Microsoft\Windows\WlanReport\
```

---

## Security & Access Recovery

### Password and Account Recovery

```cmd
# Reset user password (requires admin)
net user username newpassword

# Enable built-in Administrator account
net user Administrator /active:yes
net user Administrator password

# Create emergency admin account
net user EmergencyAdmin Password123! /add
net localgroup Administrators EmergencyAdmin /add

# View account status
net user username

# Unlock account
net user username /active:yes

# Remove password expiration
wmic useraccount where name='username' set PasswordExpires=false
```

### Security Policy Reset

```cmd
# Reset local security policy
secedit /configure /cfg %windir%\inf\defltbase.inf /db defltbase.sdb /verbose

# View account lockout policy
net accounts

# Reset account lockout
net accounts /lockoutduration:0
net accounts /lockoutthreshold:0

# View password policy
net accounts

# Disable password complexity
secedit /export /cfg C:\secpol.cfg
notepad C:\secpol.cfg
# Edit PasswordComplexity = 0
secedit /configure /db C:\Windows\security\local.sdb /cfg C:\secpol.cfg /areas SECURITYPOLICY
```

### File/Folder Access Issues

```cmd
# Take ownership of file/folder
takeown /f "C:\path\to\file" /r /d y
icacls "C:\path\to\file" /grant %username%:F /t

# Grant full control to everyone (use carefully!)
icacls "C:\path" /grant Everyone:F /t

# Reset permissions to default
icacls "C:\path" /reset /t

# Remove inheritance
icacls "C:\path" /inheritance:d

# View current permissions
icacls "C:\path"

# Fix common permission issues on user folder
takeown /f "C:\Users\%username%" /r /d y
icacls "C:\Users\%username%" /grant %username%:F /t
```

### BitLocker Recovery

```cmd
# Check BitLocker status
manage-bde -status

# Unlock BitLocker drive
manage-bde -unlock E: -RecoveryPassword [48-digit-recovery-key]

# Suspend BitLocker
manage-bde -protectors -disable C:

# Resume BitLocker
manage-bde -protectors -enable C:

# View recovery key
manage-bde -protectors -get C:

# Turn off BitLocker
manage-bde -off C:
```

---

## PowerShell Emergency Commands

### Essential PowerShell for Emergencies

```powershell
# Get command help
Get-Help [command]
Get-Command *process*     # Find commands

# Process management
Get-Process               # List processes
Get-Process | Sort-Object CPU -Descending | Select-Object -First 10
Stop-Process -Name notepad
Stop-Process -Id 1234 -Force

# Service management
Get-Service
Get-Service -Name wuauserv
Start-Service -Name wuauserv
Stop-Service -Name wuauserv
Restart-Service -Name wuauserv

# Network
Test-Connection google.com
Test-NetConnection google.com -Port 443
Get-NetAdapter
Get-NetIPAddress
Get-NetRoute

# File operations
Get-ChildItem -Recurse -Force     # Like ls -la recursive
Get-ChildItem -Recurse | Where-Object {$_.Length -gt 100MB}  # Large files
Get-Content file.txt              # Read file
Set-Content file.txt "content"    # Write file

# System information
Get-ComputerInfo
Get-HotFix                        # Installed updates
Get-EventLog -LogName System -Newest 20  # Recent system events

# Disk operations
Get-Disk
Get-Volume
Get-PhysicalDisk | Select-Object FriendlyName, HealthStatus

# Windows Update
Get-WindowsUpdate
Install-WindowsUpdate -AcceptAll -AutoReboot
```

---

## Quick Reference Card

### One-Liners for Emergencies

```cmd
# Emergency restart
shutdown /r /f /t 0

# Kill all processes for user
taskkill /F /FI "USERNAME eq username"

# Find large files (>500MB)
forfiles /S /M * /C "cmd /c if @fsize GEQ 524288000 echo @path"

# Clear all temp files
del /f /s /q %temp%\* && del /f /s /q C:\Windows\Temp\*

# Network reset
netsh winsock reset && netsh int ip reset && ipconfig /flushdns

# Check disk
chkdsk C: /f /r

# System file check
sfc /scannow

# Fix Windows image
DISM /Online /Cleanup-Image /RestoreHealth

# Enable Administrator
net user Administrator /active:yes

# Create admin account
net user Admin Pass123! /add && net localgroup Administrators Admin /add

# Take ownership
takeown /f "C:\path" /r /d y && icacls "C:\path" /grant %username%:F /t

# View system info quickly
systeminfo | findstr /B /C:"OS Name" /C:"OS Version" /C:"System Boot Time"

# Check running services
net start

# Export event log
wevtutil epl System C:\system.evtx

# Generate system report
perfmon /report

# Clear DNS cache
ipconfig /flushdns

# Reset network adapter
netsh interface set interface "Ethernet" disabled && timeout /t 2 && netsh interface set interface "Ethernet" enabled

# Check Windows activation
slmgr /xpr
```

---

## Essential Windows Recovery Tools

### Built-in Tools You Should Know

```cmd
# System Configuration
msconfig                  # Boot, services, startup

# Registry Editor
regedit                   # CAUTION: Can break Windows!

# Device Manager
devmgmt.msc              # Hardware troubleshooting

# Disk Management
diskmgmt.msc             # Partition management

# Event Viewer
eventvwr.msc

