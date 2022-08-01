# PDF Unlocker

Sometimes banks and other institutions do not accept password-protected PDF's as evidence for applications etc. This script provides a friendly way to remove the passwords. It's basically just a wrapper for [qpdf](https://github.com/qpdf/qpdf).

# How to use

1. Clone this repo to your computer.

2. Download a [qpdf Windows release](https://github.com/qpdf/qpdf); it will be named something like *qpdf-10.6.3-bin-mingw64.zip*.

3. Extract it into the root of this repo, e.g.:
```
pdf-unlocker
├───qpdf-10.6.3
├───Files To Decrypt
├───Decrypted
├───Run This.ps1
```
4. Place your password protected PDF files inside ```.\Files To Decrypt\```

5. Run the script and enter the password as prompted.

7. The unlocked files should appear in ```.\Decrypted\```
