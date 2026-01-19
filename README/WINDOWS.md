# Running a Windows ISO on Ubuntu 22.04 via VirtualBox.

---

## Step 1: Download Windows ISO

* Use Microsoft’s Media Creation Tool direct links:

  * [Windows 10 Download Page](https://www.microsoft.com/en-us/software-download/windows10)
  * [Direct Media creation Tool](https://go.microsoft.com/fwlink/?LinkId=2265055)

Use that official software to make a ISO from **your current Windows** OS.

Save the ISO to /LiveOS/

---

## Step 2: Download VirtualBox for Ubuntu

* Use the official VirtualBox Linux downloads page:
  [VirtualBox Linux Downloads](https://www.virtualbox.org/wiki/Linux_Downloads)

* For Ubuntu 22.04 (Jammy), download this `.deb` package:

```text
https://download.virtualbox.org/virtualbox/7.2.4/virtualbox-7.2_7.2.4-170995~Ubuntu~jammy_amd64.deb
```

---

## Step 3: Install VirtualBox

Open a terminal and navigate to the folder where you downloaded the `.deb` file, e.g., `~/Downloads`:

```bash
cd ~/Downloads
sudo apt install ./virtualbox-7.2_7.2.4-170995~Ubuntu~jammy_amd64.deb
```

* `apt` will handle dependencies automatically.
* If using `dpkg` instead, you’d need to fix missing dependencies manually:

```bash
sudo dpkg -i virtualbox-7.2_7.2.4-170995~Ubuntu~jammy_amd64.deb
sudo apt-get install -f
```

---

## Step 4: Verify Installation

```bash
virtualbox --help
```

* If you see the help output, VirtualBox is installed correctly.

---

## Step 5: Launch VirtualBox

```bash
virtualbox
```

* Or open it from your desktop menu.

---

## Step 6: Create a Windows VM

1. Click “New” -> Name it (e.g., `Windows 10`)
2. Type: Microsoft Windows -> Version: Windows 10 (64-bit)
3. RAM: At least 4 GB (4096 MB) recommended
4. Hard Disk: Create VDI (dynamically allocated) -> ~60 GB
5. Storage: Under Controller: IDE, attach your Windows ISO

---

## Step 7: Start Windows Installation

* Click Start -> Windows will boot from the ISO.
* Go through the standard Windows installation process.

---

## Step 8: Optional – Guest Additions

* Menu -> Devices -> Insert Guest Additions CD Image
* Install inside Windows -> Reboot

Benefits: Better graphics, shared clipboard, drag & drop, shared folders.

---

If you’re running Ubuntu from Live USB without persistent storage, any VM you create or Windows installation will disappear after reboot. For a stable setup, you should either:

1. Install Ubuntu to disk first, or
   
3. Use a persistent Live USB with enough storage.

