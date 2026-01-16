# Checksumming

We can check all files on the stick to see if they aren't corrupted by making checksums. Useful, if we later want to verify if the stick is still sane and in tact. Flash drives may degrade over time.

1. Move the two scripts to the root of the USB stick.

2. When you have added all files to the USB stick, run `hash.bat` once to generate checksums for all files.

3. Next time, run `verify.bat` to verify if all files are in tact and not corrupted. 

4. Maybe once a year, run `verify.bat` to see if the flash is still in tact. If not update stick with new files, or buy a new stick.

# Limitations

All hases are written to `hashes.md5` keep this file also in the root.

Check this file if there is weird data in it before storing. There should be just checksums and filepaths. Nothing else.

Some files cannot be computed for some reason or another, make note of that.
