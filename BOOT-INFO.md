# COMMON BOOT & BIOS KEYS (CHEAT SHEET)

> If UEFI is not supported, some Linux versions, disable it in BIOS: Secure Boot settings, disable.

## 1. BOOT MENU (ONE-TIME BOOT DEVICE SELECTION)

Use this to choose USB / Live OS without changing BIOS settings.

Most common:

* Delete key
* F12  - very common (Dell, Lenovo, others)
* F11
* F10
* F8
* ESC

Try in this order:

```
F12 -> F11 -> ESC -> F10 -> F8
```

Press repeatedly immediately after power on.

---

## 2. BIOS / UEFI SETUP

Use this to:

* disable Secure Boot
* enable Legacy / CSM
* change boot order

Most common:

* DEL (Delete)  ← *desktops, custom builds*
* F2            ← *laptops*
* ESC           ← *HP / some laptops*

Try:

```
DEL -> F2 -> ESC -> F10
```

---

## 3. BRAND-SPECIFIC KEYS (MOST COMMON)


### Biostar (American Megatrends)

* BIOS: Delete key.
  
### Dell

* Boot Menu: F12
* BIOS: F2

### HP

* Boot Menu: ESC, then F9
* BIOS: ESC, then F10

### Lenovo

* Boot Menu: F12
* BIOS: F1 or F2
* Some models: small pinhole “Novo” button

### ASUS

* Boot Menu: F8 or ESC
* BIOS: DEL or F2

### Acer

* Boot Menu: F12
* BIOS: DEL or F2
  *(Sometimes F12 must be enabled in BIOS first)*

### MSI

* Boot Menu: F11
* BIOS: DEL

### Gigabyte

* Boot Menu: F12
* BIOS: DEL

### Toshiba

* Boot Menu: F12
* BIOS: F2

### Sony VAIO

* Boot Menu: ASSIST
* BIOS: F2

---

## 4. WINDOWS SPECIAL KEYS (IF WINDOWS STILL BOOTS)

* Shift + Restart
  -> Troubleshoot
  -> Advanced Options
  -> UEFI Firmware Settings

Useful if keyboard timing is impossible.

---

## 5. WHEN NOTHING WORKS (IMPORTANT)

If:

* keyboard doesn’t register
* fast boot skips keys
* laptop boots too fast

Try:

0. Remove any USB applicances, printers, hubs. (only the stick)
1. Power off completely
2. Unplug power
3. Remove battery (if possible)
4. Plug power back in
5. Power on and immediately mash key

Use USB keyboard, not Bluetooth.

---

## 6. SECURE BOOT TROUBLESHOOTING

If USB does not appear:

* Disable Secure Boot
* Enable Legacy / CSM
* Try different USB port (USB-A preferred)
* Try different LiveOS (SystemRescue / Ubuntu)

---

## 7. ABSOLUTE FALLBACK

If no key works:

* Remove internal disk
* Boot with disk disconnected
* Many systems then show boot menu

Extreme, but effective.

---
