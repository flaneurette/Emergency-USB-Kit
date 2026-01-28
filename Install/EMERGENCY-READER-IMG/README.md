# Emergency USB Reader BOOT SYSTEM

A premade `EMERGENCY-READER.IMG` has been prepared and put inside `/LiveOS/`

To create a very small linux from scratch (about 15MB) just run `install-reader.sh`

# Reader

The reader binary is a simple file reader for emergency access, when nothing works or for someone that doesn't understand consoles and terminals. It is precompiled as `reader`. 

If you want to compile it yourself:

### Recompile as static binary (no dependencies!)
`gcc -static -Os -s reader.c -o reader`

### Verify it's truly static
`ldd reader`

The .sh script automatically copy it over into `/root/reader` (do not do this manually!)

