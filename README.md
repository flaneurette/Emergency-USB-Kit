
# Emergency USB Kit Guide

> Creating a emergency USB stick is useful. This document tells you how.

> Goal: have emergency access to computer services for at least **5 years continuously** (extreme long and persistent situation)

> Due to copyrights and so on, I cannot add all software in this repo. Please download ISOs/exe yourself. (always get the latest anyway and support the author(s) where possible)

### Requirements

- 2 x USB SLC/MLC stick, or 4 x TLC/QLC USB sticks 
- https://ventoy.net for multi ISO boot from single stick.
  
### Practical Idea

```
| Sticks |  Use Case                   | Size    | Best NAND                  | Notes                                                             |
| -------|---------------------------- | ------- | -------------------------- | ----------------------------------------------------------------- |
|   1-2x | Sensitive encrypted files   | 1-16 GB | SLC > MLC                  | Small capacity makes SLC affordable. Long retention + encrypted.  |
|   2 x  | Bootable emergency ISO/USB  | 16-32 GB| MLC if cheap, TLC fallback | ISO writes are infrequent. TLC is acceptable if price is right.   |
|   1 x  | High-use or large backup    | ≥64 GB  | SSD or TLC USB3            | TLC/QLC cheaper, better for capacity, but not ideal for archival. |
```

> NOTE: Sticks with capacity above 16GB is usually TLC/QLC for consumers. SLC is hard to find, MLC might be best choice.
> To find MLC: Google the datasheet of the stick, as they often won't say what type it is. Transcend often prints the type on the stick itself, making it easier to determine.

### Brands
```
SLC: Swissbit, Digikey
pSLC: Swissbit, Digikey
MLC: Transcend, Philips, some Kingston variants.
TLC: Any stick will do.
```

> TIP: I found that the phased out "Philips Vivid" series (4GB to 32GB) does have MLC. Above 32GB it seems, this series becomes TLC. 16GB-32GB now sells at about 5-6 euros, very cheap for MLC. These sticks may sell out quickly, as TLC is now standard. Check out the datasheet on Google: "FM32FD05B datasheet" for 32GB.


### Storage tips

```
Encryption:
VeraCrypt/LUKS container on SLC/MLC stick
Only mount when needed

Labeling:
Use dates and content description (no passwords!)

Redundancy:
Keep two sticks for sensitive files (mirrored)
Keep two sticks for ISOs/tools (mirror or separate ISOs)

Refresh yearly:
Mount and rewrite sensitive files yearly to prevent flash cell aging

Temperature & storage:
Store in cool, dry place (avoid heat, sunlight, magnets) preferably in anti-static bag.
```

### Recommended

- If you can get **SLC NAND** USB sticks, (rugged industrial uses, military grade) get them instead of newer TLC/QLC NAND 
- Newer sticks (TLC/QLC) wear down much faster, by factor 10-100x minimal, sometimes up to 1000x.
- 2 to 3 USB sticks of good quality. Minimum of 32GB, recommended: 64GB or 128GB a piece. Higher is possible, but they might fail quicker. Avoid anything above 512GB.
- At least 2 USB sticks, because of the survival mantra: **one is none, two is one.**
- If you need offline documentation, such as Wikipedia Kiwix, then i advise an extra SSD to store all those ZIM files.
- Perhaps a single day to create the two sticks.
- Avoid cheap USB sticks, or microSD cards (they break or get lost quickly)
- Test before emergency: Verify your USB boots successfully on at least one computer
- Update schedule: Refresh your kit every 6-12 months for latest drivers and security patches
- https://ventoy.net for multi ISO boot from single stick.
- SSD drives: https://pendrivelinux.com/fastest-usb-flash-drives/
  
> NOTE: SLC NAND outperforms many newer USB sticks. Some SLC NAND sticks can survive 25+ years. But they might be more expensive and have less storage. If you can get them, do it. Especially for sensitive files, such as: password databases, keys, documents, etc.

### Why USB technology matters.

- SLC NAND: Minimum lifespan: 5-7 years, (average lifespan: 10 years) (I owned a 64MB SLC stick that lasted 25+ years). Military grade.
- MLC NAND: Minimum lifespan: 2 year. Enterprise grade. (average lifespan: 5 years)
- TLC NAND: Minimum lifespan: 1 year. Consumer grade. (average lifespan: 1-2 years)
- QLC NAND: Minimum lifespan: 1 year. Consumer grade. (average lifespan: 6 months to 1 year)

You don't want a emergency USB stick to fail, hence I recommend SLC then MLC, and otherwise: TLC/QLC (but then buy 4-5 sticks and make duplicates of the master USB and stow them away)


## USB stick can run on:

- Windows (most hardware/ OS versions)
- 64bit recommended.
  - 32bit (no UEFI): run DSL.iso, or Tinycorelinux.iso, Alpine.
  - embedded: DSL.iso
  - ARM: no support! if you anticipate ARM, download proper Linux versions for it.
  
- Linux (most hardware/ OSversions)
- 64bit recommended.
  - 32bit (no UEFI): run DSL.iso, or Tinycorelinux.iso, Alpine.
  - embedded: DSL.iso
  - ARM: no support! if you anticipate ARM, download proper Linux versions for it.
  
## Recommended USB Structure

```
root
hash.bat (checksumming)
verify.bat (checksumming)
|
EmergencyUSB/
├── LiveOS/
│   ├── MediaCreationTool_22H2.exe (create Windows ISO with it)
│   ├── virtualbox-7.2_7.2.4.deb   (~100MB used to virtualize Windows ISO)
│   ├── ubuntu-24.04.iso           (~4-7 GB) - recommended
|   ├── linux-mint.iso             (~3 GB) - recommended
|   ├── Qubes.iso                  (~7GB) - deserves a dedicated single stick.
|   ├── FreeBSD.img                (~1.5 GB)
│   ├── systemrescue.iso           (~1 GB) - recommended
│   ├── tails.img                  (~1.5 GB) - might not work on new hardware!
│   ├── puppy-linux.iso            (~500 MB) - recommended
|   ├── slax.iso                   (~500 MB)
|   ├── alpine.iso                 (~400 MB) - recommended
|   ├── tinycorelinux.iso          (~200 MB) - no UEFI!
│   ├── DSL.iso                    (~50 MB) - no UEFI!
│   └── hirens-bootcd-pe.iso       (~2 GB) - recommended
│
├── AI/                            (~8 GB total)
│   ├── Models/
|
├── AppImages/                     (~1 GB total)
│   ├── firefox.AppImage
│   ├── libreoffice.AppImage
│   ├── gparted.AppImage
│   ├── keepassxc.AppImage
│   └── etcher.AppImage
│
├── WindowsPortable/                (~2-14 GB) - it is better to make a big ZIP file of it,
│   |                                         as it contains tens of thousands of small files!
│   ├── PortableApps/
│   ├── EmergencyKit/              (Emsisoft)
│   ├── PuTTYPortable/
│   └── WinSCPPortable/
|
├── Software/
│   ├── 7z.msi (required to unzip windows stuff)
│   ├── peazip-10.8.0.WIN64.exe (backup in case 7z is corrupted)
│   ├── 7z.exe (alternative)
│   ├── 7z2501-linux-x64.tar.xz (linux)
│   ├── 7z2501-x64.exe (alternative)
│   ├── Antivirus: Avira, Eset or ClamAV. (portable if possible)
│   ├── comet_installer_latest.exe (browser)
│   ├── Core-Temp-setup-v1.19.5.69.exe
│   ├── Eraser 6.2.0.2996.exe
│   ├── FedoraMediaWriter-win64-5.2.9.exe
│   ├── FirefoxPortable_146.0.1_English.paf.exe
│   ├── gpg4win-4.4.1.exe
│   ├── KeePass-2.60-Setup.exe
│   ├── KeePass-2.60.zip
│   ├── KeePassXC-2.7.11-Win64.msi
│   ├── LiberKey_5.8.1129.exe
│   ├── Ninite Package: 7Zip AVG AnyDesk Avast Avira Brave CCleaner Installer.exe
│   ├── npp.8.9.Installer.x64.exe (notepadd++)
│   ├── MBsetup.exe (Malwarebytes)
│   ├── PortableApps.com_Platform_Setup_30.1.3.paf.exe
│   ├── Quickhash-GUI-Windows-v3.3.4.zip
│   ├── rcsetup.exe (Recuva free)
│   ├── rufus-4.11.exe
│   ├── rufus-4.11p.exe (portable)
│   ├── Sandboxie-Classic-x64-v5.71.9.exe (to check files before installing)
│   ├── Sandboxie-Plus-x64-v1.16.9.exe
│   ├── SetupImgBurn_2.5.8.0.exe (making new ISO's, burning)
│   ├── SumatraPDF-3.5.2-64-install.exe
│   ├── SDI_1.26.0.7z (Snappy drivers Lite, offline drivers)
│   ├── syncthing-windows-setup.exe
│   ├── tailscale-setup-1.92.5.exe
│   ├── testdisk-7.3-WIP.win.zip (PhotoRec, disk testing tools)
│   ├── Temple.zip (USB disk checker)
│   ├── teracopy.exe (fast copy)
│   ├── tor-browser-windows-x86_64-portable-15.0.4.exe
│   ├── tor-browser-windows-x86_64-portable-15.0.4.exe.asc (checksum)
│   ├── TreeSizeFreeSetup.exe
│   ├── VeraCrypt Portable 1.26.24.exe
│   ├── vlc-3.0.23-win32.zip
│   ├── WinSCP-6.5.5-Setup.exe
│   ├── YUMI-exFAT-1.0.3.3.exe
│   ├── wireshark-portable-win64-4.4.9-20-setup.exe
│   ├── windowsScripts-master.zip
│   └── etc.
|
├── Tools/
│   ├── ddrescue/
│   ├── clonezilla/
│   ├── smartctl/
│   └── wifi-drivers/
│
├── Scripts/
│   ├── Batch Collection: https://github.com/fkie-cad/windowsScripts
│   ├── backup.sh
│   ├── mount-all.sh
│   ├── network-reset.sh
│   └── disk-check.sh
│
├── Docs/                          (~5-10 GB)
│   ├── Kiwix/
│   │   └── wikipedia_en.zim
│   ├── linux-commands.pdf
│   ├── recovery-notes.txt
│   ├── network-troubleshooting.pdf
│   └── first-aid.pdf
├── Preparedness/   <- download these from governmental websites (your local readiness docs)
│   ├── community_disaster_preparedness_guide.pdf
│   ├── ready_gov_emergency_supply_list.pdf
│   ├── ready_gov_family_plan.pdf
│   ├── ready_gov_hazard_sheets.pdf
│   └── international_handbook_emergency_management.pdf
│
├── VPN/
│   ├── openvpn.ovpn
│   └── wireguard.conf
│
├── Passwords/
│   └── vault.kdbx                 (encrypted)
│
├── Backups/                       (remaining space)
│   └── important-files/
│
└── README.md                      (this guide)
```

Total approximate size: 12-24 GB minimum, depending on files. 

> It is a good idea to leave a few GBs untouched for writing, and the USB is also faster with less files.

## Emergency Quick Start

If you're in an emergency RIGHT NOW:

1. System won't boot? - Boot from SystemRescue or Ubuntu
2. Need to recover files? - Use SystemRescue, then run TestDisk/PhotoRec
3. Suspect malware? - Boot into a live Linux, scan with portable antivirus
4. Need privacy/anonymity? - Use Tails OS
5. Forgot Windows password? - Boot SystemRescue or Hiren's BootCD PE

---
### Windows ISO

Download media creation tool and generate an ISO:

https://www.microsoft.com/en-us/software-download/windows10

https://go.microsoft.com/fwlink/?LinkId=2265055

Then download **Virtual box** to run the virtualized ISO from Linux:

https://www.virtualbox.org/wiki/Linux_Downloads

From Ubuntu 22.04 Live:

https://download.virtualbox.org/virtualbox/7.2.4/virtualbox-7.2_7.2.4-170995~Ubuntu~jammy_amd64.deb

1. Command for Linux to run it: `sudo apt install ./virtualbox-7.2_7.2.4-170995~Ubuntu~jammy_amd64.deb`
   
2. Verify: `virtualbox --help`
   
3. Run it: `virtualbox`

## 1. Bootable Live Linux Distributions

These let you boot any PC into Linux without installing anything.

### Ubuntu (general-purpose live) - ~4-7 GB

Best for: General rescue, hardware support, everyday tasks

- Download: https://ubuntu.com/download/desktop
- Great hardware support and easy to use

### Linux Mint (user-friendly live) - ~3 GB

Best for: Users familiar with Windows interface

- Download: https://linuxmint.com/
- Based on Ubuntu, lots of drivers included
- Familiar desktop environment for Windows users

### Qubes OS

About 7GB, full OS.

https://www.qubes-os.org/

### SystemRescue (specialized rescue tools) - ~1 GB

Best for: System repair, data recovery, disk management

- Download: https://system-rescue.org/
- AppImage USB writer: https://fastly-cdn.system-rescue.org/download/usbwriter/1.1.0/sysrescueusbwriter-x86_64.AppImage
- Designed to fix broken systems and recover data
- Includes GParted, TestDisk, network tools, and more

### Tails OS (privacy-focused) - ~1.5 GB

> Cons: might not work on all systems! test first!

Best for: Anonymous browsing, privacy-critical situations

- Download: https://download.tails.net/tails/stable/tails-amd64-7.3.1/tails-amd64-7.3.1.img
- Torrent: https://tails.net/torrents/files/tails-amd64-7.3.1.img.torrent
- Installation guide: https://tails.net/install/windows/index.en.html
- Routes all connections through Tor network

### Puppy Linux (lightweight for old hardware) - ~300-500 MB

Best for: Very old computers, minimal resource usage

- 32-bit (older machines): https://sourceforge.net/projects/pb-gh-releases/files/TrixiePup32Retro_release/
- 64-bit (newer machines): https://sourceforge.net/projects/pb-gh-releases/files/TrixiePup64Wayland_release/
- Runs entirely in RAM, extremely fast

### DSL (damnsmalllinux) 50MB

> Note: does not support UEFI!

Yes, an ISO with a Linux OS just 50MB! (useful to have for older or embedded systems)

https://www.damnsmalllinux.org/

### Slax Linux

Under 500MB ISO

https://www.slax.org/#getslax

### Alpine Linux

https://www.alpinelinux.org/downloads/

### Tiny Core Linux

> Note: does not support UEFI!

20MB to 250MB (very small)

http://tinycorelinux.net/downloads.html

### FreeBSD

https://www.freebsd.org/where/

Image: 
https://download.freebsd.org/releases/amd64/amd64/ISO-IMAGES/15.0/FreeBSD-15.0-RELEASE-amd64-memstick.img

### Hiren's BootCD PE (Windows-based rescue)
Best for: Windows password resets, Windows-specific repairs

https://www.hirensbootcd.org/download/

- Search for "Hiren's BootCD PE" (official site changes frequently)
- Includes Windows PE environment with repair tools
- Password reset utilities and disk tools

### Pendrive Linux

https://pendrivelinux.com/

---

## 2. Multi-Boot Setup with Ventoy

Recommended: Use Ventoy to boot multiple ISOs from one USB.

- Download: https://ventoy.net
- Install it, see documentation on how to (save documentation!)
- Simply copy ISO files to the USB drive
- Boot menu automatically appears with all available ISOs
- Supports persistent storage for live systems

Documentation: https://www.ventoy.net/en/doc_start.html

---

## 3. Verifying Your Downloads (Critical for Security)

Always verify ISO checksums before using them. Compromised rescue media can make things worse.

### On Linux:
```bash
sha256sum downloaded-file.iso
# Compare output with official checksum from download page
```

### On Windows:
```powershell
certutil -hashfile downloaded-file.iso SHA256
# Compare output with official checksum
```

Check the official website for the correct SHA256 hash and verify they match exactly.

---

## 4. Portable Apps for Linux (AppImages)

AppImages are portable, self-contained Linux apps. Download, make executable, and run.

Browse thousands of apps:
- AppImage app list: https://appimage.github.io/apps/
- Portable Linux Apps catalog: https://portable-linux-apps.github.io/
- Portable Linux Apps: https://portable-linux-apps.github.io/appimages.html

### Essential AppImages

#### Productivity & Everyday Tools
- LibreOffice - Full office suite (~300 MB)
  - https://www.libreoffice.org/download/appimage/
- Firefox - Web browser (~100 MB)
  - https://appimage.github.io/apps/?name=firefox
- Chromium - Alternative browser (~150 MB)
  - https://appimage.github.io/apps/?name=chromium

#### System & Disk Tools
- GParted - Disk partition editor (~100 MB)
  - Search "gparted" on https://appimage.github.io/apps/
  - Resize, create, delete partitions safely
- Etcher - Create bootable USB drives (~150 MB)
  - Search "etcher" on https://appimage.github.io/apps/
  - Easy ISO to USB writer

#### Utilities
- Kiwix - Offline Wikipedia & documentation (~50 MB + content)
  - Search "kiwix" on https://appimage.github.io/apps/
  - Download Wikipedia ZIM files separately
- KeePassXC - Password manager (~50 MB)
  - Keep your encrypted password database on the USB

### Making AppImages Executable

After downloading on Linux:
```bash
chmod +x name.AppImage
./name.AppImage
```

---

## 5. Windows Portable Apps

GPG4WIN (very important):

https://www.gpg4win.org/

Essential tools for Windows environments

Download and create a USB with many free portable apps:
PortableApps.com: https://portableapps.com/

https://ninite.com/

https://www.liberkey.com

http://www.winpenpack.com/

### Key Windows Portable Tools
- PuTTY Portable (SSH client)
- WinSCP Portable (file transfer)
- 7-Zip Portable (archive manager)
- Notepad++ Portable (text editor)
- VLC Portable (media player)
- CrystalDiskInfo Portable (disk health)

---

## 6. Data Recovery & Disk Tools

### Included in SystemRescue
- TestDisk - Recover lost partitions
  - Best for: Partition table recovery, boot sector repair
  - Recovers: FAT, NTFS, ext2/3/4, and more
- PhotoRec - File recovery by file signature
  - Best for: Recovering deleted photos, documents, archives
  - Works even if filesystem is damaged
  - Recovers: 400+ file formats

### Additional Tools to Include
- ddrescue - Clone failing disks (usually pre-installed in rescue distros)
  - Best for: Copying data from dying hard drives
  - Skips bad sectors and retries later
- Clonezilla - Full disk imaging and cloning
  - Download: https://clonezilla.org/
  - Best for: Complete system backups
- Foremost / Scalpel - Advanced file carving
  - Often included in rescue distros
  - Recovers files from raw disk data

---

## 7. Networking & Connectivity Tools

### Linux Tools (often pre-installed in rescue distros)
- Wireless drivers - Download common WiFi drivers for offline installation
- Network diagnostic tools:
  - `ping`, `traceroute`, `nmap`, `wireshark`
- SSH/SFTP clients - Built into most Linux distros

### Windows Portable Tools
- PuTTY - SSH client
- WinSCP - SFTP/SCP file transfer
- Advanced IP Scanner - Network discovery
- Angry IP Scanner - Fast network scanner

---

## 8. Security & Antivirus Tools

### Emsisoft Emergency Kit (Windows)
- Download: https://www.emsisoft.com/en/home/emergency-kit/
- Portable malware scanner for Windows
- No installation required

### ClamAV (Linux)
- Usually available in live Linux distributions
- Open-source antivirus scanner

### Rootkit Scanners
- chkrootkit - Linux rootkit detector
- rkhunter - Rootkit Hunter for Linux
- Both often pre-installed in SystemRescue

---

## 9. Offline Reference & Documentation

When internet is unavailable, having offline docs is essential.

### Essential Documentation (~5-10 GB recommended)
- Kiwix offline content: https://kiwix.org/en/
  - Wikipedia (English: ~100 GB compressed, or selection)
  - Stack Overflow archives
  - Medical/first aid wikis
  - Technical documentation
- Linux command cheat sheets (PDF)
- Filesystem & partitioning guides
- Network troubleshooting guides
- First aid / medical reference (PDF)
- Your important documents (encrypted)

### Password Management
- KeePassXC AppImage with your encrypted vault.kdbx
- Keep backup codes for 2FA in encrypted file

---

## 10. Useful Scripts & Configs

Keep automation scripts for common emergency tasks.

### Example Scripts Directory
```
/EmergencyUSB/Scripts/
├── backup.sh              # Quick file backup script
├── mount-all.sh           # Auto-mount all detected drives
├── network-reset.sh       # Reset network configuration
├── disk-check.sh          # Check all disks for errors
├── find-large-files.sh    # Locate large files eating space
└── wifi-setup.sh          # Configure WiFi from command line
```

### Example Configs Directory
```
/EmergencyUSB/Configs/
├── ssh_config             # Your SSH configuration
├── openvpn.ovpn          # VPN configuration
├── wireguard.conf        # Alternative VPN config
├── firewall.rules        # Basic firewall rules
└── backup-list.txt       # Critical files to backup
```

---

## 11. Disk Image Burning Tools

### From Linux
- MX Linux USB Maker: https://mxlinux.org/wiki/help-files/help-mx-mx-live-usb-maker/
- SystemRescue USB Writer: https://gitlab.com/systemrescue/systemrescue-usbwriter
- USBImager: https://gitlab.com/bztsrc/usbimager/-/releases
- EasyDD: https://easyos.org/install/how-to-write-easyos-to-a-flash-drive.html#EasyDD_frontend_for_dd

### From Windows
- Rufus: https://rufus.ie/ (recommended, fast and reliable)
- Fedora Media Writer: https://github.com/FedoraQt/MediaWriter/releases
- USBImager: https://gitlab.com/bztsrc/usbimager/-/releases

### From Android
- EtchDroid: https://etchdroid.app/

### For CD/DVD
- Puppy Linux LiveDVD guide: https://wikka.puppylinux.com/LiveDVD


## 12. Free Downloadable Command References

### Combined Windows & Linux

SS64 Command Line Reference (Best option - comprehensive)
- Website: https://ss64.com/
- Available as offline HTML or PDF
- Covers: CMD, PowerShell, Bash, macOS, Oracle, SQL
- You can download the entire site for offline use with tools like `wget` or HTTrack

### Linux/Bash Specific

Linux Command Line Cheat Sheet by Dave Child
- Direct PDF: https://cheatography.com/davechild/cheat-sheets/linux-command-line/
- Quick reference, fits on 1-2 pages
- Free download

TLDR Pages (Community-driven simplified man pages)
- GitHub: https://github.com/tldr-pages/tldr
- Download the entire repository as ZIP
- Much more beginner-friendly than traditional man pages
- Example-focused

Cheat.sh

https://github.com/chubin/cheat.sh

GNU Coreutils Manual (Official)
- PDF download: https://www.gnu.org/software/coreutils/manual/coreutils.pdf
- Comprehensive but dense
- ~200 pages

### Windows CMD/PowerShell Specific

Windows Command Reference (Microsoft Official)
- Download: https://www.microsoft.com/en-us/download/details.aspx?id=56846
- Official documentation from Microsoft
- Available as downloadable help files

PowerShell Cheat Sheet
- Download from: https://cheatography.com/davechild/cheat-sheets/powershell/
- PDF format

### Best Approach for Your USB

I'd recommend including:

1. SS64 offline HTML copy (~50MB) - most comprehensive
2. TLDR pages ZIP (~5MB) - quick examples
3. Linux/Windows cheat sheet PDFs (~2MB total) - quick glance
4. Your own custom reference with commands you actually use

---

## 13. Testing Your Emergency Kit

Test your USB BEFORE you need it in an emergency.

### Testing Checklist
- [ ] USB boots successfully on at least 2 different computers
- [ ] Test each ISO boots and loads properly
- [ ] Verify you can mount and read your main system drive
- [ ] Test WiFi connectivity from live environment
- [ ] Confirm AppImages execute without errors
- [ ] Verify password database opens correctly
- [ ] Test a small file recovery with TestDisk/PhotoRec
- [ ] Check all scripts run without syntax errors

### Common Boot Issues
- UEFI vs Legacy BIOS: May need to adjust BIOS settings
- Secure Boot: Disable in BIOS if Linux won't boot
- Boot order: USB must be first in boot priority
- USB port: Try different USB ports (USB 2.0 sometimes more reliable for booting)

---

## 14. Maintenance Schedule

### Every 6 Months
- [ ] Update all Linux ISOs to latest versions
- [ ] Update portable applications
- [ ] Refresh Kiwix offline content
- [ ] Update VPN configurations
- [ ] Test boot on your main computer
- [ ] Verify checksums of new downloads
- [ ] Update scripts and documentation
- [ ] Backup important files to USB

### After Major OS Updates
- [ ] Download new rescue ISOs
- [ ] Test compatibility with your hardware

---

## 15. Alternative Resources (Use as Last Resort)

⚠️ Warning: Use these only if official sources are unavailable. These archives may contain outdated, compromised, or non-functional distributions.

### Archive.org Collections
- Linux Distros: https://archive.org/details/Distros
- Operating Systems: https://archive.org/details/operatingsystemsoftware
- Puppy Linux Portable Apps (34 GB): https://archive.org/details/Puppy_Linux_Portable_Apps

Always verify checksums when using alternative sources.

---

## Additional Resources

- Borecraft USB Emergency Kit tips: https://borecraft.com/usb-emergency-kit/
- SystemRescue documentation: https://www.system-rescue.org/manual/
- Ubuntu help documentation (offline copy recommended)
- https://internet-in-a-box.org/ (very good extra solution)

---

## Emergency Scenarios Quick Reference

| Problem | Tool to Use | Steps |
|---------|-------------|-------|
| System won't boot | SystemRescue or Ubuntu | Boot USB - Check disk errors - Repair bootloader |
| Forgot password | Hiren's BootCD PE or SystemRescue | Boot USB - Use password reset tool |
| Ransomware/Malware | Tails or Ubuntu + Emsisoft | Boot clean OS - Scan infected drive - Don't mount it read-write |
| Deleted files | SystemRescue - PhotoRec | Boot USB - Run PhotoRec - Save to different drive |
| Corrupted partition | SystemRescue - TestDisk | Boot USB - Run TestDisk - Rebuild partition table |
| Dying hard drive | SystemRescue - ddrescue | Boot USB - Clone to healthy drive immediately |
| Need privacy | Tails OS | Boot Tails - All traffic routes through Tor |
| Create new rescue USB | Any live Linux + Etcher | Boot - Run Etcher AppImage - Write ISO to new USB |

---

## Final Tips

1. Label your USB clearly: "Emergency Rescue Kit - Boot from USB"
2. Keep it in a safe, accessible place: Not much use if you can't find it
3. Make two: One for home, one for travel/off-site backup
4. Encrypt sensitive partitions: Use LUKS encryption for personal files
5. Practice using the tools: Don't wait for an emergency to learn
6. Document your specific setup: Add notes about your hardware quirks
7. Share with family/friends: They might need help too

Remember: This USB is only useful if you maintain it and know how to use it.
