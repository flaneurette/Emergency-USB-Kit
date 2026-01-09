# Emergency USB Kit Guide

> Creating a emergency USB stick is useful. This document tells you how.

### Requirements

- 2 to 3 USB sticks of good quality. Minimum of 32GB, recommended: 64GB or 128GB a piece. Higher is possible, but they might fail quicker. Avoid anything above 512GB.
- At least 2 USB sticks, because of the survival mantra: **one is none, two is one.**
- If you need offline documentation, such as Wikipedia Kiwix, then i advise and extra SSD to store all those ZIM files.
- Perhaps a single day to create the two sticks.
- Avoid cheap USB sticks, or microSD cards (the break or get lost quickly)
- Test before emergency: Verify your USB boots successfully on at least one computer
- Update schedule: Refresh your kit every 6 months for latest drivers and security patches

## Recommended USB Structure

```
EmergencyUSB/
├── LiveOS/
│   ├── ubuntu-24.04.iso           (~4 GB)
│   ├── systemrescue.iso           (~1 GB)
│   ├── tails.img                  (~1.5 GB)
│   ├── puppy-linux.iso            (~500 MB)
│   └── hirens-bootcd-pe.iso       (~2 GB)
│
├── AppImages/                      (~1 GB total)
│   ├── firefox.AppImage
│   ├── libreoffice.AppImage
│   ├── gparted.AppImage
│   ├── keepassxc.AppImage
│   └── etcher.AppImage
│
├── WindowsPortable/                (~2 GB)
│   ├── PortableApps/
│   ├── EmergencyKit/              (Emsisoft)
│   ├── PuTTYPortable/
│   └── WinSCPPortable/
│
├── Tools/
│   ├── ddrescue/
│   ├── clonezilla/
│   ├── smartctl/
│   └── wifi-drivers/
│
├── Scripts/
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
└── README.txt                     (this guide)
```

Total approximate size: 20-25 GB minimum, leaving room for personal files.

## Emergency Quick Start

If you're in an emergency RIGHT NOW:

1. System won't boot? - Boot from SystemRescue or Ubuntu
2. Need to recover files? - Use SystemRescue, then run TestDisk/PhotoRec
3. Suspect malware? - Boot into a live Linux, scan with portable antivirus
4. Need privacy/anonymity? - Use Tails OS
5. Forgot Windows password? - Boot SystemRescue or Hiren's BootCD PE

---

## 1. Bootable Live Linux Distributions

These let you boot any PC into Linux without installing anything.

### Ubuntu (general-purpose live) - ~4 GB
Best for: General rescue, hardware support, everyday tasks

- Download: https://ubuntu.com/download/desktop
- Windows: https://ubuntu.com/download/desktop/thank-you?version=24.04.3&architecture=amd64&lts=true
- Intel/AMD: https://ubuntu.com/download/desktop/thank-you?version=25.10&architecture=amd64
- Great hardware support and easy to use

### Linux Mint (user-friendly live) - ~3 GB
Best for: Users familiar with Windows interface

- Download: https://linuxmint.com/
- Based on Ubuntu, lots of drivers included
- Familiar desktop environment for Windows users

### SystemRescue (specialized rescue tools) - ~1 GB
Best for: System repair, data recovery, disk management

- Download: https://system-rescue.org/
- AppImage USB writer: https://fastly-cdn.system-rescue.org/download/usbwriter/1.1.0/sysrescueusbwriter-x86_64.AppImage
- Designed to fix broken systems and recover data
- Includes GParted, TestDisk, network tools, and more

### Tails OS (privacy-focused) - ~1.5 GB
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

### Hiren's BootCD PE (Windows-based rescue)
Best for: Windows password resets, Windows-specific repairs

- Search for "Hiren's BootCD PE" (official site changes frequently)
- Includes Windows PE environment with repair tools
- Password reset utilities and disk tools

---

## 2. Multi-Boot Setup with Ventoy

Recommended: Use Ventoy to boot multiple ISOs from one USB without reformatting.

- Download: https://ventoy.net
- Simply copy ISO files to the USB drive
- Boot menu automatically appears with all available ISOs
- Supports persistent storage for live systems

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

Essential tools for Windows environments or when booted into Windows PE.

Download and create a USB with many free portable apps:
- PortableApps.com: https://portableapps.com/

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
