# EmergencyUSB – Disaster-Proof README

This USB is designed for extreme emergencies:

* war or armed conflict
* long-term power or internet outages
* infrastructure collapse
* disaster recovery when no help is available
* extreme computer failure
* AI/ML botnet attacks, ransomware
* mobbing, looting, civil unrest, civil war.
* under scrutiny by governments or secret agencies.

It assumes:

* no internet
* minimal hardware
* high stress / low concentration

This document is written to be readable under pressure.

---

## 1. FIRST THINGS FIRST (READ THIS)

1. Do not panic. This USB contains multiple ways to recover.
2. Do nothing irreversible first.
3. Make backups before repairs.
4. Write down what you do. Fatigue causes mistakes.

If unsure, boot a Live OS and inspect the system safely.

---

## 2. BOOTING A COMPUTER (NO OS TRUSTED)

### Recommended order:

1. `systemrescue.iso`  (fast, reliable, professional tools)
2. `ubuntu-24.04.iso`  (hardware compatibility)
3. `linux-mint.iso`    (user friendly)
4. `hirens-bootcd-pe.iso` (Windows recovery)

### If boot fails:

* Disable Secure Boot
* Try Legacy / CSM mode
* Try another LiveOS

Never assume hardware is healthy.

---

## 3. DATA FIRST – ALWAYS

### If the disk might be failing:

1. Use ddrescue (Tools/ddrescue)
2. Image the disk to an external drive
3. Work on the copy, not the original

### File recovery:

* Use TestDisk / PhotoRec
* Use Recuva (Windows only)

If data matters: copy first, repair later.

---

## 4. WINDOWS SYSTEM RECOVERY

### Safe inspection:

* Boot Hiren’s BootCD PE
* Use portable tools only

### Common fixes:

* Disk errors -> `chkdsk` or LiveOS disk tools
* Drivers missing -> Snappy Driver Installer

### Reinstall Windows:

* Use `MediaCreationTool_22H2.exe`
* Create ISO
* Write using Rufus / Etcher

---

## 5. NETWORK & COMMUNICATION

### If networking fails:

1. Try wired connection first
2. Reset network scripts
3. Use alternative DNS

### VPN:

* OpenVPN config in `VPN/`
* WireGuard config in `VPN/`

### Privacy / censorship:

* Use Tor Browser (portable)

---

## 6. SECURITY & TRUST

### Passwords:

* Stored in `Passwords/vault.kdbx`
* Open with KeePass / KeePassXC

### Encryption:

* Use VeraCrypt Portable

### Verify files:

* Use `hash.bat`
* Use QuickHash GUI
* Check `.asc` signatures where available

Never trust unknown files without verification.

---

## 7. OFFLINE KNOWLEDGE

### Documentation:

* Wikipedia (Kiwix)
* Linux commands
* Network troubleshooting
* First aid

Knowledge may be more valuable than software.

---

## 8. SCRIPT COLLECTION

Batch and shell scripts are located in:

```
Scripts/
```

They are designed to:

* require no internet
* log actions
* avoid destructive defaults

If unsure, open scripts in a text editor first.

---

## 9. HARDWARE REALITY CHECK

Assume:

* old CPUs
* failing disks
* broken batteries
* no drivers

That is why multiple LiveOS and tools exist.

If one method fails, switch approach.

---

## 10. FINAL RULES

* Always make backups
* Never rush
* Verify before trusting
* Prefer reversible actions
* Keep this USB duplicated

This USB is a last-resort survival tool.
Treat it accordingly.

---

END OF DOCUMENT
