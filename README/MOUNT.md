# Mount Ventoy stick.

If you need to mount the Ventoy stick to access files, you can do this:

See if mapper exists:

```
cd /dev/mapper/
ls -la
```

If ventoy is mounted here, you could try to browse it. (often fails)

If so, then do:

```
sudo mount /dev/dm-1 /mnt/usb
cd /mnt/usb
ls -la
```

Often, ventoy is mounted numerically: /dev/dm-1. You won't see it all the time, hence I mention it here.

If that doesn't work, try another number: `dm-0` etc.
