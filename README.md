# Drive-Sanitization# DriveSanitization.ps1

A PowerShell script to securely sanitize a non-system drive by overwriting free space and optionally formatting the drive.

## Features

- Uses built-in Windows `cipher.exe` to overwrite deleted file data.
- Optionally formats the drive to remove all contents.
- Prevents accidental system drive wipe by requiring explicit drive letter input.

## Requirements

- Windows 10 or later
- PowerShell 5.1 or newer (with admin privileges)

## Usage

### 1. Overwrite free space only:
```powershell
.\DriveSanitization.ps1 -DriveLetter "E"
```
### 2. Overwrite and format drive (destructive):
powershell
Copy
Edit
.\DriveSanitization.ps1 -DriveLetter "F" -Format
You will be asked to confirm the format operation explicitly.

Important Notes
This script must be run as Administrator.

This will permanently erase data on the selected drive. Use with caution.

Do not use this on your system (C:) drive.

License
MIT License

yaml
Copy
Edit

---
