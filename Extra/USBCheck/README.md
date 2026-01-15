# USB Detect

Profiles your USB sticks to detect vendor, chip version.

Note: USB devices might be cached, might not always work if you run these scripts.

Be careful with **ChipGenius**, as some versions have been reported to contain malware. Always scan a software at https://www.virustotal.com before using it.

### Use 

Open PowerShell as Administrator and run:

```
cd Desktop

Set-ExecutionPolicy RemoteSigned -Scope CurrentUser

.\usb-detect.ps1
```

If you cannot extract the VID or PID, try temple:

https://the-sz.com/products/temple/

And also scan it with virustotal before running it, to be sure. Extra advice: download sandboxy, and run it sanboxed. (just in case)

Sandboxy: https://sandboxie-plus.com/
