# Emergency USB Reader BOOT SYSTEM

A premade `EMERGENCY-READER.IMG` has been prepared and put inside `/LiveOS/`

To create a very small linux from scratch yourself, (about 15MB), just run `install-reader.sh`

# Reader

The reader binary is a simple file reader for emergency access, when nothing works or for somehow that doesn't understand consoles and terminals. It is precompiled as `reader`. 

If you want to compile it yourself:

`gcc -g -o reader reader.c`

And then overwrite the `reader` file.

The `install-reader.sh` script then automatically copies it over into `/root/reader`. (Do not do this manually.)

